// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineReviewedEventLinksHtml', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TimelineReviewedEventLinksHtml(href: 'example');
      final parsed = TimelineReviewedEventLinksHtml.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineReviewedEventLinksHtml.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineReviewedEventLinksHtml.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
