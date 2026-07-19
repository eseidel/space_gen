// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewCommentLinksHtml', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PullRequestReviewCommentLinksHtml(
        href: Uri.parse('https://example.com'),
      );
      final parsed = PullRequestReviewCommentLinksHtml.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestReviewCommentLinksHtml.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewCommentLinksHtml.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
