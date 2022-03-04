import 'package:flutter/material.dart';

// Principles of material design: https://material.io/design/color/dark-theme.html#properties

// Some tips: https://stackoverflow.com/questions/60232070/how-to-implement-dark-mode-in-flutter/67714404#67714404

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.platformBrightnessOf(context);

    print('theme: $theme');

    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.light(),
      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(
        // Colors which have amber is because i did not find for what is
        primary: Colors.amber,
        onPrimary: Colors.amber,
        primaryVariant: Colors.amber,
        // ICONS ETC...
        onSecondary: Colors.black,
        // BUTTONs
        secondary: Colors.red,
        // Text Colors for titles
        onSurface: Colors.blueAccent,
        // TODO: keep testing
      )),
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.ad_units),
          onPressed: () {
            setState(() {
              darkMode = !darkMode;
            });
          },
        ),
      ),
    );
  }
}
