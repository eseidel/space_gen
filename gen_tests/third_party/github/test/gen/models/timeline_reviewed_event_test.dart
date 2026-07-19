// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TimelineReviewedEvent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TimelineReviewedEvent(
        event: 'example',
        id: 42,
        nodeId: 'MDE3OlB1bGxSZXF1ZXN0UmV2aWV3ODA=',
        user: SimpleUser(
          login: 'octocat',
          id: 1,
          nodeId: 'MDQ6VXNlcjE=',
          avatarUrl: Uri.parse('https://example.com'),
          gravatarId: '41d064eb2195891e12d0413f63227ea7',
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
          followersUrl: Uri.parse('https://example.com'),
          followingUrl:
              'https://api.github.com/users/octocat/following{/other_user}',
          gistsUrl: 'https://api.github.com/users/octocat/gists{/gist_id}',
          starredUrl:
              'https://api.github.com/users/octocat/starred{/owner}{/repo}',
          subscriptionsUrl: Uri.parse('https://example.com'),
          organizationsUrl: Uri.parse('https://example.com'),
          reposUrl: Uri.parse('https://example.com'),
          eventsUrl: 'https://api.github.com/users/octocat/events{/privacy}',
          receivedEventsUrl: Uri.parse('https://example.com'),
          type: 'User',
          siteAdmin: false,
        ),
        body: 'This looks great.',
        state: 'CHANGES_REQUESTED',
        htmlUrl: Uri.parse('https://example.com'),
        pullRequestUrl: Uri.parse('https://example.com'),
        links: const TimelineReviewedEventLinks(
          html: TimelineReviewedEventLinksHtml(href: 'example'),
          pullRequest: TimelineReviewedEventLinksPullRequest(href: 'example'),
        ),
        commitId: '54bb654c9e6025347f57900a4a5c2313a96b8035',
        authorAssociation: AuthorAssociation.collaborator,
      );
      final parsed = TimelineReviewedEvent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TimelineReviewedEvent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TimelineReviewedEvent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
