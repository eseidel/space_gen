// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsCreateReviewCommentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsCreateReviewCommentRequest(
        body: 'example',
        commitId: 'example',
        path: 'example',
      );
      final parsed = PullsCreateReviewCommentRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsCreateReviewCommentRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            PullsCreateReviewCommentRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
