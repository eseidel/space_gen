// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4
              .active;
      final parsed =
          PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4
              .values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4
              .values) {
        expect(
          PackagesGetAllPackageVersionsForPackageOwnedByAuthenticatedUserParameter4.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
