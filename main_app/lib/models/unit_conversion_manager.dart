import 'package:flutter/material.dart';
import 'package:main_app/models/unit_conversion.dart';

class UnitConversionManager extends ValueNotifier<List<UnitConversion>> {
  UnitConversionManager._privateConstructor() : super([]);
  static final UnitConversionManager _instance = UnitConversionManager._privateConstructor();
  factory UnitConversionManager() => _instance;

  int get count => value.length;

  void addConversion({required UnitConversion conversion}) {
    final conversions = value;
    conversions.add(conversion);
    notifyListeners();
  }

  UnitConversion? getConversion({required int index}) {
    return value.length > index ? value[index] : null;
  }
}
