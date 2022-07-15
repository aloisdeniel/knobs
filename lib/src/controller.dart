import 'package:flutter/material.dart';
import 'package:knobs/src/property.dart';

import 'data.dart';
import 'documentation.dart';

class KnobsController extends ChangeNotifier {
  KnobsController({
    required this.name,
    required this.properties,
    required this.documentation,
  });

  final String name;
  final List<Property> properties;
  final DocumentationBuilder? documentation;

  late KnobsData _data = _initData();
  KnobsData get data => _data;

  T read<T>(String name) {
    final property = _data.property<T>(name);
    return _data.read<T>(property);
  }

  void write<T>(String name, T value) {
    final property = _data.property<T>(name);
    update(_data.update<T>(property, value));
    notifyListeners();
  }

  void reset() {
    _data = _initData();
    notifyListeners();
  }

  void update(KnobsData data) {
    if (data != _data) {
      _data = data;
      notifyListeners();
    }
  }

  KnobsData _initData() {
    final values = <Property, Object?>{};
    for (var property in properties) {
      values[property] = property.initialValue;
    }
    return KnobsData(values);
  }
}
