// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesListPackagesForOrganizationParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackagesListPackagesForOrganizationParameter0.npm;
      final parsed =
          PackagesListPackagesForOrganizationParameter0.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PackagesListPackagesForOrganizationParameter0.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackagesListPackagesForOrganizationParameter0.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in PackagesListPackagesForOrganizationParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in PackagesListPackagesForOrganizationParameter0.values) {
        expect(
          PackagesListPackagesForOrganizationParameter0.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
