# Preview Knobs

Define custom panel for updating a set of properties.

![screenshot](doc/screenshot.png)

## Quickstart

Setup the editor area where the panel opens which will contains `Knobs` as descendents :

```dart
MaterialApp(
    builder: (context, child) => KnobsEditor(child: child!),
    // ...
)
```

Define a customizable area as a `Knobs` widget instance :

```dart
class PreviewText extends StatelessWidget {
  const PreviewText({
    super.key,
  });

  // Define editable properties with their default value
  static const text = Property<String>('text', 'Preview Knobs');
  static const fontSize = Property<double>('fontSize', 12);
  static final fontWeight = Property<FontWeight>.enumOptions('fontWeight', FontWeight.values);

  @override
  Widget build(BuildContext context) {
    return Knobs(
      name: 'Text',
      // Registers the properties
      properties: [
        text,
        fontSize,
        fontWeight,
      ],
      // Write dynamic documentation if you wish
      documentation: (context, data) {
        return '''This is a code sample example.\n\n```dart\nText();\n```''';
      },
      // Read the property values from data
      builder: (context, data, _) => GestureDetector(
        onTap: () => Knobs.showEditor(context),
        child: Text(
        text.read(data),
          style: TextStyle(
            fontSize: fontSize.read(data),
            fontWeight: fontWeight.read(data),
          ),
        ),
      ),
    );
  }
}
```

## Usage

Supported property types :

* `String`
* `double`
* `bool`
* Options with a set of predefined values any type (*with an helper for enums*).