// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PublicUser', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PublicUser(
        login: 'example',
        id: 0,
        nodeId: 'example',
        avatarUrl: Uri.parse('https://example.com'),
        gravatarId: 'example',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        followersUrl: Uri.parse('https://example.com'),
        followingUrl: 'example',
        gistsUrl: 'example',
        starredUrl: 'example',
        subscriptionsUrl: Uri.parse('https://example.com'),
        organizationsUrl: Uri.parse('https://example.com'),
        reposUrl: Uri.parse('https://example.com'),
        eventsUrl: 'example',
        receivedEventsUrl: Uri.parse('https://example.com'),
        type: 'example',
        siteAdmin: false,
        name: 'example',
        company: 'example',
        blog: 'example',
        location: 'example',
        email: 'user@example.com',
        hireable: false,
        bio: 'example',
        publicRepos: 0,
        publicGists: 0,
        followers: 0,
        following: 0,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
      );
      final parsed = PublicUser.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PublicUser.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PublicUser.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
