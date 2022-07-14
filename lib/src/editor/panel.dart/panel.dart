import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/header/header.dart';
import 'package:knobs/src/editor/properties_page/page.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/knobs.dart';

class Panel extends StatelessWidget {
  const Panel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context);
    final controller = Knobs.of(context);
    return Container(
      color: theme.page.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(
            title: controller.name,
          ),
          const Expanded(
            child: PropertiesPage(),
          ),
        ],
      ),
    );
  }
}
