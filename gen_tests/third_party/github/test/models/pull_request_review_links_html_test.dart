// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewLinksHtml', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestReviewLinksHtml(href: 'example');
      final parsed = PullRequestReviewLinksHtml.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestReviewLinksHtml.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewLinksHtml.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
