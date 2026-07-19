// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth2GetOpenIdConnectUserInfoResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OAuth2GetOpenIdConnectUserInfoResponse(sub: 'example');
      final parsed = OAuth2GetOpenIdConnectUserInfoResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OAuth2GetOpenIdConnectUserInfoResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OAuth2GetOpenIdConnectUserInfoResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
