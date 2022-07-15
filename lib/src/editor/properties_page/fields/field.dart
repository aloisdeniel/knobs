import 'package:flutter/widgets.dart';
import 'package:preview_knobs/preview_knobs.dart';
import 'package:preview_knobs/src/editor/properties_page/fields/knobs/knob.dart';
import 'package:preview_knobs/src/editor/theme.dart';

class Field extends StatelessWidget {
  const Field({
    super.key,
    required this.property,
  });

  final Property property;

  static bool isEditSupported(Property property) {
    return property is OptionsProperty ||
        property is Property<String> ||
        property is Property<bool> ||
        property is Property<double>;
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = !property.isReadonly && isEditSupported(property);
    final theme = KnobsEditorTheme.of(context).field(isEnabled);
    return Padding(
      padding: theme.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FieldTitle(
            title: property.name,
            isEnabled: isEnabled,
          ),
          const SizedBox(
            height: 8,
          ),
          Knob(
            property: property,
          ),
        ],
      ),
    );
  }
}

class FieldTitle extends StatelessWidget {
  const FieldTitle({
    super.key,
    required this.title,
    required this.isEnabled,
  });

  final String title;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).field(isEnabled);
    return Text(
      title,
      style: theme.fieldNameStyle,
    );
  }
}
