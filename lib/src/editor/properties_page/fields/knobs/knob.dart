import 'package:flutter/widgets.dart';
import 'package:preview_knobs/src/property.dart';

import 'double.dart';
import 'options.dart';
import 'boolean.dart';
import 'string.dart';
import 'unknown.dart';

class Knob extends StatelessWidget {
  const Knob({
    super.key,
    required this.property,
  });

  final Property property;

  @override
  Widget build(BuildContext context) {
    final property = this.property;

    if (property is OptionsProperty) {
      return OptionsKnob(
        property: property,
      );
    }

    if (property is Property<String>) {
      return StringKnob(
        property: property,
      );
    }

    if (property is Property<double>) {
      return DoubleKnob(
        property: property,
      );
    }
    if (property is Property<bool>) {
      return BooleanKnob(
        property: property,
      );
    }
    return UnknownKnob(
      property: property,
    );
  }
}
