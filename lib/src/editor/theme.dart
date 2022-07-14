import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class KnobEditorThemeData extends Equatable {
  KnobEditorThemeData.dark({
    Color accent = const Color(0xFF3A4EFF),
  })  : page = const KnobEditorPageThemeData(
          backgroundColor: Color(0xFF13151F),
        ),
        header = const KnobEditorHeaderThemeData(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFF1E2133),
              ),
            ),
          ),
          backButtonForegroundColor: Color(0xFF545A91),
          closeButtonForegroundColor: Color(0xFF545A91),
          titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A4EFF),
            decoration: TextDecoration.none,
          ),
          titleStackedTopStyle: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Color(0xFF3A4EFF),
            decoration: TextDecoration.none,
          ),
          titleStackedBottomStyle: TextStyle(
            fontSize: 12,
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
        margin = const EdgeInsets.all(24),
        borderRadius = const BorderRadius.all(Radius.circular(8));

  const KnobEditorThemeData({
    required this.page,
    required this.header,
    required this.disabledField,
    required this.enabledField,
    required this.borderRadius,
    required this.margin,
  });

  final KnobEditorPageThemeData page;
  final KnobEditorHeaderThemeData header;
  final KnobEditorFieldThemeData enabledField;
  final KnobEditorFieldThemeData disabledField;
  final BorderRadius borderRadius;
  final EdgeInsets margin;

  KnobEditorFieldThemeData field(bool enabled) =>
      enabled ? enabledField : disabledField;

  @override
  List<Object?> get props => [
        page,
        header,
        enabledField,
        disabledField,
        borderRadius,
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
