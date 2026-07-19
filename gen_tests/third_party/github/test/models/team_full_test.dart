// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamFull', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamFull(
        id: 42,
        nodeId: 'MDQ6VGVhbTE=',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        name: 'Developers',
        slug: 'justice-league',
        description: 'A great team.',
        permission: 'push',
        membersUrl:
            'https://api.github.com/organizations/1/team/1/members{/member}',
        repositoriesUrl: Uri.parse('https://example.com'),
        membersCount: 3,
        reposCount: 10,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        organization: TeamOrganization(
          login: 'github',
          id: 1,
          nodeId: 'MDEyOk9yZ2FuaXphdGlvbjE=',
          url: Uri.parse('https://example.com'),
          reposUrl: Uri.parse('https://example.com'),
          eventsUrl: Uri.parse('https://example.com'),
          hooksUrl: 'https://api.github.com/orgs/github/hooks',
          issuesUrl: 'https://api.github.com/orgs/github/issues',
          membersUrl: 'https://api.github.com/orgs/github/members{/member}',
          publicMembersUrl:
              'https://api.github.com/orgs/github/public_members{/member}',
          avatarUrl: 'https://github.com/images/error/octocat_happy.gif',
          description: 'A great organization',
          hasOrganizationProjects: false,
          hasRepositoryProjects: false,
          publicRepos: 2,
          publicGists: 1,
          followers: 20,
          following: 0,
          htmlUrl: Uri.parse('https://example.com'),
          createdAt: DateTime.utc(2024),
          type: 'Organization',
          updatedAt: DateTime.utc(2024),
          archivedAt: DateTime.utc(2024),
        ),
      );
      final parsed = TeamFull.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamFull.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamFull.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
