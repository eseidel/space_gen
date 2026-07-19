// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsageBillableWindows', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsageBillableWindows(totalMs: 0, jobs: 0);
      final parsed = WorkflowRunUsageBillableWindows.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowRunUsageBillableWindows.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            WorkflowRunUsageBillableWindows.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
