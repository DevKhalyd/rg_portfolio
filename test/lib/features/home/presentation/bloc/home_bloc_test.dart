import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_bloc.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

void main() {
  group('HomeBloc - Test', () {
    late HomeBloc homeBloc;
    late HomeRepository mockHomeRepository;

    setUp(() {
      // added to show Bloc’s states and its parameters pretty.
      EquatableConfig.stringify = true;
      mockHomeRepository = HomeRepository();
      homeBloc = HomeBloc(homeRepository: mockHomeRepository);
    });

    blocTest<HomeBloc, HomeState>(
      'emits [MyState] when MyEvent is added.',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeTogglePressed(menu: Container())),
      expect: () => [isA<HomeSearch>()],
    );

    tearDown(() {
      homeBloc.close();
    });
  });
}
