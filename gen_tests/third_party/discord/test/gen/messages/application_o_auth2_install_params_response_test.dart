// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationOAuth2InstallParamsResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationOAuth2InstallParamsResponse(
        scopes: const <OAuth2Scopes>[OAuth2Scopes.identify],
        permissions: 'example',
      );
      final parsed = ApplicationOAuth2InstallParamsResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ApplicationOAuth2InstallParamsResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationOAuth2InstallParamsResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
