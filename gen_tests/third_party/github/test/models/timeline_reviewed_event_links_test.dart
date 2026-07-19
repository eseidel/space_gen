// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineReviewedEventLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TimelineReviewedEventLinks(
        html: TimelineReviewedEventLinksHtml(href: 'example'),
        pullRequest: TimelineReviewedEventLinksPullRequest(href: 'example'),
      );
      final parsed = TimelineReviewedEventLinks.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineReviewedEventLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineReviewedEventLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
