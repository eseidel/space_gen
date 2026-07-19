// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReviewComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ReviewComment(
        url: Uri.parse('https://example.com'),
        pullRequestReviewId: 42,
        id: 10,
        nodeId: 'MDI0OlB1bGxSZXF1ZXN0UmV2aWV3Q29tbWVudDEw',
        diffHunk:
            '@@ -16,33 +16,40 @@ public class Connection : IConnection...',
        path: 'file1.txt',
        position: 1,
        originalPosition: 4,
        commitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
        originalCommitId: '9c48853fa3dc5c1c3d6f1f1cd1f2743e72652840',
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
        body: 'Great stuff',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        htmlUrl: Uri.parse('https://example.com'),
        pullRequestUrl: Uri.parse('https://example.com'),
        authorAssociation: AuthorAssociation.collaborator,
        links: const ReviewCommentLinks(
          self: Link(href: 'example'),
          html: Link(href: 'example'),
          pullRequest: Link(href: 'example'),
        ),
      );
      final parsed = ReviewComment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReviewComment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReviewComment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
