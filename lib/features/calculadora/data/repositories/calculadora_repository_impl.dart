import '../../domain/entities/resultado_calculo.dart';
import '../../domain/repositories/calculadora_repository.dart';
import '../datasources/calculadora_local_datasource.dart';

// Implementação concreta do repositório que delega os cálculos para o
// `CalculadoraLocalDataSource`. A responsabilidade do repositório é reunir
// passos (ex.: calcular densidade → percentual → classificação) e retornar
// uma entidade `ResultadoCalculo` para a camada de domínio/presenter.

class CalculadoraRepositoryImpl implements CalculadoraRepository {
  final CalculadoraLocalDataSource localDataSource;

  CalculadoraRepositoryImpl(this.localDataSource);

  @override
  Future<ResultadoCalculo> calcular3Dobras({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) async {
    final densidade = await localDataSource.calcularDensidade3Dobras(
      sexo: sexo,
      idade: idade,
      peitoral: peitoral,
      abdominal: abdominal,
      coxa: coxa,
    );

    final percentualGordura =
        await localDataSource.calcularPercentualGordura(densidade);

    final classificacao = await localDataSource.obterClassificacao(
      sexo: sexo,
      idade: idade,
      percentualGordura: percentualGordura,
    );

    return ResultadoCalculo(
      percentualGordura: percentualGordura,
      densidade: densidade,
      classificacao: classificacao,
    );
  }

  @override
  Future<ResultadoCalculo> calcular7Dobras({
    required String sexo,
    required List<double> dobras,
  }) async {
    final densidade = await localDataSource.calcularDensidade7Dobras(
      sexo: sexo,
      dobras: dobras,
    );

    final percentualGordura =
        await localDataSource.calcularPercentualGordura(densidade);

    // Usa idade 25 como padrão para classificação com 7 dobras
    final classificacao = await localDataSource.obterClassificacao(
      sexo: sexo,
      idade: 25,
      percentualGordura: percentualGordura,
    );

    return ResultadoCalculo(
      percentualGordura: percentualGordura,
      densidade: densidade,
      classificacao: classificacao,
    );
  }

  @override
  Future<String> obterClassificacao({
    required String sexo,
    required double idade,
    required double percentualGordura,
  }) {
    return localDataSource.obterClassificacao(
      sexo: sexo,
      idade: idade,
      percentualGordura: percentualGordura,
    );
  }
}
