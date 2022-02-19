import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeRepository homeRepo;

  // Not necessary in this case
  setUp(() {
    homeRepo = MockHomeRepository();
  });

  group('void methods', () {
    test('toggle menu one time', () {
      // Necessary to use with verify
      homeRepo.toggleMenu();
      verify(() => homeRepo.toggleMenu());
    });

    test('toggle Menu two times', () {
      homeRepo.toggleMenu();
      homeRepo.toggleMenu();
      verify(() => homeRepo.toggleMenu()).called(2);
    });

    test('update Items', () {
      final item = SearchItem.test();

      homeRepo.updateSearchItem(item);
      verify(() => homeRepo.updateSearchItem(item));
    });
  });

  group('Open links to my personal info', () {
    test('open github', () {
      homeRepo.openGitHub();
      verify(() => homeRepo.openGitHub());
    });

    test('open linkedin', () {
      homeRepo.openLinkedIn();
      verify(() => homeRepo.openLinkedIn());
    });
  });

  // NOTE: U could create an interface to implement in a mock repository and this
  // way can be tested

  group('Test with the real logic menu open / close function', () {
    late MockHomeRepository homeRepository;

    setUp(() {
      homeRepository = MockHomeRepository();
    });

    test('isMenuOpen default value should be false', () {
      when(() => homeRepository.isMenuOpen).thenAnswer((_) => false);
      expect(homeRepository.isMenuOpen, false);
    });

    test('when toggleMenu is called the isMenuOpen should be true', () {
      homeRepository.toggleMenu();
      verify(() => homeRepository.toggleMenu()).called(1);
      when(() => homeRepository.isMenuOpen).thenAnswer((_) => true);
      expect(homeRepository.isMenuOpen, true);
    });
  });
}
