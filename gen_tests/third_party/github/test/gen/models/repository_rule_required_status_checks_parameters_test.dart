// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleRequiredStatusChecksParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleRequiredStatusChecksParameters(
        requiredStatusChecks: <RepositoryRuleParamsStatusCheckConfiguration>[
          RepositoryRuleParamsStatusCheckConfiguration(context: 'example'),
        ],
        strictRequiredStatusChecksPolicy: false,
      );
      final parsed = RepositoryRuleRequiredStatusChecksParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleRequiredStatusChecksParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleRequiredStatusChecksParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
