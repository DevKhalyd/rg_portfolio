import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes.dart';
import 'core/utils.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/bloc/home_repository.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => HomeBloc(
                    homeRepository: HomeRepository(),
                  ))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Utils.appName,
          initialRoute: Routes.home,
          routes: Routes.routes,
        ));
  }
}
