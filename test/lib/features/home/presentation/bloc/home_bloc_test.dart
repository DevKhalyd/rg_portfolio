import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_bloc.dart';

import 'home_repository_test.mocks.dart';


void main() {
  group('HomeBloc - Test', () {

    // TODO: Implement those ways for bloc testing
    // Example for these blocs:
    // https://github.com/felangel/bloc/blob/master/examples/flutter_weather/test/weather/cubit/weather_cubit_test.dart
    // https://stackoverflow.com/questions/67371802/dart-type-null-is-not-a-subtype-of-type-futurestring-in-mockito
    late HomeBloc homeBloc;

    // This is a non mocked instance of the HomeRepository.
    // Basically because the auto created by the library dont allow to interact between each one.

    late MockHomeRepository mockhomeRepository;

    setUp(() {
      // added to show Bloc’s states and its parameters pretty.
      EquatableConfig.stringify = true;
      mockhomeRepository = MockHomeRepository();
      homeBloc = HomeBloc(homeRepository: mockhomeRepository);
    });

    // TODO: Read the errors

    blocTest<HomeBloc, HomeState>(
      'emits [HomeToggleMenu] when HomeTogglePressed is added.',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeTogglePressed(menu: Container())),
      expect: () => [
        isA<HomeToggleMenu>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoaded] when HomeInitial is added.',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeInitial()),
      expect: () => [
        isA<HomeLoaded>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeSelectedSearch] when HomeSelectedSearch is added.',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeSelectedSearch(item: SearchItem.test())),
      expect: () => [
        isA<HomeSearch>(),
      ],
    );

    tearDown(() {
      homeBloc.close();
    });
  });
}
