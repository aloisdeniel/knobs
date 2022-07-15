import 'package:flutter/widgets.dart';
import 'package:preview_knobs/src/editor/panel.dart/panel.dart';

import '../theme.dart';

class Window extends StatelessWidget {
  const Window({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context);
    return Container(
      color: theme.page.backgroundColor.withAlpha(120),
      child: SafeArea(
        child: Padding(
          padding: theme.margin,
          child: ClipRRect(
            borderRadius: theme.borderRadius,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(
                padding: const EdgeInsets.all(0),
              ),
              child: const Panel(),
            ),
          ),
        ),
      ),
    );
  }
}
