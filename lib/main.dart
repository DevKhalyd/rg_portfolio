import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app.dart';

// Configuration file to initialize Firebase
// U need to create ur own file
import 'firebase_options.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // TODO: After removing the App widget, we need to wrap the App widget with ProviderScope
  runApp(ProviderScope(child: const App()));
}

// refs: https://pub.dev/packages/go_router, https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html