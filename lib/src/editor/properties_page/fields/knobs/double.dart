import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knobs/src/editor/theme.dart';
import 'package:knobs/src/extensions.dart';
import 'package:knobs/src/property.dart';

class DoubleKnob extends StatefulWidget {
  const DoubleKnob({
    super.key,
    required this.property,
  });
  final Property<double> property;

  @override
  State<DoubleKnob> createState() => _StringKnobState();
}

class _StringKnobState extends State<DoubleKnob> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final value = context.knobs.data.read(widget.property).toString();
    if (value != controller.text) {
      controller.text = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme =
        KnobsEditorTheme.of(context).field(!widget.property.isReadonly);
    final value = context.knobs.data.read(widget.property);
    return Container(
      decoration: theme.decoration,
      padding: theme.padding,
      alignment: Alignment.centerLeft,
      child: Material(
        color: Colors.transparent,
        child: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
          ],
          onChanged: (newValue) {
            final newNum = double.tryParse(newValue);
            if (newNum != null && newNum != value) {
              context.knobs.write<double>(widget.property.name, newNum);
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
