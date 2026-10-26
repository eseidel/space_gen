// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesListPackagesForAuthenticatedUserPackageType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackagesListPackagesForAuthenticatedUserPackageType.npm;
      final parsed =
          PackagesListPackagesForAuthenticatedUserPackageType.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PackagesListPackagesForAuthenticatedUserPackageType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackagesListPackagesForAuthenticatedUserPackageType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in PackagesListPackagesForAuthenticatedUserPackageType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in PackagesListPackagesForAuthenticatedUserPackageType.values) {
        expect(
          PackagesListPackagesForAuthenticatedUserPackageType.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
