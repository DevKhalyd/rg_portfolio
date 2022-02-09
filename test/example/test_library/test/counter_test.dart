import 'package:flutter_test/flutter_test.dart';
// ignore: avoid_relative_lib_imports
import '../lib/counter.dart';


// Docs: https://pub.dev/packages/test


void main() {
  group('Counter', () {

    // The expected values should be tested

    test('Value should start at 0', () {
      expect(Counter().value, 0);
    });

    test('Value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('Value should be decremented', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}



/*

One test
test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });

 test('Counter', () {
    final counter = Counter();

    expect(counter.value, 0);

    counter.increment();

    expect(counter.value, 1);
  });

 */
