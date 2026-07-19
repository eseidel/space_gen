// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestSimpleLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestSimpleLinks(
        comments: Link(href: 'example'),
        commits: Link(href: 'example'),
        statuses: Link(href: 'example'),
        html: Link(href: 'example'),
        issue: Link(href: 'example'),
        reviewComments: Link(href: 'example'),
        reviewComment: Link(href: 'example'),
        self: Link(href: 'example'),
      );
      final parsed = PullRequestSimpleLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestSimpleLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestSimpleLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
