// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleRequiredLinearHistoryType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          RepositoryRuleRequiredLinearHistoryType.requiredLinearHistory;
      final parsed = RepositoryRuleRequiredLinearHistoryType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleRequiredLinearHistoryType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleRequiredLinearHistoryType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in RepositoryRuleRequiredLinearHistoryType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in RepositoryRuleRequiredLinearHistoryType.values) {
        expect(
          RepositoryRuleRequiredLinearHistoryType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
