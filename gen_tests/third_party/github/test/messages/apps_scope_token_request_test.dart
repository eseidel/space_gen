// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppsScopeTokenRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppsScopeTokenRequest(
        accessToken: 'e72e16c7e42f292c6912e7710c838347ae178b4a',
      );
      final parsed = AppsScopeTokenRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AppsScopeTokenRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppsScopeTokenRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
