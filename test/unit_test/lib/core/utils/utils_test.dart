// First test made by my own.

import 'package:flutter_test/flutter_test.dart';
import 'package:rg_portfolio/core/utils/utils.dart';

void main() {
  group('basic information', () {
    test('owner name', () {
      expect(Utils.name, 'Rolando Garcia');
    });

    test('owner email', () {
      expect(Utils.email, 'rolandocontactme@gmail.com');
    });

    test('is Degging', () {
      /// Should be false because this is a release version when the test runs...
      expect(Utils.isDebugging, false);
    });
  });

  group('methods', () {
    test('url for my own website', () {
      expect(Utils.getUrlForOwnWebsite('something'),
          contains('https://rolando-garcia.netlify.app/#/'));
    });
  });
}
