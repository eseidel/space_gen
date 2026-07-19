// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationIdentityProviderAuthType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationIdentityProviderAuthType.oidc;
      final parsed = ApplicationIdentityProviderAuthType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationIdentityProviderAuthType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationIdentityProviderAuthType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationIdentityProviderAuthType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationIdentityProviderAuthType.values) {
        expect(
          ApplicationIdentityProviderAuthType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
