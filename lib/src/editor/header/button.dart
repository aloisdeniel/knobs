import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/base/icon.dart';
import 'package:knobs/src/editor/theme.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final KnobsIconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).header;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(4),
        child: Center(
          child: KnobsIcon(
            icon,
            color: theme.closeButtonForegroundColor,
          ),
        ),
      ),
    );
  }
}
