import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/calculadora_controller.dart';
import '../widgets/custom_number_input.dart';
import '../widgets/resultado_modal.dart';

// Página principal da feature de calculadora de densidade corporal.
// Nesta página o usuário fornece idade, peso, sexo e dobras cutâneas.
// Os valores são coletados pelos widgets `CustomNumberInput` e o cálculo
// é realizado via `CalculadoraController` (camada de apresentação).

class CalculadoraDensidadeScreen extends StatefulWidget {
  const CalculadoraDensidadeScreen({Key? key}) : super(key: key);

  @override
  State<CalculadoraDensidadeScreen> createState() =>
      _CalculadoraDensidadeScreenState();
}

class _CalculadoraDensidadeScreenState extends State<CalculadoraDensidadeScreen> {
  // Estados dos campos (nullable para permitir campos em branco)
  // `idade` e `peso` representam os dados pessoais do usuário.
  double? idade;
  double? peso;
  // `sexo` controla a seleção entre masculino/feminino — usado nas fórmulas.
  String sexo = 'masculino';
  // `modoCalculo` escolhe entre 3 ou 7 dobras (mapa para exibição/entrada).
  String modoCalculo = '7dobras';

  // Dobras cutâneas para o modo de 3 dobras (nullable — podem ficar vazias)
  double? peitoral;
  double? abdominal;
  double? coxa;

  // Dobras adicionais para o modo de 7 dobras (nullable)
  double? triceps;
  double? subescapular;
  double? axilarMedia;
  double? supraIliaca;
  double? coxa7dobras;
  double? abdominal7dobras;
  double? peitoral7dobras;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xFF121214),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Calculadora de Densidade Corporal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '(Percentual de Gordura)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Seção: Dados Pessoais (Idade e Peso)
                // Os `CustomNumberInput` abaixo recebem os valores iniciais
                // (podem ser nulos) e notificam quando o usuário altera.
                _buildSectionTitle('Dados Pessoais'),
                const SizedBox(height: 16),
                CustomNumberInput(
                  label: 'Idade',
                  suffix: 'anos',
                  initialValue: idade,
                  minValue: 10,
                  maxValue: 100,
                  step: 1,
                  decimalPlaces: 0,
                  onChanged: (value) {
                    setState(() {
                      idade = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomNumberInput(
                  label: 'Peso',
                  suffix: 'kg',
                  initialValue: peso,
                  minValue: 20,
                  maxValue: 300,
                  step: 0.5,
                  decimalPlaces: 1,
                  onChanged: (value) {
                    setState(() {
                      peso = value;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Seção: Sexo (opção binária selecionável)
                _buildSectionTitle('Sexo'),
                const SizedBox(height: 12),
                _buildRadioGroup(
                  options: ['Masculino', 'Feminino'],
                  selectedValue: sexo == 'masculino' ? 'Masculino' : 'Feminino',
                  onChanged: (value) {
                    setState(() {
                      sexo = value == 'Masculino' ? 'masculino' : 'feminino';
                    });
                  },
                ),
                const SizedBox(height: 24),

                // Seção: Modo de Cálculo (3 Dobras ou 7 Dobras)
                _buildSectionTitle('Modo de Cálculo'),
                const SizedBox(height: 12),
                _buildRadioGroup(
                  options: ['3 Dobras', '7 Dobras'],
                  selectedValue: modoCalculo == '3dobras' ? '3 Dobras' : '7 Dobras',
                  onChanged: (value) {
                    setState(() {
                      modoCalculo = value == '3 Dobras' ? '3dobras' : '7dobras';
                    });
                  },
                ),
                const SizedBox(height: 32),

                // Dobras Cutâneas — campos de entrada para as medidas em mm.
                // Quando `modoCalculo == '3dobras'` mostramos apenas 3 campos,
                // caso contrário mostramos os 7 campos usados na fórmula.
                _buildSectionTitle('Dobras Cutâneas (mm)'),
                const SizedBox(height: 16),
                if (modoCalculo == '3dobras')
                  Column(
                    children: [
                      CustomNumberInput(
                        label: 'Peitoral',
                        suffix: 'mm',
                        initialValue: peitoral,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            peitoral = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Abdominal',
                        suffix: 'mm',
                        initialValue: abdominal,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            abdominal = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Coxa',
                        suffix: 'mm',
                        initialValue: coxa,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            coxa = value;
                          });
                        },
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      CustomNumberInput(
                        label: 'Tríceps',
                        suffix: 'mm',
                        initialValue: triceps,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            triceps = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Subescapular',
                        suffix: 'mm',
                        initialValue: subescapular,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            subescapular = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Axilar Média',
                        suffix: 'mm',
                        initialValue: axilarMedia,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            axilarMedia = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Supraíliaca',
                        suffix: 'mm',
                        initialValue: supraIliaca,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            supraIliaca = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Coxa',
                        suffix: 'mm',
                        initialValue: coxa7dobras,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            coxa7dobras = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Abdominal',
                        suffix: 'mm',
                        initialValue: abdominal7dobras,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            abdominal7dobras = value;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      CustomNumberInput(
                        label: 'Peitoral',
                        suffix: 'mm',
                        initialValue: peitoral7dobras,
                        minValue: 0,
                        maxValue: 200,
                        step: 0.5,
                        decimalPlaces: 1,
                        onChanged: (value) {
                          setState(() {
                            peitoral7dobras = value;
                          });
                        },
                      ),
                    ],
                  ),
                const SizedBox(height: 32),

                // Botão Calcular: aciona o `CalculadoraController` para
                // executar o usecase correspondente (3 ou 7 dobras).
                Consumer<CalculadoraController>(
                  builder: (context, controller, _) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () async {
                                if (modoCalculo == '3dobras') {
                                  await controller.calcular3Dobras(
                                    sexo: sexo,
                                    idade: idade,
                                    peitoral: peitoral,
                                    abdominal: abdominal,
                                    coxa: coxa,
                                  );
                                } else {
                                  await controller.calcular7Dobras(
                                    sexo: sexo,
                                    dobras: [
                                      triceps,
                                      subescapular,
                                      axilarMedia,
                                      supraIliaca,
                                      peitoral7dobras,
                                      abdominal7dobras,
                                      coxa7dobras,
                                    ],
                                  );
                                }

                                // Ao terminar, se houver resultado mostramos o modal
                                if (controller.resultado != null) {
                                  showDialog(
                                    context: context,
                                    builder: (context) => ResultadoModal(
                                      percentualGordura:
                                          controller.resultado!.percentualGordura,
                                      classificacao:
                                          controller.resultado!.classificacao,
                                      densidade: controller.resultado!.densidade,
                                      sexo: sexo,
                                      idade: idade,
                                    ),
                                  );
                                } else if (controller.error != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Erro: ${controller.error}'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00D9FF),
                          disabledBackgroundColor:
                              const Color(0xFF00D9FF).withOpacity(0.5),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Color(0xFF121214),
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Calcular',
                                style: TextStyle(
                                  color: Color(0xFF121214),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      );

  Widget _buildSectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _buildRadioGroup({
    required List<String> options,
    required String selectedValue,
    required Function(String) onChanged,
  }) =>
      Row(
        children: List.generate(
          options.length,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () => onChanged(options[index]),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedValue == options[index]
                      ? const Color(0xFF00D9FF)
                      : const Color(0xFF1F1F23),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF323238),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  options[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: selectedValue == options[index]
                        ? const Color(0xFF121214)
                        : Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
