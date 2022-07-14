import 'package:flutter/material.dart';
import 'package:knobs/src/property.dart';

import 'data.dart';

class KnobsController extends ChangeNotifier {
  KnobsController({
    required this.name,
    required this.properties,
  });

  final String name;
  final List<Property> properties;

  late KnobsData data = _initData();

  T read<T>(String name) {
    final property = data.property<T>(name);
    return data.read<T>(property);
  }

  void write<T>(String name, T value) {
    final property = data.property<T>(name);
    data = data.update<T>(property, value);
    notifyListeners();
  }

  void reset() {
    data = _initData();
    notifyListeners();
  }

  KnobsData _initData() {
    final values = <Property, Object?>{};
    for (var property in properties) {
      values[property] = property.initialValue;
    }
    return KnobsData(values);
  }
}
