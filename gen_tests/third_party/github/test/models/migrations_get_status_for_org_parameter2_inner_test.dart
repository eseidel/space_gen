// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsGetStatusForOrgParameter2Inner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsGetStatusForOrgParameter2Inner.repositories;
      final parsed = MigrationsGetStatusForOrgParameter2Inner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        MigrationsGetStatusForOrgParameter2Inner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsGetStatusForOrgParameter2Inner.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MigrationsGetStatusForOrgParameter2Inner.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MigrationsGetStatusForOrgParameter2Inner.values) {
        expect(
          MigrationsGetStatusForOrgParameter2Inner.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
