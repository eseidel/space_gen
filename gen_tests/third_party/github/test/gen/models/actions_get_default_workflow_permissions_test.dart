// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsGetDefaultWorkflowPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsGetDefaultWorkflowPermissions(
        defaultWorkflowPermissions: ActionsDefaultWorkflowPermissions.read,
        canApprovePullRequestReviews: ActionsCanApprovePullRequestReviews(
          false,
        ),
      );
      final parsed = ActionsGetDefaultWorkflowPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsGetDefaultWorkflowPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsGetDefaultWorkflowPermissions.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
