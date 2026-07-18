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

    test('multipart path also drops trailing ?', () async {
      // `invokeApiMultipart` reuses `_resolveUri`, so the same shortcut
      // has to apply to the upload path too.
      Uri? captured;
      final client = ApiClient(
        baseUri: Uri.parse('https://example.com'),
        client: MockClient((req) async {
          captured = req.url;
          return Response('', 200);
        }),
      );
      await client.invokeApiMultipart(
        method: Method.post,
        path: '/upload',
        fields: const {},
        files: const [],
      );
      expect(captured.toString(), 'https://example.com/upload');
    });

    test(
      'auth-injected query params still survive the empty-shortcut',
      () async {
        // ApiKeyAuth with sendIn: query adds to the merged map after the op
        // contributes nothing. The shortcut must check the *merged* map, not
        // just the caller's queryParameters, or we'd drop the api key.
        Uri? captured;
        final client = ApiClient(
          baseUri: Uri.parse('https://example.com'),
          readSecret: (name) => name == 'MyKey' ? 'secret-value' : null,
          client: MockClient((req) async {
            captured = req.url;
            return Response('', 200);
          }),
        );
        await client.invokeApi(
          method: Method.get,
          path: '/things',
          authRequest: const ApiKeyAuth(
            name: 'token',
            sendIn: ApiKeyLocation.query,
            secretName: 'MyKey',
          ),
        );
        expect(
          captured.toString(),
          'https://example.com/things?token=secret-value',
        );
      },
    );

    // Regression for issue #139. The operation path is grafted onto
    // baseUri field-by-field rather than by string concatenation, so
    // baseUri's own path survives and its query/fragment can't swallow
    // the path.
    group('grafts the operation path onto baseUri', () {
      Future<String> sentUrlFor(String baseUri) async {
        Uri? captured;
        final client = ApiClient(
          baseUri: Uri.parse(baseUri),
          client: MockClient((req) async {
            captured = req.url;
            return Response('', 200);
          }),
        );
        await client.invokeApi(method: Method.get, path: '/things');
        return captured.toString();
      }

      test('keeps a path already on baseUri', () async {
        expect(
          await sentUrlFor('https://example.com/v2'),
          'https://example.com/v2/things',
        );
      });

      test('collapses a trailing slash instead of emitting //', () async {
        expect(
          await sentUrlFor('https://example.com/v2/'),
          'https://example.com/v2/things',
        );
      });

      test('keeps the path when baseUri carries a query', () async {
        // The concatenation this replaced produced
        // `https://example.com?ext=1/things`, which parses with an empty
        // path and `ext=1/things` as the query — the path was lost
        // entirely once `Uri.replace` rewrote the query.
        expect(
          await sentUrlFor('https://example.com?ext=1'),
          'https://example.com/things?ext=1',
        );
      });

      test('keeps both a path and a query on baseUri', () async {
        expect(
          await sentUrlFor('https://example.com/v2?ext=1'),
          'https://example.com/v2/things?ext=1',
        );
      });

      test('preserves userInfo and port, drops the fragment', () async {
        // A fragment is never sent to a server, so dropping it is
        // correct; concatenation used to mangle it into the path.
        expect(
          await sentUrlFor('https://user@example.com:8080/v2#frag'),
          'https://user@example.com:8080/v2/things',
        );
      });
    });

    // The query renderer builds the `List<String>` for each param. These
    // tests pin what the *actual* sent URL looks like for the two shapes it
    // produces, exercising the real `Uri.replace` encoding — not the
    // generated source string.
    test('array param (explode=true shape) repeats the key', () async {
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
          'tags': ['a', 'b', 'c'],
        },
      );
      expect(
        captured.toString(),
        'https://example.com/things?tags=a&tags=b&tags=c',
      );
      expect(captured!.queryParametersAll['tags'], ['a', 'b', 'c']);
    });

    test('comma-joined array (explode=false shape) is one param', () async {
      // `explode: false` renders a 1-element list holding the joined value;
      // `Uri.replace` percent-encodes the comma (%2C), which the server
      // decodes back to `a,b,c`.
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
          'tags': ['a,b,c'],
        },
      );
      expect(captured.toString(), 'https://example.com/things?tags=a%2Cb%2Cc');
      // A single value, and it decodes back to the comma-joined string.
      expect(captured!.queryParametersAll['tags'], ['a,b,c']);
    });

    test('reserved characters in a value are percent-encoded', () async {
      // Pins the `allowReserved: false` (default, and only) behavior we honor:
      // reserved chars are escaped, so the URL is always valid and the server
      // decodes them back. See parser `_parseSerialization`.
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
          'ref': ['kind:default/name'],
        },
      );
      expect(
        captured.toString(),
        'https://example.com/things?ref=kind%3Adefault%2Fname',
      );
      expect(captured!.queryParametersAll['ref'], ['kind:default/name']);
    });
  });
}
