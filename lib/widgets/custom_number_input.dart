import 'package:flutter/material.dart';

class CustomNumberInput extends StatefulWidget {
  final String label;
  final String suffix;
  final double initialValue;
  final double minValue;
  final double maxValue;
  final double step;
  final Function(double) onChanged;
  final int? decimalPlaces;

  const CustomNumberInput({
    Key? key,
    required this.label,
    required this.suffix,
    this.initialValue = 0,
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
  late double _currentValue;

  @override
  void initState() {
    super.initState();
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

  String _formatValue(double value) {
    if (widget.decimalPlaces == null || widget.decimalPlaces == 0) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(widget.decimalPlaces!);
  }

  void _updateValue(double newValue) {
    newValue = newValue.clamp(widget.minValue, widget.maxValue);
    setState(() {
      _currentValue = newValue;
      _controller.text = _formatValue(newValue);
    });
    widget.onChanged(newValue);
  }

  void _increment() {
    _updateValue(_currentValue + widget.step);
  }

  void _decrement() {
    _updateValue(_currentValue - widget.step);
  }

  void _onTextChanged(String value) {
    if (value.isEmpty) {
      return;
    }
    try {
      double newValue = double.parse(value);
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
  Widget build(BuildContext context) {
    return Column(
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
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFF323238),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Botão decremento
              SizedBox(
                width: 48,
                height: 48,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _decrement,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Color(0xFF00D9FF),
                      size: 20,
                    ),
                  ),
                ),
              ),
              // Campo de texto
              Expanded(
                child: TextField(
                  controller: _controller,
                  onChanged: _onTextChanged,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixText: widget.suffix,
                    suffixStyle: const TextStyle(
                      color: Color(0xFF8C8C92),
                      fontSize: 14,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              // Botão incremento
              SizedBox(
                width: 48,
                height: 48,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _increment,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFF00D9FF),
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
