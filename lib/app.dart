import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'core/routes.dart';
import 'core/utils/utils.dart';
import 'features/home/data/api/home_cloud_firestore_repository.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (_) => HomeBloc(
                homeRepository: HomeRepository(HomeCloudFirestoreRepository()),
              ),
        ),
      ],
      // Note Here the data
      child: MaterialApp(
        builder: FlutterSmartDialog.init(),
        navigatorObservers: [FlutterSmartDialog.observer],
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
              overlayColor: WidgetStateProperty.all<Color>(
                Colors.grey.shade300,
              ),
            ),
          ),
        ),
        title: Utils.appName,
        initialRoute: Routes.initialRoute,
        routes: Routes.routes,
      ),
    );
  }
}
