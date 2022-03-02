import 'package:flutter/material.dart';

// Principles of material design: https://material.io/design/color/dark-theme.html#properties

// Some tips: https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter/67714404#67714404

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      // TODO: See the examples shown above and try to implement
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
