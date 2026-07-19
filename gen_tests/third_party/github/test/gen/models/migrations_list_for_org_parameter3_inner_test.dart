// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsListForOrgParameter3Inner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsListForOrgParameter3Inner.repositories;
      final parsed = MigrationsListForOrgParameter3Inner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MigrationsListForOrgParameter3Inner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsListForOrgParameter3Inner.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MigrationsListForOrgParameter3Inner.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MigrationsListForOrgParameter3Inner.values) {
        expect(
          MigrationsListForOrgParameter3Inner.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
