// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationFull', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrganizationFull(
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
        type: 'Organization',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        archivedAt: DateTime.utc(2024),
      );
      final parsed = OrganizationFull.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationFull.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationFull.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
