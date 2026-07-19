// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestReviewLinks(
        html: PullRequestReviewLinksHtml(href: 'example'),
        pullRequest: PullRequestReviewLinksPullRequest(href: 'example'),
      );
      final parsed = PullRequestReviewLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestReviewLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
