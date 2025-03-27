import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rg_portfolio/core/router/router.dart';

import 'core/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          physics: const BouncingScrollPhysics(),
        ),
        theme: ThemeData(
          // https://docs.flutter.dev/release/breaking-changes/buttons
          // Buttons styles.
          // https://docs.flutter.dev/development/ui/widgets/material
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
              overlayColor: WidgetStateProperty.all<Color>(Colors.grey.shade300),
            ),
          ),
        ),
        title: Utils.appName,
      ),
    );
  }
}
