// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForPullRequestReviewCommentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForPullRequestReviewCommentRequest(
        content: ReactionsCreateForPullRequestReviewCommentRequestContent.plus1,
      );
      final parsed =
          ReactionsCreateForPullRequestReviewCommentRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForPullRequestReviewCommentRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForPullRequestReviewCommentRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
