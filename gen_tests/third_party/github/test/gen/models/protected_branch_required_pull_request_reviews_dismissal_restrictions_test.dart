// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions(
        url: Uri.parse('https://example.com'),
        usersUrl: Uri.parse('https://example.com'),
        teamsUrl: Uri.parse('https://example.com'),
        users: <SimpleUser>[
          SimpleUser(
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
        ],
        teams: <Team>[
          Team(
            id: 0,
            nodeId: 'example',
            name: 'example',
            slug: 'example',
            description: 'example',
            permission: 'example',
            url: Uri.parse('https://example.com'),
            htmlUrl: Uri.parse('https://example.com'),
            membersUrl: 'example',
            repositoriesUrl: Uri.parse('https://example.com'),
            parent: TeamSimple(
              id: 1,
              nodeId: 'MDQ6VGVhbTE=',
              url: Uri.parse('https://example.com'),
              membersUrl:
                  'https://api.github.com/organizations/1/team/1/members{/member}',
              name: 'Justice League',
              description: 'A great team.',
              permission: 'admin',
              htmlUrl: Uri.parse('https://example.com'),
              repositoriesUrl: Uri.parse('https://example.com'),
              slug: 'justice-league',
            ),
          ),
        ],
      );
      final parsed =
          ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ProtectedBranchRequiredPullRequestReviewsDismissalRestrictions.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
