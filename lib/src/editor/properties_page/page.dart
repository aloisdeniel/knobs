import 'package:flutter/widgets.dart';
import 'package:preview_knobs/src/editor/properties_page/fields/field.dart';
import 'package:preview_knobs/src/editor/theme.dart';
import 'package:preview_knobs/src/knobs.dart';

class PropertiesPage extends StatelessWidget {
  const PropertiesPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final allProperties = Knobs.propertiesOf(context);
    final theme = KnobsEditorTheme.of(context);
    return Container(
      color: theme.page.backgroundColor,
      child: ListView(
        children: [
          ...allProperties.map(
            (p) => Field(property: p),
          ),
        ],
      ),
    );
  }
}
