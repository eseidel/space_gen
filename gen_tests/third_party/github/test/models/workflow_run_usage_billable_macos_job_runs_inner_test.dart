// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsageBillableMacosJobRunsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsageBillableMacosJobRunsInner(
        jobId: 0,
        durationMs: 0,
      );
      final parsed = WorkflowRunUsageBillableMacosJobRunsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        WorkflowRunUsageBillableMacosJobRunsInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowRunUsageBillableMacosJobRunsInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
