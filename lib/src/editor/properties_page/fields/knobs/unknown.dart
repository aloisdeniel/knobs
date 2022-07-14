import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/extensions.dart';
import 'package:knobs/src/property.dart';

class UnknownKnob extends StatelessWidget {
  const UnknownKnob({
    super.key,
    required this.property,
  });
  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).disabledField;
    final value = context.knobs.data.read(property);
    return Container(
      decoration: theme.decoration,
      padding: theme.padding,
      alignment: Alignment.centerLeft,
      child: Text(
        value?.toString() ?? 'null',
        style: theme.fieldValueStyle,
      ),
    );
  }
}
