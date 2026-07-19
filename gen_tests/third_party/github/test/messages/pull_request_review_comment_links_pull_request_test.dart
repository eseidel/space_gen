// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewCommentLinksPullRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PullRequestReviewCommentLinksPullRequest(
        href: Uri.parse('https://example.com'),
      );
      final parsed = PullRequestReviewCommentLinksPullRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PullRequestReviewCommentLinksPullRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewCommentLinksPullRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
