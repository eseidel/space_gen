// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsageBillableUbuntuJobRunsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsageBillableUbuntuJobRunsInner(
        jobId: 0,
        durationMs: 0,
      );
      final parsed = WorkflowRunUsageBillableUbuntuJobRunsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        WorkflowRunUsageBillableUbuntuJobRunsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowRunUsageBillableUbuntuJobRunsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
