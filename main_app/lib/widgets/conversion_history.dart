import 'package:flutter/material.dart';
import 'package:main_app/models/unit_conversion_manager.dart';

import '../models/unit_conversion.dart';

class ConversionHistory extends StatelessWidget {
  const ConversionHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: UnitConversionManager(),
      builder: (context, List<UnitConversion> conversions, child) {
        return ListView.builder(
          itemCount: conversions.length,
          itemBuilder: (context, index) {
            final conversion = conversions[index];
            return ListTile(
              title: Text(conversion.description),
            );
          },
        );
      },
    );
  }
}