// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReviewDismissedIssueEventDismissedReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReviewDismissedIssueEventDismissedReview(
        state: 'example',
        reviewId: 0,
        dismissalMessage: 'example',
      );
      final parsed = ReviewDismissedIssueEventDismissedReview.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReviewDismissedIssueEventDismissedReview.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReviewDismissedIssueEventDismissedReview.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
