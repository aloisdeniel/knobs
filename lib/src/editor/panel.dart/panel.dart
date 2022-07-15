import 'package:flutter/widgets.dart';
import 'package:knobs/src/controller.dart';
import 'package:knobs/src/editor/doc_page/page.dart';
import 'package:knobs/src/editor/header/header.dart';
import 'package:knobs/src/editor/properties_page/page.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/knobs.dart';

enum PanelPage {
  properties,
  documentation,
}

class Panel extends StatefulWidget {
  const Panel({
    super.key,
  });

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  PanelPage page = PanelPage.properties;
  KnobsController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newController = Knobs.of(context);
    if (newController != controller) {
      controller = newController;
      setState(() {
        page = PanelPage.properties;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context);
    final controller = this.controller;
    if (controller == null) {
      return const SizedBox();
    }
    return Container(
      color: theme.page.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(
              title: controller.name,
              page: page,
              onPageChanged: (newPage) {
                setState(() {
                  page = newPage;
                });
              },
              onOpenDoc: () => setState(() {
                    page = PanelPage.documentation;
                  })),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: page == PanelPage.documentation
                  ? DocPage(controller: controller)
                  : const PropertiesPage(),
            ),
          ),
        ],
      ),
    );
  }
}
