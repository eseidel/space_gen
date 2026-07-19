// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsageBillableUbuntu', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsageBillableUbuntu(totalMs: 0, jobs: 0);
      final parsed = WorkflowRunUsageBillableUbuntu.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowRunUsageBillableUbuntu.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowRunUsageBillableUbuntu.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
