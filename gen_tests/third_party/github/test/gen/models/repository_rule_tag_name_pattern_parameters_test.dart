// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleTagNamePatternParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleTagNamePatternParameters(
        operator_: RepositoryRuleTagNamePatternParametersOperator.startsWith,
        pattern: 'example',
      );
      final parsed = RepositoryRuleTagNamePatternParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleTagNamePatternParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleTagNamePatternParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
