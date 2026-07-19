// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleWorkflowsParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleWorkflowsParameters(
        workflows: <RepositoryRuleParamsWorkflowFileReference>[
          RepositoryRuleParamsWorkflowFileReference(
            path: 'example',
            repositoryId: 0,
          ),
        ],
      );
      final parsed = RepositoryRuleWorkflowsParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleWorkflowsParameters.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleWorkflowsParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
