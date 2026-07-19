// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('FeedLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = FeedLinks(
        timeline: LinkWithType(href: 'example', type: 'example'),
        user: LinkWithType(href: 'example', type: 'example'),
      );
      final parsed = FeedLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FeedLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FeedLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
