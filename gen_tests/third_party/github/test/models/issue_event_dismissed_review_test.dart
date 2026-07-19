// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueEventDismissedReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = IssueEventDismissedReview(
        state: 'example',
        reviewId: 0,
        dismissalMessage: 'example',
      );
      final parsed = IssueEventDismissedReview.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueEventDismissedReview.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueEventDismissedReview.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
