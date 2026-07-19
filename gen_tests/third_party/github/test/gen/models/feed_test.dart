// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Feed', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = Feed(
        timelineUrl: 'https://github.com/timeline',
        userUrl: 'https://github.com/{user}',
        links: FeedLinks(
          timeline: LinkWithType(href: 'example', type: 'example'),
          user: LinkWithType(href: 'example', type: 'example'),
        ),
      );
      final parsed = Feed.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Feed.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Feed.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
