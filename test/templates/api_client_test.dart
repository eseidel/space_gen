import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:space_gen/templates/api_client.dart';
import 'package:test/test.dart';

void main() {
  group('ApiClient._resolveUri', () {
    test('omits trailing ? when there are no query params at all', () async {
      // Regression for issue #136: `Uri.replace(queryParameters: {})` always
      // appends `?`. Endpoints with no query params should ship clean URLs.
      Uri? captured;
      final client = ApiClient(
        baseUri: Uri.parse('https://example.com'),
        client: MockClient((req) async {
          captured = req.url;
          return Response('', 200);
        }),
      );
      await client.invokeApi(method: Method.get, path: '/things');
      expect(captured.toString(), 'https://example.com/things');
    });

    test('appends ? only when there are real params', () async {
      Uri? captured;
      final client = ApiClient(
        baseUri: Uri.parse('https://example.com'),
        client: MockClient((req) async {
          captured = req.url;
          return Response('', 200);
        }),
      );
      await client.invokeApi(
        method: Method.get,
        path: '/things',
        queryParameters: {
          'foo': ['bar'],
        },
      );
      expect(captured.toString(), 'https://example.com/things?foo=bar');
    });
  });
}
