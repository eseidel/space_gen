// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewCommentLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PullRequestReviewCommentLinks(
        self: PullRequestReviewCommentLinksSelf(
          href: Uri.parse('https://example.com'),
        ),
        html: PullRequestReviewCommentLinksHtml(
          href: Uri.parse('https://example.com'),
        ),
        pullRequest: PullRequestReviewCommentLinksPullRequest(
          href: Uri.parse('https://example.com'),
        ),
      );
      final parsed = PullRequestReviewCommentLinks.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestReviewCommentLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewCommentLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
