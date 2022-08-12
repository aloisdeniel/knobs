import 'package:flutter/material.dart';
import 'package:preview_knobs/preview_knobs.dart';
import 'provider.dart';

class Knobs extends StatefulWidget {
  const Knobs({
    super.key,
    required this.name,
    required this.properties,
    this.builder,
    this.child,
    this.documentation,
  });

  final String name;
  final List<Property> properties;
  final ValueWidgetBuilder<KnobsData>? builder;
  final Widget? child;
  final DocumentationBuilder? documentation;

  static void showEditor(BuildContext context) {
    KnobsEditor.show(context, context.knobs);
  }

  static void hideEditor(BuildContext context) {
    KnobsEditor.hide(context);
  }

  static KnobsController of(BuildContext context) {
    return KnobsProvider.of(context);
  }

  static List<Property> propertiesOf(BuildContext context) {
    return of(context).properties;
  }

  @override
  State<Knobs> createState() => KnobsState();
}

class KnobsState extends State<Knobs> {
  late KnobsController controller = KnobsController(
    name: widget.name,
    properties: widget.properties,
    documentation: widget.documentation,
  );

  @override
  void didUpdateWidget(covariant Knobs oldWidget) {
    super.didUpdateWidget(oldWidget);

    final removedProperty = oldWidget.properties.any((oldElement) =>
        !widget.properties.any((e) => e.name == oldElement.name));
    final addedProperty = widget.properties.any((oldElement) =>
        !oldWidget.properties.any((e) => e.name == oldElement.name));
    if (removedProperty || addedProperty || widget.name != oldWidget.name) {
      setState(() {
        controller = KnobsController(
          name: widget.name,
          properties: widget.properties,
          documentation: widget.documentation,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KnobsProvider(
      controller: controller,
      child: Builder(
        builder: (context) {
          final controller = Knobs.of(context);
          return widget.builder?.call(context, controller.data, widget.child) ??
              widget.child!;
        },
      ),
    );
  }
}
