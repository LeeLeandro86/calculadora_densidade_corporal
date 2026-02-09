import '../entities/resultado_calculo.dart';

abstract class CalculadoraRepository {
  Future<ResultadoCalculo> calcular3Dobras({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  });

  Future<ResultadoCalculo> calcular7Dobras({
    required String sexo,
    required List<double> dobras,
  });

  Future<String> obterClassificacao({
    required String sexo,
    required double idade,
    required double percentualGordura,
  });
}
