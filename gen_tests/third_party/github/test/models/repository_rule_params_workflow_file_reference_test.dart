// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleParamsWorkflowFileReference', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleParamsWorkflowFileReference(
        path: 'example',
        repositoryId: 0,
      );
      final parsed = RepositoryRuleParamsWorkflowFileReference.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleParamsWorkflowFileReference.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleParamsWorkflowFileReference.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
