// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PrivateUser', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PrivateUser(
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
        name: 'monalisa octocat',
        company: 'GitHub',
        blog: 'https://github.com/blog',
        location: 'San Francisco',
        email: 'user@example.com',
        hireable: false,
        bio: 'There once was...',
        publicRepos: 2,
        publicGists: 1,
        followers: 20,
        following: 0,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        privateGists: 81,
        totalPrivateRepos: 100,
        ownedPrivateRepos: 100,
        diskUsage: 10000,
        collaborators: 8,
        twoFactorAuthentication: false,
      );
      final parsed = PrivateUser.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PrivateUser.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PrivateUser.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
