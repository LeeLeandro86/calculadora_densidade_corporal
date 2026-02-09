import 'package:flutter/material.dart';

// Widget que exibe o resultado do cálculo em um modal/dialog.
// Recebe: percentual de gordura, classificação, densidade, sexo e idade.
class ResultadoModal extends StatelessWidget {
  final double percentualGordura;
  final String classificacao;
  final double densidade;
  final String sexo;
  final double idade;

  const ResultadoModal({
    Key? key,
    required this.percentualGordura,
    required this.classificacao,
    required this.densidade,
    required this.sexo,
    required this.idade,
  }) : super(key: key);

  // Retorna a cor associada à classificação (essencial, atleta, etc.)
  Color _obterCorClassificacao() {
    switch (classificacao.toLowerCase()) {
      case 'essencial':
        return const Color(0xFFFF6B6B);
      case 'atleta':
        return const Color(0xFF00D9FF);
      case 'fitness':
        return const Color(0xFF69FF00);
      case 'média':
        return const Color(0xFFFFB800);
      case 'acima da média':
        return const Color(0xFFFF6B6B);
      default:
        return const Color(0xFF00D9FF);
    }
  }

  // Build do modal: layout visual organizado em seções (percentual,
  // classificação, detalhes e botão fechar).
  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1F1F23),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFF323238),
              width: 1,
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        'Resultado da Avaliação',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF8C8C92),
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF121214),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF323238),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Percentual de Gordura',
                        style: TextStyle(
                          color: Color(0xFF8C8C92),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '${percentualGordura.toStringAsFixed(2)}%',
                        style: const TextStyle(
                          color: Color(0xFF00D9FF),
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF121214),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF323238),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text(
                        'Classificação',
                        style: TextStyle(
                          color: Color(0xFF8C8C92),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        classificacao,
                        style: TextStyle(
                          color: _obterCorClassificacao(),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF121214),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF323238),
                      width: 1,
                    ),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Detalhes',
                        style: TextStyle(
                          color: Color(0xFF8C8C92),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Densidade:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '${densidade.toStringAsFixed(4)} g/cm³',
                            style: const TextStyle(
                              color: Color(0xFF00D9FF),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Sexo:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            sexo == 'masculino' ? 'Masculino' : 'Feminino',
                            style: const TextStyle(
                              color: Color(0xFF00D9FF),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Idade:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '${idade.toInt()} anos',
                            style: const TextStyle(
                              color: Color(0xFF00D9FF),
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00D9FF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Fechar',
                      style: TextStyle(
                        color: Color(0xFF121214),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
