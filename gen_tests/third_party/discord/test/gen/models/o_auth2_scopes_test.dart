// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('OAuth2Scopes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OAuth2Scopes.identify;
      final parsed = OAuth2Scopes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OAuth2Scopes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OAuth2Scopes.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OAuth2Scopes.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OAuth2Scopes.values) {
        expect(OAuth2Scopes.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
