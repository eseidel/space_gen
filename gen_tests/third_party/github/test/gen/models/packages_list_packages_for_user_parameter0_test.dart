// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PackagesListPackagesForUserParameter0', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PackagesListPackagesForUserParameter0.npm;
      final parsed = PackagesListPackagesForUserParameter0.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PackagesListPackagesForUserParameter0.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PackagesListPackagesForUserParameter0.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PackagesListPackagesForUserParameter0.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PackagesListPackagesForUserParameter0.values) {
        expect(
          PackagesListPackagesForUserParameter0.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
