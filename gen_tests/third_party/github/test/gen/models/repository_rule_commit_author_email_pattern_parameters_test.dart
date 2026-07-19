// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleCommitAuthorEmailPatternParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCommitAuthorEmailPatternParameters(
        operator_:
            RepositoryRuleCommitAuthorEmailPatternParametersOperator.startsWith,
        pattern: 'example',
      );
      final parsed =
          RepositoryRuleCommitAuthorEmailPatternParameters.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleCommitAuthorEmailPatternParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleCommitAuthorEmailPatternParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
