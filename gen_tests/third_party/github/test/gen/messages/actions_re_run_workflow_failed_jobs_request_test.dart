// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsReRunWorkflowFailedJobsRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsReRunWorkflowFailedJobsRequest();
      final parsed = ActionsReRunWorkflowFailedJobsRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsReRunWorkflowFailedJobsRequest.maybeFromJson(null), isNull);
    });
  });
}
