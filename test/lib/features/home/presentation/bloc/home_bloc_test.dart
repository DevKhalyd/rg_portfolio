import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rg_portfolio/features/home/presentation/bloc/home_repository.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  group('Toggle Method', () {
    late MockHomeRepository homeRepo;

    // Not necessary in this case
    setUp(() {
      homeRepo = MockHomeRepository();
    });

    test('toggle menu one time', () {
      homeRepo.toggleMenu();
      verify(homeRepo.toggleMenu());
    });

    test('Toggle Menu two times', () {
      homeRepo.toggleMenu();
      homeRepo.toggleMenu();
      verify(homeRepo.toggleMenu()).called(2);
    });
  });
}
