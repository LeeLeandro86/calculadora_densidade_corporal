import 'package:provider/provider.dart';
import '../features/calculadora/data/datasources/calculadora_local_datasource.dart';
import '../features/calculadora/data/repositories/calculadora_repository_impl.dart';
import '../features/calculadora/domain/repositories/calculadora_repository.dart';
import '../features/calculadora/domain/usecases/calcular_3dobras_usecase.dart';
import '../features/calculadora/domain/usecases/calcular_7dobras_usecase.dart';
import '../features/calculadora/presentation/controllers/calculadora_controller.dart';

// Local Service Locator simples que monta e fornece os providers necessários
// para a aplicação. Em projetos maiores você pode substituir por um
// container de injeção de dependências mais sofisticado.
class ServiceLocator {
  static List<ChangeNotifierProvider> getProviders() {
    // Data sources: detalhes das fórmulas e cálculos
    final localDataSource = CalculadoraLocalDataSourceImpl();

    // Repositories: agregam operações e retornam entidades do domínio
    final CalculadoraRepository repository =
        CalculadoraRepositoryImpl(localDataSource);

    // Use cases: encapsulam ações específicas (3 dobras / 7 dobras)
    final calcular3DobrasUseCase = Calcular3DobrasUseCase(repository);
    final calcular7DobrasUseCase = Calcular7DobrasUseCase(repository);

    // Providers expostos para a árvore de widgets
    return [
      ChangeNotifierProvider(
        create: (_) => CalculadoraController(
          calcular3DobrasUseCase: calcular3DobrasUseCase,
          calcular7DobrasUseCase: calcular7DobrasUseCase,
        ),
      ),
    ];
  }
}
