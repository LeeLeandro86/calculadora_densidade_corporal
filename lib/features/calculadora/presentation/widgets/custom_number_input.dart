import 'package:flutter/material.dart';

class CustomNumberInput extends StatefulWidget {
  // Label exibido acima do campo
  final String label;
  // Sufixo exibido ao lado do valor (ex: 'kg', 'mm')
  final String suffix;
  // Valor inicial (agora nullable) — se null, o campo fica em branco
  final double? initialValue;
  // Valores mínimos e máximos aceitos
  final double minValue;
  final double maxValue;
  // Incremento/decremento dos botões
  final double step;
  // Callback chamado quando o valor é alterado (apenas quando há um número válido)
  final Function(double) onChanged;
  // Casas decimais a exibir
  final int? decimalPlaces;

  const CustomNumberInput({
    Key? key,
    required this.label,
    required this.suffix,
    this.initialValue,
    this.minValue = 0,
    this.maxValue = 999,
    this.step = 1,
    required this.onChanged,
    this.decimalPlaces = 1,
  }) : super(key: key);

  @override
  State<CustomNumberInput> createState() => _CustomNumberInputState();
}

class _CustomNumberInputState extends State<CustomNumberInput> {
  late TextEditingController _controller;
  // Valor atual (nullable). Quando null, o campo é exibido vazio.
  double? _currentValue;

  @override
  void initState() {
    super.initState();
    // Inicializa o valor atual com o initialValue (pode ser null)
    _currentValue = widget.initialValue;
    _controller = TextEditingController(
      text: _formatValue(_currentValue),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Formata o valor para exibição. Se o valor for null, retorna string vazia.
  String _formatValue(double? value) {
    if (value == null) return '';
    if (widget.decimalPlaces == null || widget.decimalPlaces == 0) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(widget.decimalPlaces!);
  }

  void _updateValue(double newValue) {
    newValue = newValue.clamp(widget.minValue, widget.maxValue);
    setState(() {
      _currentValue = newValue;
      _controller.text = _formatValue(_currentValue);
    });
    widget.onChanged(newValue);
  }

  void _increment() {
    // Se não houver valor atual, inicializa com minValue antes de incrementar
    final base = _currentValue ?? widget.minValue;
    _updateValue(base + widget.step);
  }

  void _decrement() {
    final base = _currentValue ?? widget.minValue;
    _updateValue(base - widget.step);
  }

  void _onTextChanged(String value) {
    if (value.isEmpty) {
      // Campo limpo: mantemos _currentValue como null e não chamamos onChanged
      setState(() {
        _currentValue = null;
      });
      return;
    }
    try {
      var newValue = double.parse(value);
      newValue = newValue.clamp(widget.minValue, widget.maxValue);
      setState(() {
        _currentValue = newValue;
      });
      widget.onChanged(newValue);
    } catch (e) {
      // Ignora valores inválidos
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1F1F23),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF323238),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: _onTextChanged,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      border: InputBorder.none,
                      hintText: widget.label,
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.3),
                      ),
                      suffix: Text(
                        widget.suffix,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        ),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(minHeight: 0, minWidth: 0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          widget.suffix,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1,
                      height: 30,
                      color: const Color(0xFF323238),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Color(0xFF00D9FF),
                        size: 18,
                      ),
                      onPressed: _decrement,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minHeight: 0),
                      iconSize: 18,
                    ),
                    Container(
                      width: 1,
                      height: 30,
                      color: const Color(0xFF323238),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Color(0xFF00D9FF),
                        size: 18,
                      ),
                      onPressed: _increment,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minHeight: 0),
                      iconSize: 18,
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
