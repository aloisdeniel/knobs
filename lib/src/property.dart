typedef ValueUpdateFilter<T> = T Function(T previousValue, T newValue);

class Property<T> {
  const Property(
    this.name,
    this.initialValue, {
    this.description,
    this.isReadonly = false,
    this.filter,
  });

  const factory Property.options(
    String name,
    T initialValue, {
    required List<Option<T>> options,
    String description,
  }) = OptionsProperty<T>;

  factory Property.enumOptions(String name, List<T> values) {
    return Property<T>.options(
      name,
      values.first,
      options: [
        ...values.map(
          (v) => Option<T>(
            v.toString().substring('$T.'.length),
            v,
          ),
        ),
      ],
    );
  }

  final String name;
  final bool isReadonly;
  final ValueUpdateFilter<T>? filter;
  final T initialValue;
  final String? description;

  void checkType<K>() {
    if (this is! Property<K>) {
      throw Exception('Property "$name" is not of type "$K", but of type "$T"');
    }
  }
}

class OptionsProperty<T> extends Property<T> {
  const OptionsProperty(
    super.name,
    super.initialValue, {
    required this.options,
    super.description,
  });

  final List<Option<T>> options;

  Option<T> optionForValue(dynamic value) => options.firstWhere(
        (x) => x.value == value,
        orElse: () => Option(
          value.toString(),
          value,
        ),
      );
}

class Option<T> {
  const Option(
    this.name,
    this.value, {
    this.description,
  });

  final String name;
  final String? description;
  final T value;
}
