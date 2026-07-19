// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('MigrationsStartImportRequestVcs', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MigrationsStartImportRequestVcs.subversion;
      final parsed = MigrationsStartImportRequestVcs.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MigrationsStartImportRequestVcs.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MigrationsStartImportRequestVcs.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in MigrationsStartImportRequestVcs.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in MigrationsStartImportRequestVcs.values) {
        expect(
          MigrationsStartImportRequestVcs.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
