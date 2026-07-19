// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleCommitterEmailPatternType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          RepositoryRuleCommitterEmailPatternType.committerEmailPattern;
      final parsed = RepositoryRuleCommitterEmailPatternType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleCommitterEmailPatternType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleCommitterEmailPatternType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryRuleCommitterEmailPatternType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryRuleCommitterEmailPatternType.values) {
        expect(
          RepositoryRuleCommitterEmailPatternType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
