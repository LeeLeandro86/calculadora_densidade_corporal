import '../entities/resultado_calculo.dart';
import '../repositories/calculadora_repository.dart';

// Caso de uso que encapsula o cálculo usando 7 dobras.
// Mantém a separação entre UI e regras de negócio.
class Calcular7DobrasUseCase {
  final CalculadoraRepository repository;

  Calcular7DobrasUseCase(this.repository);

  Future<ResultadoCalculo> call({
    required String sexo,
    required List<double> dobras,
  }) {
    return repository.calcular7Dobras(
      sexo: sexo,
      dobras: dobras,
    );
  }
}
