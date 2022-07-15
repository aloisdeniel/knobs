import 'package:flutter/material.dart';
import 'package:knobs/knobs.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
        title: Knobs(
          name: 'Title',
          properties: [
            Property<String>('text', widget.title),
            const Property<double>('fontSize', 12),
            const Property<String>('fontFamily', 'Roboto'),
            Property<FontWeight>.enumOptions('fontWeight', FontWeight.values),
          ],
          documentation: (context, data) {
            return '''This is a code sample example.

```dart
Text();
```''';
          },
          builder: (context, data, _) => GestureDetector(
            onTap: () => Knobs.showEditor(context),
            child: Text(
              context.knobs.read<String>('text'),
              style: TextStyle(
                fontSize: data.read<double>('fontSize'),
                fontFamily: data.read<String>('fontFamily'),
                fontWeight: data.read<FontWeight>('fontWeight'),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Knobs(
        name: 'FloatingButton',
        properties: [
          const Property<String>('tooltip', 'Increment'),
          const Property<double>('elevation', 0.5),
          const Property<bool>('isExtended', true),
          Property<Clip>.enumOptions('clipBehavior', Clip.values),
          const Property<Color?>('foregroundColor', null),
          const Property<String>('onTap', '(){}', isReadonly: true),
        ],
        builder: (context, data, _) => FloatingActionButton(
          onPressed: () => Knobs.showEditor(context),
          tooltip: data.read<String>('tooltip'),
          elevation: data.read<double>('elevation'),
          foregroundColor: data.read<Color?>('foregroundColor'),
          isExtended: data.read<bool>('isExtended'),
          clipBehavior: data.read<Clip>('clipBehavior'),
          child: const Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
