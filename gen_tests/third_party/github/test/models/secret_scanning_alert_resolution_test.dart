// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningAlertResolution', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningAlertResolution.falsePositive;
      final parsed = SecretScanningAlertResolution.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningAlertResolution.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningAlertResolution.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in SecretScanningAlertResolution.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in SecretScanningAlertResolution.values) {
        expect(
          SecretScanningAlertResolution.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
