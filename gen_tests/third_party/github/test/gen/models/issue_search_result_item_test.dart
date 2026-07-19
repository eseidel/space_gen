// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('IssueSearchResultItem', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = IssueSearchResultItem(
        url: Uri.parse('https://example.com'),
        repositoryUrl: Uri.parse('https://example.com'),
        labelsUrl: 'example',
        commentsUrl: Uri.parse('https://example.com'),
        eventsUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        id: 0,
        nodeId: 'example',
        number: 0,
        title: 'example',
        locked: false,
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
        labels: const <IssueSearchResultItemLabelsInner>[
          IssueSearchResultItemLabelsInner(),
        ],
        state: 'example',
        assignee: SimpleUser(
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
        milestone: Milestone(
          url: Uri.parse('https://example.com'),
          htmlUrl: Uri.parse('https://example.com'),
          labelsUrl: Uri.parse('https://example.com'),
          id: 1002604,
          nodeId: 'MDk6TWlsZXN0b25lMTAwMjYwNA==',
          number: 42,
          title: 'v1.0',
          description: 'Tracking milestone for version 1.0',
          creator: SimpleUser(
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
          openIssues: 4,
          closedIssues: 8,
          createdAt: DateTime.utc(2024),
          updatedAt: DateTime.utc(2024),
          closedAt: DateTime.utc(2024),
          dueOn: DateTime.utc(2024),
        ),
        comments: 0,
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        closedAt: DateTime.utc(2024),
        score: 0,
        authorAssociation: AuthorAssociation.collaborator,
      );
      final parsed = IssueSearchResultItem.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IssueSearchResultItem.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => IssueSearchResultItem.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
