import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class KnobEditorThemeData extends Equatable {
  KnobEditorThemeData.dark({
    Color accent = const Color(0xFF6473FF),
  })  : margin = const EdgeInsets.all(24),
        borderRadius = const BorderRadius.all(Radius.circular(8)),
        panelWidth = 280,
        page = const KnobEditorPageThemeData(
          backgroundColor: Color(0xFF13151F),
        ),
        header = KnobEditorHeaderThemeData(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF1E2133),
              ),
            ),
          ),
          backButtonForegroundColor: const Color(0xFF545A91),
          closeButtonForegroundColor: const Color(0xFF545A91),
          titleStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: accent,
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis,
          ),
          titleStackedTopStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: accent,
            decoration: TextDecoration.none,
          ),
          titleStackedBottomStyle: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.normal,
            color: Color(0xFFFFFFFF),
            decoration: TextDecoration.none,
          ),
        ),
        enabledField = KnobEditorFieldThemeData(
          contentMinHeight: 24,
          foregroundColor: accent,
          onForegroundColor: const Color(0xFFFFFFFF),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            color: Color(0xFF1E2133),
          ),
          fieldNameStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xFFFFFFFF),
            decoration: TextDecoration.none,
          ),
          fieldValueStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: accent,
            decoration: TextDecoration.none,
          ),
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),
        disabledField = const KnobEditorFieldThemeData(
          contentMinHeight: 24,
          foregroundColor: Color(0xFF545A91),
          onForegroundColor: Color(0xFFFFFFFF),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2),
            ),
            color: Color(0xFF161927),
          ),
          fieldNameStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xFF545A91),
            decoration: TextDecoration.none,
          ),
          fieldValueStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xFF545A91),
            decoration: TextDecoration.none,
          ),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
        ),
        unselectedOption = const KnobEditorOptionFieldThemeData(
          decoration: BoxDecoration(
            color: Color(0xFF181B29),
          ),
          foregroundColor: Color(0xFF545A91),
          titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0xFF545A91),
            decoration: TextDecoration.none,
          ),
          padding: EdgeInsets.all(8),
        ),
        selectedOption = KnobEditorOptionFieldThemeData(
          decoration: const BoxDecoration(
            color: Color(0x00161927),
          ),
          foregroundColor: accent,
          titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: accent,
            decoration: TextDecoration.none,
          ),
          padding: const EdgeInsets.all(8),
        ),
        docStyle = MarkdownStyleSheet.fromTheme(
          ThemeData.dark().copyWith(
            textTheme: ThemeData.dark().textTheme.copyWith(
                  bodyText2: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
          ),
        );

  const KnobEditorThemeData({
    required this.page,
    required this.header,
    required this.disabledField,
    required this.enabledField,
    required this.borderRadius,
    required this.margin,
    required this.panelWidth,
    required this.selectedOption,
    required this.unselectedOption,
    required this.docStyle,
  });

  final double panelWidth;
  final BorderRadius borderRadius;
  final EdgeInsets margin;
  final KnobEditorPageThemeData page;
  final KnobEditorHeaderThemeData header;
  final KnobEditorFieldThemeData enabledField;
  final KnobEditorFieldThemeData disabledField;
  final KnobEditorOptionFieldThemeData selectedOption;
  final KnobEditorOptionFieldThemeData unselectedOption;
  final MarkdownStyleSheet docStyle;

  KnobEditorFieldThemeData field(bool enabled) =>
      enabled ? enabledField : disabledField;

  KnobEditorOptionFieldThemeData option(bool selected) =>
      selected ? selectedOption : unselectedOption;

  @override
  List<Object?> get props => [
        page,
        panelWidth,
        margin,
        header,
        enabledField,
        disabledField,
        borderRadius,
        selectedOption,
        unselectedOption,
      ];
}

class KnobEditorPageThemeData extends Equatable {
  const KnobEditorPageThemeData({
    required this.backgroundColor,
  });

  final Color backgroundColor;

  @override
  List<Object?> get props => [
        backgroundColor,
      ];
}

class KnobEditorHeaderThemeData extends Equatable {
  const KnobEditorHeaderThemeData({
    required this.titleStyle,
    required this.backButtonForegroundColor,
    required this.closeButtonForegroundColor,
    required this.decoration,
    required this.titleStackedBottomStyle,
    required this.titleStackedTopStyle,
    required this.padding,
    required this.height,
  });

  final TextStyle titleStyle;
  final TextStyle titleStackedTopStyle;
  final TextStyle titleStackedBottomStyle;
  final Decoration decoration;
  final Color closeButtonForegroundColor;
  final Color backButtonForegroundColor;
  final EdgeInsets padding;
  final double height;

  @override
  List<Object?> get props => [
        titleStyle,
        titleStackedTopStyle,
        titleStackedBottomStyle,
        decoration,
        closeButtonForegroundColor,
        backButtonForegroundColor,
        padding,
        height,
      ];
}

class KnobEditorFieldThemeData extends Equatable {
  const KnobEditorFieldThemeData({
    required this.decoration,
    required this.foregroundColor,
    required this.onForegroundColor,
    required this.fieldNameStyle,
    required this.fieldValueStyle,
    required this.padding,
    required this.margin,
    required this.contentMinHeight,
  });

  final TextStyle fieldNameStyle;
  final TextStyle fieldValueStyle;
  final Color foregroundColor;
  final Color onForegroundColor;
  final Decoration decoration;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double contentMinHeight;

  @override
  List<Object?> get props => [
        fieldNameStyle,
        fieldValueStyle,
        foregroundColor,
        onForegroundColor,
        decoration,
        padding,
        margin,
        contentMinHeight,
      ];
}

class KnobEditorOptionFieldThemeData extends Equatable {
  const KnobEditorOptionFieldThemeData({
    required this.decoration,
    required this.foregroundColor,
    required this.titleStyle,
    required this.padding,
  });

  final TextStyle titleStyle;
  final Color foregroundColor;
  final Decoration decoration;
  final EdgeInsets padding;

  @override
  List<Object?> get props => [
        titleStyle,
        foregroundColor,
        decoration,
        padding,
      ];
}

class KnobsEditorTheme extends InheritedWidget {
  const KnobsEditorTheme({
    super.key,
    required super.child,
    required this.data,
  });

  final KnobEditorThemeData data;

  static final defaultData = KnobEditorThemeData.dark();

  static KnobEditorThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<KnobsEditorTheme>()
            ?.data ??
        defaultData;
  }

  @override
  bool updateShouldNotify(covariant KnobsEditorTheme oldWidget) {
    return oldWidget.data != data;
  }
}
