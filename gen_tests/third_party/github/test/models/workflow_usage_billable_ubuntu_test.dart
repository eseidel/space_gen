// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WorkflowUsageBillableUbuntu', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WorkflowUsageBillableUbuntu();
      final parsed = WorkflowUsageBillableUbuntu.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WorkflowUsageBillableUbuntu.maybeFromJson(null), isNull);
    });
  });
}
