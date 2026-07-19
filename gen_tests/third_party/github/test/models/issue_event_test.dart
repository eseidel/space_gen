// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueEvent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = IssueEvent(
        id: 1,
        nodeId: 'MDEwOklzc3VlRXZlbnQx',
        url: Uri.parse('https://example.com'),
        actor: SimpleUser(
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
        event: 'closed',
        commitId: '6dcb09b5b57875f334f61aebed695e2e4193db5e',
        commitUrl:
            'https://api.github.com/repos/octocat/Hello-World/commits/6dcb09b5b57875f334f61aebed695e2e4193db5e',
        createdAt: DateTime.utc(2024),
      );
      final parsed = IssueEvent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueEvent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueEvent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
