import 'package:flutter/material.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/extensions.dart';
import 'package:knobs/src/property.dart';

class StringKnob extends StatefulWidget {
  const StringKnob({
    super.key,
    required this.property,
  });
  final Property<String> property;

  @override
  State<StringKnob> createState() => _StringKnobState();
}

class _StringKnobState extends State<StringKnob> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = context.knobs.data.readProperty(widget.property);
    if (value != controller.text) {
      controller.text = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        KnobsEditorTheme.of(context).field(!widget.property.isReadonly);
    final value = context.knobs.data.readProperty(widget.property);
    return Container(
      decoration: theme.decoration,
      padding: theme.padding,
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: TextField(
          controller: controller,
          onChanged: (newValue) {
            if (newValue != value) {
              context.knobs.write<String>(widget.property.name, newValue);
            }
          },
          enabled: !widget.property.isReadonly,
          style: theme.fieldValueStyle,
          maxLines: null,
          decoration: const InputDecoration(
            isDense: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
