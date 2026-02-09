import 'dart:math';

class DensidadeCorporalCalculator {
  /// Calcula a densidade corporal usando Jackson-Pollock para 7 dobras
  /// 
  /// [sexo]: 'masculino' ou 'feminino'
  /// [dobras]: Lista com 7 dobras cutâneas em mm
  /// Retorna: Densidade corporal (g/cm³)
  static double calcularDensidade7Dobras({
    required String sexo,
    required List<double> dobras,
  }) {
    if (dobras.length != 7) {
      throw ArgumentError('Esperado 7 dobras, recebido ${dobras.length}');
    }

    double somaDobtras = dobras.fold(0, (a, b) => a + b);
    double log10Soma = log(somaDobtras) / ln10;

    double densidade;
    if (sexo.toLowerCase() == 'masculino') {
      // Fórmula Jackson-Pollock para homens (7 dobras)
      densidade = 1.0970 - (0.46971 * log10Soma);
    } else {
      // Fórmula Jackson-Pollock para mulheres (7 dobras)
      densidade = 1.06130 - (0.63130 * log10Soma);
    }

    return densidade;
  }

  /// Calcula a densidade corporal usando Jackson-Pollock para 3 dobras
  /// 
  /// [sexo]: 'masculino' ou 'feminino'
  /// [peitoral]: Dobra peitoral em mm
  /// [abdominal]: Dobra abdominal em mm
  /// [coxa]: Dobra da coxa em mm
  /// Retorna: Densidade corporal (g/cm³)
  static double calcularDensidade3Dobras({
    required String sexo,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) {
    double somaDobras = peitoral + abdominal + coxa;
    double log10Soma = log(somaDobras) / ln10;

    double densidade;
    if (sexo.toLowerCase() == 'masculino') {
      // Fórmula Jackson-Pollock para homens (3 dobras)
      densidade = 1.10938 - (0.0008267 * somaDobras) + (0.0000016 * somaDobras * somaDobras) - (0.0002574 * 25); // 25 anos padrão
    } else {
      // Fórmula Jackson-Pollock para mulheres (3 dobras)
      densidade = 1.0994921 - (0.0009929 * somaDobras) + (0.0000023 * somaDobras * somaDobras) - (0.0001392 * 25); // 25 anos padrão
    }

    return densidade;
  }

  /// Calcula densidade corporal considerando a idade
  static double calcularDensidade3DobrasComIdade({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) {
    double somaDobras = peitoral + abdominal + coxa;

    double densidade;
    if (sexo.toLowerCase() == 'masculino') {
      // Fórmula Jackson-Pollock para homens (3 dobras) com idade
      densidade = 1.10938 - (0.0008267 * somaDobras) + (0.0000016 * somaDobras * somaDobras) - (0.0002574 * idade);
    } else {
      // Fórmula Jackson-Pollock para mulheres (3 dobras) com idade
      densidade = 1.0994921 - (0.0009929 * somaDobras) + (0.0000023 * somaDobras * somaDobras) - (0.0001392 * idade);
    }

    return densidade;
  }

  /// Converte densidade corporal em percentual de gordura usando equação de Siri
  /// 
  /// [densidade]: Densidade corporal (g/cm³)
  /// Retorna: Percentual de gordura (%)
  static double calcularPercentualGordura(double densidade) {
    // Equação de Siri: % gordura = (495 / densidade) - 450
    double percentual = (495 / densidade) - 450;
    return percentual.clamp(0, 100); // Garante que está entre 0 e 100%
  }

  /// Obtém a classificação do percentual de gordura por idade e sexo
  static String obterClassificacao({
    required String sexo,
    required double idade,
    required double percentualGordura,
  }) {
    bool ehMulher = sexo.toLowerCase() == 'feminino';
    
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

// Constante para log de base 10
const double ln10 = 2.302585092994046;
