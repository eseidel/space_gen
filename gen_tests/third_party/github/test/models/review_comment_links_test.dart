// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReviewCommentLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReviewCommentLinks(
        self: Link(href: 'example'),
        html: Link(href: 'example'),
        pullRequest: Link(href: 'example'),
      );
      final parsed = ReviewCommentLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReviewCommentLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReviewCommentLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
