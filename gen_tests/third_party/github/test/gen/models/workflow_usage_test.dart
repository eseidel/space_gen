// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowUsage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowUsage(billable: WorkflowUsageBillable());
      final parsed = WorkflowUsage.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowUsage.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WorkflowUsage.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
