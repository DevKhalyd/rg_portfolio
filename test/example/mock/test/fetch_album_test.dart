import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

// Help to create the missing classes
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// ignore: avoid_relative_lib_imports
import '../lib/fetch_album.dart';
import 'fetch_album_test.mocks.dart';

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  // Group of test to know if the methods are working fine
  group('Testing fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      final mockClient = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(mockClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await fetchAlbum(mockClient), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
