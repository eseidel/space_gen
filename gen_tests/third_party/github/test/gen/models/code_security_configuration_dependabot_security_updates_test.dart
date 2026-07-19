// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityConfigurationDependabotSecurityUpdates', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          CodeSecurityConfigurationDependabotSecurityUpdates.enabled;
      final parsed =
          CodeSecurityConfigurationDependabotSecurityUpdates.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityConfigurationDependabotSecurityUpdates.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityConfigurationDependabotSecurityUpdates.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in CodeSecurityConfigurationDependabotSecurityUpdates.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in CodeSecurityConfigurationDependabotSecurityUpdates.values) {
        expect(
          CodeSecurityConfigurationDependabotSecurityUpdates.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
