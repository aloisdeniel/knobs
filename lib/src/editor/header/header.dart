import 'package:flutter/widgets.dart';
import 'package:knobs/src/editor/base/icon.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/knobs.dart';

import 'button.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
    this.subtitle,
    this.onBack,
  });

  final String title;
  final String? subtitle;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).header;
    return Container(
      height: theme.height,
      decoration: theme.decoration,
      padding: theme.padding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 200),
                  style: subtitle == null
                      ? theme.titleStyle
                      : theme.titleStackedTopStyle,
                  child: Text(
                    title,
                  ),
                ),
              ],
            ),
          ),
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
