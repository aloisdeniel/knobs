import 'package:flutter/widgets.dart';
import 'icon.dart';
import 'package:knobs/src/editor/theme.dart';

class Checkbox extends StatelessWidget {
  const Checkbox({
    super.key,
    required this.value,
    this.onValueChanged,
  });

  final bool value;
  final ValueChanged<bool>? onValueChanged;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onValueChanged != null;
    final theme = KnobsEditorTheme.of(context).field(isEnabled);
    return GestureDetector(
      onTap: onValueChanged == null ? null : () => onValueChanged?.call(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 16,
        height: 16,
        decoration: BoxDecoration(
            color: theme.foregroundColor.withAlpha(value ? 255 : 0),
            borderRadius: const BorderRadius.all(
              Radius.circular(2),
            ),
            border: Border.all(color: theme.foregroundColor)),
        child: value
            ? KnobsIcon(
                KnobsIconData.check,
                color: theme.onForegroundColor,
              )
            : const SizedBox(),
      ),
    );
  }
}
