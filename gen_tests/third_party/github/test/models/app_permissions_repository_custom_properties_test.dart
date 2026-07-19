// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('AppPermissionsRepositoryCustomProperties', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AppPermissionsRepositoryCustomProperties.read;
      final parsed = AppPermissionsRepositoryCustomProperties.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        AppPermissionsRepositoryCustomProperties.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AppPermissionsRepositoryCustomProperties.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in AppPermissionsRepositoryCustomProperties.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AppPermissionsRepositoryCustomProperties.values) {
        expect(
          AppPermissionsRepositoryCustomProperties.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
