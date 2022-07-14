import 'package:flutter/widgets.dart';
import 'package:knobs/src/controller.dart';
import 'package:knobs/src/data.dart';

class KnobsProvider extends StatelessWidget {
  const KnobsProvider({
    super.key,
    required this.controller,
    required this.child,
  });

  final Widget child;

  static KnobsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_KnobsProvider>()!
        .controller;
  }

  final KnobsController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return _KnobsProvider(
          data: controller.data,
          controller: controller,
          child: child,
        );
      },
    );
  }
}

class _KnobsProvider extends InheritedWidget {
  const _KnobsProvider({
    required super.child,
    required this.controller,
    required this.data,
  });

  final KnobsController controller;
  final KnobsData data;

  @override
  bool updateShouldNotify(covariant _KnobsProvider oldWidget) {
    return oldWidget.data != data;
  }
}
