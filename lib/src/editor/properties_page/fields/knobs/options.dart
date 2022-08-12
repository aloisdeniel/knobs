import 'package:flutter/widgets.dart';
import 'package:preview_knobs/src/editor/base/icon.dart';
import 'package:preview_knobs/src/editor/theme.dart';
import 'package:preview_knobs/src/extensions.dart';
import 'package:preview_knobs/src/property.dart';

class OptionsKnob extends StatefulWidget {
  const OptionsKnob({
    super.key,
    required this.property,
  });
  final OptionsProperty property;

  @override
  State<OptionsKnob> createState() => _OptionsKnobState();
}

class _OptionsKnobState extends State<OptionsKnob> {
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    final theme =
        KnobsEditorTheme.of(context).field(!widget.property.isReadonly);
    final value = widget.property.read(context.knobs.data);

    return ClipRRect(
      borderRadius: (theme.decoration as BoxDecoration)
          .borderRadius
          ?.resolve(Directionality.of(context)),
      child: Container(
        decoration: theme.decoration,
        alignment: Alignment.centerLeft,
        child: AnimatedSize(
          duration: const Duration(milliseconds: 200),
          child: !widget.property.isReadonly && isOpened
              ? _Opened(
                  value: value,
                  property: widget.property,
                  onValueChanged: (newValue) {
                    final data = context.knobs.data.update(
                      widget.property,
                      newValue,
                    );
                    context.knobs.update(data);
                    isOpened = false;
                  },
                )
              : _Closed(
                  value: value,
                  property: widget.property,
                  onTap: () {
                    setState(() {
                      isOpened = true;
                    });
                  },
                ),
        ),
      ),
    );
  }
}

class _Closed extends StatelessWidget {
  const _Closed({
    required this.value,
    required this.property,
    required this.onTap,
  });
  final dynamic value;
  final OptionsProperty property;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).field(!property.isReadonly);
    final option = property.optionForValue(value);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: theme.padding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.name,
                style: theme.fieldValueStyle,
              ),
            ),
            const SizedBox(width: 4),
            KnobsIcon(
              KnobsIconData.chevronDown,
              color: theme.foregroundColor,
            )
          ],
        ),
      ),
    );
  }
}

class _Opened extends StatelessWidget {
  const _Opened({
    required this.value,
    required this.property,
    required this.onValueChanged,
  });
  final dynamic value;
  final OptionsProperty property;
  final ValueChanged onValueChanged;

  @override
  Widget build(BuildContext context) {
    final option = property.optionForValue(value);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 220),
      child: ListView(
        shrinkWrap: true,
        children: [
          ...property.options.map(
            (e) => _OpenedTile(
              name: e.name,
              property: property,
              isSelected: e == option,
              onTap: () => onValueChanged(e.value),
            ),
          )
        ],
      ),
    );
  }
}

class _OpenedTile extends StatelessWidget {
  const _OpenedTile({
    required this.name,
    required this.property,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final OptionsProperty property;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = KnobsEditorTheme.of(context).option(isSelected);
    return GestureDetector(
      onTap: !isSelected ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: theme.decoration,
        padding: theme.padding,
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: theme.titleStyle,
              ),
            ),
            const SizedBox(width: 4),
            SizedBox(
              width: 16,
              height: 16,
              child: isSelected
                  ? KnobsIcon(
                      KnobsIconData.check,
                      color: theme.foregroundColor,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
