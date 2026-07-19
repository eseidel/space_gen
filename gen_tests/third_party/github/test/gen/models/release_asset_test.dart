// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReleaseAsset', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ReleaseAsset(
        url: Uri.parse('https://example.com'),
        browserDownloadUrl: Uri.parse('https://example.com'),
        id: 0,
        nodeId: 'example',
        name: 'Team Environment',
        label: 'example',
        state: ReleaseAssetState.uploaded,
        contentType: 'example',
        size: 0,
        digest: 'example',
        downloadCount: 0,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        uploader: SimpleUser(
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
      );
      final parsed = ReleaseAsset.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReleaseAsset.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReleaseAsset.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
