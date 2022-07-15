import 'package:flutter/widgets.dart';
import 'package:knobs/knobs.dart';
import 'package:knobs/src/editor/base/icon.dart';
import 'package:knobs/src/editor/panel.dart/panel.dart';
import 'package:knobs/src/editor/theme.dart';

import 'button.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    required this.onOpenDoc,
    required this.page,
    required this.onPageChanged,
    this.onBack,
  });

  final PanelPage page;
  final String title;
  final VoidCallback? onBack;
  final VoidCallback onOpenDoc;
  final ValueChanged<PanelPage> onPageChanged;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).header;
    final subtitle = page == PanelPage.documentation ? 'Documentation' : null;
    const duration = Duration(milliseconds: 200);
    return Container(
      height: theme.height,
      decoration: theme.decoration,
      padding: theme.padding,
      child: Row(
        children: [
          AnimatedSize(
            duration: duration,
            child: page != PanelPage.properties
                ? Row(
                    children: [
                      HeaderButton(
                        icon: KnobsIconData.back,
                        onTap: () => onPageChanged(PanelPage.properties),
                      ),
                      const SizedBox(width: 4),
                    ],
                  )
                : const SizedBox(),
          ),
          Expanded(
            key: const Key('titles'),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: duration,
                  style: subtitle == null
                      ? theme.titleStyle
                      : theme.titleStackedTopStyle,
                  child: Text(
                    title,
                  ),
                ),
                AnimatedSwitcher(
                  duration: duration,
                  child: subtitle != null
                      ? Text(
                          subtitle,
                          style: theme.titleStackedBottomStyle,
                        )
                      : const SizedBox(),
                )
              ],
            ),
          ),
          if (page == PanelPage.properties &&
              context.knobs.documentation != null) ...[
            HeaderButton(
              icon: KnobsIconData.doc,
              onTap: onOpenDoc,
            ),
            const SizedBox(width: 4),
          ],
          HeaderButton(
            icon: KnobsIconData.cross,
            onTap: () {
              Knobs.hideEditor(context);
            },
          ),
        ],
      ),
    );
  }
}
