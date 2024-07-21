import 'package:flutter/material.dart';
import 'package:main_app/models/unit_conversion.dart';
import 'package:main_app/models/unit_conversion_manager.dart';

class ConversionAction extends StatefulWidget {
  const ConversionAction({
    super.key,
    required this.selectedUnit,
  });

  final String selectedUnit;

  @override
  State<ConversionAction> createState() => _ConversionActionState();
}

class _ConversionActionState extends State<ConversionAction> {
  late final TextEditingController _inputController;
  late final TextEditingController _resultController;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _resultController = TextEditingController();
  }

  @override
  void dispose() {
    _inputController.dispose();
    _resultController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                  labelText: 'Input',
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('='),
            ),
            Expanded(
              child: TextField(
                controller: _resultController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Result',
                  filled: true,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            double? input;
            double? result;

            try {
              input = double.parse(_inputController.text);
              if (widget.selectedUnit == 'F to C') {
                result = _fahrenheitToCelsius(input);
              } else {
                result = _celsiusToFahrenheit(input);
              }

              _resultController.text = result.toString();

              final conversion = UnitConversion(
                category: widget.selectedUnit,
                input: input,
                result: result,
                selectedUnit: widget.selectedUnit,
              );

              UnitConversionManager().addConversion(conversion: conversion);
            } catch (e) {
              print('Error: $e');
            }
          },
          child: const Text('CONVERT'),
        ),
      ],
    );
  }

  double _fahrenheitToCelsius(double fahrenheit) {
    return ((fahrenheit - 32) * 5 / 9).roundToDouble();
  }

  double _celsiusToFahrenheit(double celsius) {
    return ((celsius * 9 / 5) + 32).roundToDouble();
  }
}