import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:preview_knobs/preview_knobs.dart';
import 'package:preview_knobs/src/controller.dart';
import 'package:preview_knobs/src/editor/theme.dart';

class DocPage extends StatelessWidget {
  const DocPage({
    super.key,
    required this.controller,
  });

  final KnobsController controller;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Markdown(
      selectable: true,
      padding: mediaQuery.padding.copyWith(top: 0) + const EdgeInsets.all(12),
      styleSheet: theme.docStyle,
      data:
          controller.documentation?.call(context, context.preview_knobs.data) ??
              'No documentation',
    );
  }
}
