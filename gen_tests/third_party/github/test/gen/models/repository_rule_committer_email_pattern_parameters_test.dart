// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleCommitterEmailPatternParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCommitterEmailPatternParameters(
        operator_:
            RepositoryRuleCommitterEmailPatternParametersOperator.startsWith,
        pattern: 'example',
      );
      final parsed =
          RepositoryRuleCommitterEmailPatternParameters.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleCommitterEmailPatternParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleCommitterEmailPatternParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
