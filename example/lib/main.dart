import 'package:flutter/material.dart';
import 'package:preview_knobs/preview_knobs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => KnobsEditor(child: child!),
      home: const MyHomePage(title: 'Preview Knobs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const PreviewText(),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Tap on the title or floating action button to open the editor.',
            ),
          ],
        ),
      ),
      floatingActionButton: const PreviewFloatingActionButton(),
    );
  }
}

class PreviewText extends StatelessWidget {
  const PreviewText({
    super.key,
  });

  static const text = Property<String>('text', 'Preview Knobs');
  static const fontSize = Property<double>('fontSize', 12);
  static const fontFamily = Property<String>('fontFamily', 'Roboto');
  static final fontWeight =
      Property<FontWeight>.enumOptions('fontWeight', FontWeight.values);

  @override
  Widget build(BuildContext context) {
    return Knobs(
      name: 'Text',
      properties: [
        text,
        fontSize,
        fontFamily,
        fontWeight,
      ],
      documentation: (context, data) {
        return '''This is a code sample example.\n\n```dart\nText();\n```''';
      },
      builder: (context, data, _) => GestureDetector(
        onTap: () => Knobs.showEditor(context),
        child: Text(
          text.read(data),
          style: TextStyle(
            fontSize: fontSize.read(data),
            fontFamily: fontFamily.read(data),
            fontWeight: fontWeight.read(data),
          ),
        ),
      ),
    );
  }
}

class PreviewFloatingActionButton extends StatelessWidget {
  const PreviewFloatingActionButton({
    super.key,
  });

  static const tooltip = Property<String>('tooltip', 'Increment');
  static const elevation = Property<double>('elevation', 0.5);
  static const isExtended = Property<bool>('isExtended', true);
  static final clipBehavior =
      Property<Clip>.enumOptions('clipBehavior', Clip.values);
  static const foregroundColor = Property<Color?>('foregroundColor', null);
  static const onTap = Property<String>('onTap', '(){}', isReadonly: true);

  @override
  Widget build(BuildContext context) {
    return Knobs(
      name: 'FloatingActionButton',
      properties: [
        tooltip,
        elevation,
        isExtended,
        clipBehavior,
        foregroundColor,
        onTap,
      ],
      builder: (context, data, _) => FloatingActionButton(
        onPressed: () => Knobs.showEditor(context),
        tooltip: tooltip.read(data),
        elevation: elevation.read(data),
        foregroundColor: foregroundColor.read(data),
        isExtended: isExtended.read(data),
        clipBehavior: clipBehavior.read(data),
        child: const Icon(Icons.add),
      ),
    );
  }
}
