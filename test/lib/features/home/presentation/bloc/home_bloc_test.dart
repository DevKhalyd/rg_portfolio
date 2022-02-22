import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_bloc.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {
  /*
    Why I added this override?
    Basically, the MockHomeRepository return a Null on "isMenuOpen"
    So I had to override it to return a bool.
   */
  @override
  bool get isMenuOpen => true;
}

void main() {
  group('HomeBloc - Test', () {
    // Example for these blocs:
    // https://github.com/felangel/bloc/blob/master/examples/flutter_weather/test/weather/cubit/weather_cubit_test.dart

    // NOTE: Example of hydrated bloc
    // Hydrated bloc: https://pub.dev/packages/hydrated_bloc
    // Error:https://github.com/felangel/bloc/issues/2022
    // Helper Storage:https://github.com/felangel/bloc/blob/master/examples/flutter_weather/test/helpers/hydrated_bloc.dart
    late HomeBloc homeBloc;

    // This is a non mocked instance of the HomeRepository.
    // Basically because the auto created by the library dont allow to interact between each one.

    late HomeRepository mockhomeRepository;

    setUp(() {
      // added to show Bloc’s states and its parameters pretty.
      EquatableConfig.stringify = true;
      mockhomeRepository = MockHomeRepository();
      homeBloc = HomeBloc(homeRepository: mockhomeRepository);
    });

    test('initial state is correct', () {
      expect(homeBloc.state, HomeLoaded());
    });

    // TODO: Read the bloc test parameters...

    /// Basically the error is because the bloc is not being hydrated. (Thinking...)
    /// Because the MockHomeRepo dont have a isMenuOpen.
    blocTest<HomeBloc, HomeState>(
      'emits [MyState] when HomeInitial is added.',
      build: () => homeBloc,
      act: (bloc) => bloc.add(HomeInitial()),
      verify: (bloc) => verify(() =>
          // Because u add a homeInitial, calls the toggleMenu
          bloc.homeRepository.toggleMenu()).called(1),
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
