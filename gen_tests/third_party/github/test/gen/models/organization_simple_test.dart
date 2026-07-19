// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrganizationSimple(
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
      );
      final parsed = OrganizationSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
