// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesListPackagesForAuthenticatedUserParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackagesListPackagesForAuthenticatedUserParameter0.npm;
      final parsed =
          PackagesListPackagesForAuthenticatedUserParameter0.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PackagesListPackagesForAuthenticatedUserParameter0.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackagesListPackagesForAuthenticatedUserParameter0.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in PackagesListPackagesForAuthenticatedUserParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in PackagesListPackagesForAuthenticatedUserParameter0.values) {
        expect(
          PackagesListPackagesForAuthenticatedUserParameter0.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
