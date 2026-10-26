// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsGetStatusForOrgExcludeInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsGetStatusForOrgExcludeInner.repositories;
      final parsed = MigrationsGetStatusForOrgExcludeInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MigrationsGetStatusForOrgExcludeInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsGetStatusForOrgExcludeInner.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MigrationsGetStatusForOrgExcludeInner.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MigrationsGetStatusForOrgExcludeInner.values) {
        expect(
          MigrationsGetStatusForOrgExcludeInner.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
