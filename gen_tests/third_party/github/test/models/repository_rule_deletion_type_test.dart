// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleDeletionType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleDeletionType.deletion;
      final parsed = RepositoryRuleDeletionType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleDeletionType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            RepositoryRuleDeletionType.maybeFromJson('__invalid_enum_value__'),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryRuleDeletionType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryRuleDeletionType.values) {
        expect(
          RepositoryRuleDeletionType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
