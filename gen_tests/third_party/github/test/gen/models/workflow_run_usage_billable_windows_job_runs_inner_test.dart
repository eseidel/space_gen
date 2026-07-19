// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsageBillableWindowsJobRunsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsageBillableWindowsJobRunsInner(
        jobId: 0,
        durationMs: 0,
      );
      final parsed = WorkflowRunUsageBillableWindowsJobRunsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        WorkflowRunUsageBillableWindowsJobRunsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowRunUsageBillableWindowsJobRunsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
