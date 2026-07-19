// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackageVersionMetadataPackageType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackageVersionMetadataPackageType.npm;
      final parsed = PackageVersionMetadataPackageType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PackageVersionMetadataPackageType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackageVersionMetadataPackageType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PackageVersionMetadataPackageType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PackageVersionMetadataPackageType.values) {
        expect(
          PackageVersionMetadataPackageType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
