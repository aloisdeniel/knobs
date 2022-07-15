import 'package:equatable/equatable.dart';
import 'package:knobs/src/property.dart';

class KnobsData extends Equatable {
  const KnobsData(this._values);

  final Map<Property, Object?> _values;

  Property<T> property<T>(String name) {
    final result = _values.keys.firstWhere(
      (x) => x.name == name,
      orElse: () => throw Exception('No property "$name" found'),
    );

    result.checkType<T>();
    return result as Property<T>;
  }

  T readProperty<T>(Property<T> property) {
    return _values[property] as T;
  }

  T read<T>(String name) {
    final property = this.property<T>(name);
    return _values[property] as T;
  }

  KnobsData update<T>(Property<T> property, T value) {
    if (property.isReadonly) throw Exception('"${property.name}" is read-only');
    final oldValue = readProperty(property);

    if (property.filter != null) {
      value = property.filter!(oldValue, value);
    }

    if (oldValue == value) return this;

    return KnobsData({
      ..._values,
      property: value,
    });
  }

  @override
  List<Object?> get props => [_values];
}
