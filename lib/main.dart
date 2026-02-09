import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/service_locator.dart';
import 'features/calculadora/presentation/pages/calculadora_densidade_screen.dart';

// Entry point do aplicativo.
// Este arquivo monta o provedor de dependências (ServiceLocator) e inicia
// o widget raiz (`MyApp`).

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: ServiceLocator.getProviders(),
        child: MaterialApp(
          title: 'Calculadora de Densidade Corporal',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121214),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF121214),
              elevation: 0,
            ),
          ),
          // Tela principal da feature de calculadora. A tela consome o
          // `CalculadoraController` fornecido pelo ServiceLocator.
          home: const CalculadoraDensidadeScreen(),
        ),
      );
}
