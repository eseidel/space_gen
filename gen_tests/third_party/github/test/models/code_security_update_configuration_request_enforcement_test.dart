// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityUpdateConfigurationRequestEnforcement', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodeSecurityUpdateConfigurationRequestEnforcement.enforced;
      final parsed =
          CodeSecurityUpdateConfigurationRequestEnforcement.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityUpdateConfigurationRequestEnforcement.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityUpdateConfigurationRequestEnforcement.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeSecurityUpdateConfigurationRequestEnforcement.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeSecurityUpdateConfigurationRequestEnforcement.values) {
        expect(
          CodeSecurityUpdateConfigurationRequestEnforcement.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
