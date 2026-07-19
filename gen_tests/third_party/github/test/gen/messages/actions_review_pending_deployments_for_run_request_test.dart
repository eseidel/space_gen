// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsReviewPendingDeploymentsForRunRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsReviewPendingDeploymentsForRunRequest(
        environmentIds: <int>[161171787],
        state: ActionsReviewPendingDeploymentsForRunRequestState.approved,
        comment: 'Ship it!',
      );
      final parsed = ActionsReviewPendingDeploymentsForRunRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsReviewPendingDeploymentsForRunRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsReviewPendingDeploymentsForRunRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
