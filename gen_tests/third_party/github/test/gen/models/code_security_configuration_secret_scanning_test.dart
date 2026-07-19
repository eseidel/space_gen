// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeSecurityConfigurationSecretScanning', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeSecurityConfigurationSecretScanning.enabled;
      final parsed = CodeSecurityConfigurationSecretScanning.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeSecurityConfigurationSecretScanning.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeSecurityConfigurationSecretScanning.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CodeSecurityConfigurationSecretScanning.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CodeSecurityConfigurationSecretScanning.values) {
        expect(
          CodeSecurityConfigurationSecretScanning.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
