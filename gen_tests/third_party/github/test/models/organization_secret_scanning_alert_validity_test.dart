// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationSecretScanningAlertValidity', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationSecretScanningAlertValidity.active;
      final parsed = OrganizationSecretScanningAlertValidity.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrganizationSecretScanningAlertValidity.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationSecretScanningAlertValidity.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in OrganizationSecretScanningAlertValidity.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in OrganizationSecretScanningAlertValidity.values) {
        expect(
          OrganizationSecretScanningAlertValidity.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
