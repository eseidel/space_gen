// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowUsageBillableWindows', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowUsageBillableWindows();
      final parsed = WorkflowUsageBillableWindows.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowUsageBillableWindows.maybeFromJson(null), isNull);
    });
  });
}
