import 'dart:math';

// Fonte de dados local que contém as implementações das fórmulas de
// Jackson-Pollock e regras de classificação. Tudo aqui é puro cálculo
// (sem chamadas a rede ou banco) — por isso fica na camada de data,
// mas é local.
const double ln10 = 2.302585092994046;

abstract class CalculadoraLocalDataSource {
  Future<double> calcularDensidade3Dobras({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  });

  Future<double> calcularDensidade7Dobras({
    required String sexo,
    required List<double> dobras,
  });

  Future<double> calcularPercentualGordura(double densidade);

  Future<String> obterClassificacao({
    required String sexo,
    required double idade,
    required double percentualGordura,
  });
}

class CalculadoraLocalDataSourceImpl implements CalculadoraLocalDataSource {
  @override
  Future<double> calcularDensidade3Dobras({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) async {
    var somaDobras = peitoral + abdominal + coxa;

    double densidade;
    if (sexo.toLowerCase() == 'masculino') {
      densidade = 1.10938 -
          (0.0008267 * somaDobras) +
          (0.0000016 * somaDobras * somaDobras) -
          (0.0002574 * idade);
    } else {
      densidade = 1.0994921 -
          (0.0009929 * somaDobras) +
          (0.0000023 * somaDobras * somaDobras) -
          (0.0001392 * idade);
    }

    return densidade;
  }

  @override
  Future<double> calcularDensidade7Dobras({
    required String sexo,
    required List<double> dobras,
  }) async {
    if (dobras.length != 7) {
      throw ArgumentError('Esperado 7 dobras, recebido ${dobras.length}');
    }

    var somaDobras = dobras.fold(0.0, (a, b) => a + b);
    var log10Soma = log(somaDobras) / ln10;

    double densidade;
    if (sexo.toLowerCase() == 'masculino') {
      densidade = 1.0970 - (0.46971 * log10Soma);
    } else {
      densidade = 1.06130 - (0.63130 * log10Soma);
    }

    return densidade;
  }

  @override
  Future<double> calcularPercentualGordura(double densidade) async {
    var percentual = (495 / densidade) - 450;
    return percentual.clamp(0, 100);
  }

  @override
  Future<String> obterClassificacao({
    required String sexo,
    required double idade,
    required double percentualGordura,
  }) async {
    var ehMulher = sexo.toLowerCase() == 'feminino';

    if (idade < 30) {
      if (ehMulher) {
        if (percentualGordura < 17) return 'Essencial';
        if (percentualGordura < 24) return 'Atleta';
        if (percentualGordura < 31) return 'Fitness';
        if (percentualGordura < 38) return 'Média';
        return 'Acima da Média';
      } else {
        if (percentualGordura < 6) return 'Essencial';
        if (percentualGordura < 13) return 'Atleta';
        if (percentualGordura < 17) return 'Fitness';
        if (percentualGordura < 25) return 'Média';
        return 'Acima da Média';
      }
    } else if (idade < 40) {
      if (ehMulher) {
        if (percentualGordura < 18) return 'Essencial';
        if (percentualGordura < 25) return 'Atleta';
        if (percentualGordura < 32) return 'Fitness';
        if (percentualGordura < 39) return 'Média';
        return 'Acima da Média';
      } else {
        if (percentualGordura < 7) return 'Essencial';
        if (percentualGordura < 14) return 'Atleta';
        if (percentualGordura < 18) return 'Fitness';
        if (percentualGordura < 26) return 'Média';
        return 'Acima da Média';
      }
    } else {
      if (ehMulher) {
        if (percentualGordura < 20) return 'Essencial';
        if (percentualGordura < 27) return 'Atleta';
        if (percentualGordura < 34) return 'Fitness';
        if (percentualGordura < 41) return 'Média';
        return 'Acima da Média';
      } else {
        if (percentualGordura < 8) return 'Essencial';
        if (percentualGordura < 15) return 'Atleta';
        if (percentualGordura < 19) return 'Fitness';
        if (percentualGordura < 27) return 'Média';
        return 'Acima da Média';
      }
    }
  }
}
