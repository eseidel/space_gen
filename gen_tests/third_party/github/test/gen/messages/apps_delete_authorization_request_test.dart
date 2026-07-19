// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppsDeleteAuthorizationRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppsDeleteAuthorizationRequest(accessToken: 'example');
      final parsed = AppsDeleteAuthorizationRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AppsDeleteAuthorizationRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppsDeleteAuthorizationRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
