import 'package:flutter/foundation.dart';
import '../../domain/entities/resultado_calculo.dart';
import '../../domain/usecases/calcular_3dobras_usecase.dart';
import '../../domain/usecases/calcular_7dobras_usecase.dart';

// Controller da camada de apresentação responsável por orquestrar os
// cálculos da feature. Usa `ChangeNotifier` para notificar a UI sobre
// mudanças de estado (carregando, resultado, erro).

class CalculadoraController extends ChangeNotifier {
  final Calcular3DobrasUseCase calcular3DobrasUseCase;
  final Calcular7DobrasUseCase calcular7DobrasUseCase;

  CalculadoraController({
    required this.calcular3DobrasUseCase,
    required this.calcular7DobrasUseCase,
  });

  // Estados observáveis pela UI
  // `resultado` contém o resultado do cálculo (ou null se não houver)
  ResultadoCalculo? resultado;
  // `isLoading` para feedback de carregamento na UI
  bool isLoading = false;
  // Mensagem de erro (se ocorrer)
  String? error;

  Future<void> calcular3Dobras({
    required String sexo,
    required double idade,
    required double peitoral,
    required double abdominal,
    required double coxa,
  }) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      resultado = await calcular3DobrasUseCase(
        sexo: sexo,
        idade: idade,
        peitoral: peitoral,
        abdominal: abdominal,
        coxa: coxa,
      );

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> calcular7Dobras({
    required String sexo,
    required List<double> dobras,
  }) async {
    try {
      isLoading = true;
      error = null;
      notifyListeners();

      resultado = await calcular7DobrasUseCase(
        sexo: sexo,
        dobras: dobras,
      );

      isLoading = false;
      notifyListeners();
    } catch (e) {
      error = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }

  void limparResultado() {
    resultado = null;
    error = null;
    notifyListeners();
  }
}
