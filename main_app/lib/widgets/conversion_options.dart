import 'package:flutter/material.dart';

class ConversionOptions extends StatefulWidget {
  const ConversionOptions({
    super.key,
    required this.selectedUnit,
    required this.options,
    required this.onOptionChanged,
  });

  final String selectedUnit;
  final List<String> options;
  final ValueChanged<String> onOptionChanged;

  @override
  State<ConversionOptions> createState() => _ConversionOptionsState();
}

class _ConversionOptionsState extends State<ConversionOptions> {
  late String selectedUnit;

  @override
  void initState() {
    super.initState();
    selectedUnit = widget.selectedUnit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.options.map((option) {
        return ListTile(
          title: Text(option),
          leading: Radio(
            value: option,
            groupValue: selectedUnit,
            onChanged: (value) {
              setState(() {
                selectedUnit = value.toString();
              });
              widget.onOptionChanged(value.toString());
            },
          ),
        );
      }).toList(),
    );
  }
}
