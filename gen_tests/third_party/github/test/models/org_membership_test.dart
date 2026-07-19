// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgMembership', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgMembership(
        url: Uri.parse('https://example.com'),
        state: OrgMembershipState.active,
        role: OrgMembershipRole.admin,
        organizationUrl: Uri.parse('https://example.com'),
        organization: OrganizationSimple(
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
        ),
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
      );
      final parsed = OrgMembership.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgMembership.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgMembership.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
