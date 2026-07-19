// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppPermissionsOrganizationAdministration', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppPermissionsOrganizationAdministration.read;
      final parsed = AppPermissionsOrganizationAdministration.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        AppPermissionsOrganizationAdministration.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppPermissionsOrganizationAdministration.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AppPermissionsOrganizationAdministration.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AppPermissionsOrganizationAdministration.values) {
        expect(
          AppPermissionsOrganizationAdministration.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
