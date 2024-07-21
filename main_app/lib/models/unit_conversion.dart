import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class UnitConversion {
  final String category;
  final double input;
  final double result;
  final String selectedUnit;
  final String id;

  UnitConversion({
    Key? key,
    required this.category,
    required this.input,
    required this.result,
    required this.selectedUnit,
  }) : id = const Uuid().v4();

  String get description => '$selectedUnit: $input -> $result';
}