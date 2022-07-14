import 'package:flutter/widgets.dart';
import 'package:knobs/src/controller.dart';
import 'package:knobs/src/editor/panel.dart/panel.dart';
import 'package:knobs/src/editor/window/window.dart';
import 'package:knobs/src/provider.dart';

import 'theme.dart';

class KnobsEditor extends StatelessWidget {
  const KnobsEditor({
    super.key,
    required this.child,
  });

  final Widget child;

  static void show(BuildContext context, KnobsController controller) {
    final state = context.findAncestorStateOfType<_KnobsEditorState>();
    state?.show(controller);
  }

  static void hide(BuildContext context) {
    final state = context.findAncestorStateOfType<_KnobsEditorState>();
    state?.hide();
  }

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => _KnobsEditor(
            child: child,
          ),
        ),
      ],
    );
  }
}

class _KnobsEditor extends StatefulWidget {
  const _KnobsEditor({
    required this.child,
  });

  final Widget child;

  @override
  State<_KnobsEditor> createState() => _KnobsEditorState();
}

class _KnobsEditorState extends State<_KnobsEditor> {
  KnobsController? _activeController;
  final childKey = GlobalKey();

  void show(KnobsController controller) {
    if (controller != _activeController) {
      setState(() {
        _activeController = controller;
      });
    }
  }

  void hide() {
    setState(() {
      _activeController = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeController = _activeController;
    final theme = KnobsEditorTheme.of(context);
    final child = KeyedSubtree(
      key: childKey,
      child: widget.child,
    );
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return Stack(
          children: [
            child,
            if (activeController != null)
              Positioned.fill(
                child: KnobsProvider(
                  controller: activeController,
                  child: const Window(),
                ),
              ),
          ],
        );
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: child,
          ),
          Container(
            color: theme.page.backgroundColor,
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: activeController != null
                    ? KnobsProvider(
                        controller: activeController,
                        child: const SizedBox(
                          width: 260,
                          child: Panel(),
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
