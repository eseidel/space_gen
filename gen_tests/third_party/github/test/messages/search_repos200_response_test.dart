// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SearchRepos200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SearchRepos200Response(
        totalCount: 0,
        incompleteResults: false,
        items: <RepoSearchResultItem>[
          RepoSearchResultItem(
            id: 0,
            nodeId: 'example',
            name: 'example',
            fullName: 'example',
            owner: SimpleUser(
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
              eventsUrl:
                  'https://api.github.com/users/octocat/events{/privacy}',
              receivedEventsUrl: Uri.parse('https://example.com'),
              type: 'User',
              siteAdmin: false,
            ),
            private: false,
            htmlUrl: Uri.parse('https://example.com'),
            description: 'example',
            fork: false,
            url: Uri.parse('https://example.com'),
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            pushedAt: DateTime.utc(2024),
            homepage: Uri.parse('https://example.com'),
            size: 0,
            stargazersCount: 0,
            watchersCount: 0,
            language: 'example',
            forksCount: 0,
            openIssuesCount: 0,
            defaultBranch: 'example',
            score: 0,
            forksUrl: Uri.parse('https://example.com'),
            keysUrl: 'example',
            collaboratorsUrl: 'example',
            teamsUrl: Uri.parse('https://example.com'),
            hooksUrl: Uri.parse('https://example.com'),
            issueEventsUrl: 'example',
            eventsUrl: Uri.parse('https://example.com'),
            assigneesUrl: 'example',
            branchesUrl: 'example',
            tagsUrl: Uri.parse('https://example.com'),
            blobsUrl: 'example',
            gitTagsUrl: 'example',
            gitRefsUrl: 'example',
            treesUrl: 'example',
            statusesUrl: 'example',
            languagesUrl: Uri.parse('https://example.com'),
            stargazersUrl: Uri.parse('https://example.com'),
            contributorsUrl: Uri.parse('https://example.com'),
            subscribersUrl: Uri.parse('https://example.com'),
            subscriptionUrl: Uri.parse('https://example.com'),
            commitsUrl: 'example',
            gitCommitsUrl: 'example',
            commentsUrl: 'example',
            issueCommentUrl: 'example',
            contentsUrl: 'example',
            compareUrl: 'example',
            mergesUrl: Uri.parse('https://example.com'),
            archiveUrl: 'example',
            downloadsUrl: Uri.parse('https://example.com'),
            issuesUrl: 'example',
            pullsUrl: 'example',
            milestonesUrl: 'example',
            notificationsUrl: 'example',
            labelsUrl: 'example',
            releasesUrl: 'example',
            deploymentsUrl: Uri.parse('https://example.com'),
            gitUrl: 'example',
            sshUrl: 'example',
            cloneUrl: 'example',
            svnUrl: Uri.parse('https://example.com'),
            forks: 0,
            openIssues: 0,
            watchers: 0,
            mirrorUrl: Uri.parse('https://example.com'),
            hasIssues: false,
            hasProjects: false,
            hasPages: false,
            hasWiki: false,
            hasDownloads: false,
            archived: false,
            disabled: false,
            license: LicenseSimple(
              key: 'mit',
              name: 'MIT License',
              url: Uri.parse('https://example.com'),
              spdxId: 'MIT',
              nodeId: 'MDc6TGljZW5zZW1pdA==',
            ),
          ),
        ],
      );
      final parsed = SearchRepos200Response.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SearchRepos200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SearchRepos200Response.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
