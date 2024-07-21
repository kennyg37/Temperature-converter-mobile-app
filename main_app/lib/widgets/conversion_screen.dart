import 'package:flutter/material.dart';
import 'package:main_app/widgets/conversion_options.dart';
import 'package:main_app/widgets/conversion_action.dart';
import 'package:main_app/widgets/conversion_history.dart';

class ConversionScreen extends StatefulWidget {
  const ConversionScreen({super.key});

  @override
  State<ConversionScreen> createState() => _ConversionScreenState();
}

class _ConversionScreenState extends State<ConversionScreen> {
  List<String> conversionOptions = ['F to C', 'C to F'];
  String selectedOption = 'F to C';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ConversionOptions(
              selectedUnit: selectedOption,
              options: conversionOptions,
              onOptionChanged: (newOption) {
                setState(() {
                  selectedOption = newOption;
                });
              },
            ),
            const SizedBox(height: 20),
            ConversionAction(
              selectedUnit: selectedOption,
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: ConversionHistory(),
            ),
          ],
        ),
      ),
    );
  }
}
