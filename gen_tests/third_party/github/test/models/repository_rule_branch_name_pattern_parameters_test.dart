// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleBranchNamePatternParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleBranchNamePatternParameters(
        operator_: RepositoryRuleBranchNamePatternParametersOperator.startsWith,
        pattern: 'example',
      );
      final parsed = RepositoryRuleBranchNamePatternParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleBranchNamePatternParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleBranchNamePatternParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
