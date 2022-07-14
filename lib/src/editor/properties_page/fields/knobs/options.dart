import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/base/icon.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/extensions.dart';
import 'package:knobs/src/property.dart';

class OptionsKnob extends StatelessWidget {
  const OptionsKnob({
    super.key,
    required this.property,
  });
  final OptionsProperty property;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).field(!property.isReadonly);
    final value = context.knobs.data.read(property);
    final option = property.options.cast<Option>().firstWhere(
          (x) => x.value == value,
          orElse: () => Option(
            value.toString(),
            value,
          ),
        );
    return Container(
      decoration: theme.decoration,
      padding: theme.padding,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Text(
              option.name,
              style: theme.fieldValueStyle,
            ),
          ),
          const SizedBox(width: 4),
          KnobsIcon(
            KnobsIconData.chevronDown,
            color: theme.foregroundColor,
          )
        ],
      ),
    );
  }
}
