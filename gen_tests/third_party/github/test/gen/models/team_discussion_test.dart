// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamDiscussion', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamDiscussion(
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
        body: 'Please suggest improvements to our workflow in comments.',
        bodyHtml: '<p>Hi! This is an area for us to collaborate as a team</p>',
        bodyVersion: '0307116bbf7ced493b8d8a346c650b71',
        commentsCount: 0,
        commentsUrl: Uri.parse('https://example.com'),
        createdAt: DateTime.utc(2024),
        lastEditedAt: DateTime.utc(2024),
        htmlUrl: Uri.parse('https://example.com'),
        nodeId: 'MDE0OlRlYW1EaXNjdXNzaW9uMQ==',
        number: 42,
        pinned: false,
        private: false,
        teamUrl: Uri.parse('https://example.com'),
        title: 'How can we improve our workflow?',
        updatedAt: DateTime.utc(2024),
        url: Uri.parse('https://example.com'),
      );
      final parsed = TeamDiscussion.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamDiscussion.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamDiscussion.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
