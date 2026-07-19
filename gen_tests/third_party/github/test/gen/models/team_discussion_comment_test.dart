// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamDiscussionComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamDiscussionComment(
        author: SimpleUser(
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
        body: 'I agree with this suggestion.',
        bodyHtml: '<p>Do you like apples?</p>',
        bodyVersion: '0307116bbf7ced493b8d8a346c650b71',
        createdAt: DateTime.utc(2024),
        lastEditedAt: DateTime.utc(2024),
        discussionUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        nodeId: 'MDIxOlRlYW1EaXNjdXNzaW9uQ29tbWVudDE=',
        number: 42,
        updatedAt: DateTime.utc(2024),
        url: Uri.parse('https://example.com'),
      );
      final parsed = TeamDiscussionComment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamDiscussionComment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamDiscussionComment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
