// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleCommitMessagePatternParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCommitMessagePatternParameters(
        operator_:
            RepositoryRuleCommitMessagePatternParametersOperator.startsWith,
        pattern: 'example',
      );
      final parsed = RepositoryRuleCommitMessagePatternParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleCommitMessagePatternParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleCommitMessagePatternParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
