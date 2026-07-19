// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsRemoveRequestedReviewersRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsRemoveRequestedReviewersRequest(
        reviewers: <String>['example'],
      );
      final parsed = PullsRemoveRequestedReviewersRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsRemoveRequestedReviewersRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullsRemoveRequestedReviewersRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
