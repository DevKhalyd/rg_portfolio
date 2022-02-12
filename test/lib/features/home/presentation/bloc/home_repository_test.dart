import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rg_portfolio/features/home/domain/usecases/searcher_item.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

import 'home_repository_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late MockHomeRepository homeRepo;

  // Not necessary in this case
  setUp(() {
    homeRepo = MockHomeRepository();
  });

  group('void methods', () {
    test('toggle menu one time', () {
      // Necessary to use with verify
      homeRepo.toggleMenu();
      verify(homeRepo.toggleMenu());
    });

    test('toggle Menu two times', () {
      homeRepo.toggleMenu();
      homeRepo.toggleMenu();
      verify(homeRepo.toggleMenu()).called(2);
    });

    test('update Items', () {
      final item = SearchItem.test();

      homeRepo.updateSearchItem(item);
      verify(homeRepo.updateSearchItem(item));
    });
  });

  group('Open links to my personal info', () {
    test('open github', () {
      homeRepo.openGitHub();
      verify(homeRepo.openGitHub());
    });

    test('open linkedin', () {
      homeRepo.openLinkedIn();
      verify(homeRepo.openLinkedIn());
    });
  });

  group('menu open / close function', () {
    late MockHomeRepository mockRepo;
    setUp(() {
      mockRepo = MockHomeRepository();
    });

    test('menu open', () {
      when(mockRepo.isMenuOpen).thenAnswer((_) => true);
      expect(mockRepo.isMenuOpen, true);
    });

    test('menu close', () {
      when(mockRepo.isMenuOpen).thenAnswer((_) => false);
      expect(mockRepo.isMenuOpen, false);
    });
  });
}
