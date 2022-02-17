import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_bloc.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

void main() {

  // TODO: Research for more ways to test blocs
  group('HomeBloc - Test', () {
    late HomeBloc homeBloc;

    // This is a non mocked instance of the HomeRepository.
    // Basically because the auto created by the library dont allow to interact between each one.

    late HomeRepository homeRepository;

    setUp(() {
      // added to show Bloc’s states and its parameters pretty.
      EquatableConfig.stringify = true;
      homeRepository = HomeRepository();
      homeBloc = HomeBloc(homeRepository: homeRepository);
    });

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
