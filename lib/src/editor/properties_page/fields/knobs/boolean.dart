import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/base/checkbox.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/extensions.dart';
import 'package:knobs/src/property.dart';

class BooleanKnob extends StatelessWidget {
  const BooleanKnob({
    super.key,
    required this.property,
  });
  final Property<bool> property;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).field(!property.isReadonly);
    final value = context.knobs.data.readProperty(property);
    void onValueChanged(bool v) {
      context.knobs.write<bool>(property.name, v);
    }

    return GestureDetector(
      onTap: () => onValueChanged.call(!value),
      child: Container(
        decoration: theme.decoration,
        padding: theme.padding,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Checkbox(
              value: value,
              onValueChanged: onValueChanged,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                value.toString(),
                style: theme.fieldValueStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
