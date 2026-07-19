// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppPermissionsOrganizationPersonalAccessTokenRequests', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          AppPermissionsOrganizationPersonalAccessTokenRequests.read;
      final parsed =
          AppPermissionsOrganizationPersonalAccessTokenRequests.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        AppPermissionsOrganizationPersonalAccessTokenRequests.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            AppPermissionsOrganizationPersonalAccessTokenRequests.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in AppPermissionsOrganizationPersonalAccessTokenRequests.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in AppPermissionsOrganizationPersonalAccessTokenRequests.values) {
        expect(
          AppPermissionsOrganizationPersonalAccessTokenRequests.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
