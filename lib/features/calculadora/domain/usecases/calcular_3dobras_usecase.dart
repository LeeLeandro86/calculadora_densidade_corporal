import '../entities/resultado_calculo.dart';
import '../repositories/calculadora_repository.dart';

// Caso de uso que encapsula a ação de calcular densidade com 3 dobras.
// A camada de apresentação invoca este usecase em vez de chamar o
// repositório diretamente — isso deixa as regras de negócio isoladas.
class Calcular3DobrasUseCase {
  final CalculadoraRepository repository;

  Calcular3DobrasUseCase(this.repository);

  Future<ResultadoCalculo> call({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) {
    return repository.calcular3Dobras(
      sexo: sexo,
      idade: idade,
      peitoral: peitoral,
      abdominal: abdominal,
      coxa: coxa,
    );
  }
}
