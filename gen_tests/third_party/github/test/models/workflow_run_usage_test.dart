// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowRunUsage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowRunUsage(billable: WorkflowRunUsageBillable());
      final parsed = WorkflowRunUsage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowRunUsage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowRunUsage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
