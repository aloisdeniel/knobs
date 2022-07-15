import 'package:flutter/widgets.dart';
import 'package:preview_knobs/src/editor/theme.dart';
import 'package:preview_knobs/src/extensions.dart';
import 'package:preview_knobs/src/property.dart';

class UnknownKnob extends StatelessWidget {
  const UnknownKnob({
    super.key,
    required this.property,
  });
  final Property property;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).disabledField;
    final value = property.read(context.preview_knobs.data);
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
