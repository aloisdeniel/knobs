import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/panel.dart/panel.dart';

import '../theme.dart';

class Window extends StatelessWidget {
  const Window({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context);
    return Padding(
      padding: theme.margin,
      child: ClipRRect(
        borderRadius: theme.borderRadius,
        child: const Panel(),
      ),
    );
  }
}
