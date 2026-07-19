// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Thread', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Thread(
        id: 'example',
        repository: MinimalRepository(
          id: 1296269,
          nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
          name: 'Hello-World',
          fullName: 'octocat/Hello-World',
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
            eventsUrl: 'https://api.github.com/users/octocat/events{/privacy}',
            receivedEventsUrl: Uri.parse('https://example.com'),
            type: 'User',
            siteAdmin: false,
          ),
          private: false,
          htmlUrl: Uri.parse('https://example.com'),
          description: 'This your first repo!',
          fork: false,
          url: Uri.parse('https://example.com'),
          archiveUrl:
              'http://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}',
          assigneesUrl:
              'http://api.github.com/repos/octocat/Hello-World/assignees{/user}',
          blobsUrl:
              'http://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}',
          branchesUrl:
              'http://api.github.com/repos/octocat/Hello-World/branches{/branch}',
          collaboratorsUrl:
              'http://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}',
          commentsUrl:
              'http://api.github.com/repos/octocat/Hello-World/comments{/number}',
          commitsUrl:
              'http://api.github.com/repos/octocat/Hello-World/commits{/sha}',
          compareUrl:
              'http://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}',
          contentsUrl:
              'http://api.github.com/repos/octocat/Hello-World/contents/{+path}',
          contributorsUrl: Uri.parse('https://example.com'),
          deploymentsUrl: Uri.parse('https://example.com'),
          downloadsUrl: Uri.parse('https://example.com'),
          eventsUrl: Uri.parse('https://example.com'),
          forksUrl: Uri.parse('https://example.com'),
          gitCommitsUrl:
              'http://api.github.com/repos/octocat/Hello-World/git/commits{/sha}',
          gitRefsUrl:
              'http://api.github.com/repos/octocat/Hello-World/git/refs{/sha}',
          gitTagsUrl:
              'http://api.github.com/repos/octocat/Hello-World/git/tags{/sha}',
          issueCommentUrl:
              'http://api.github.com/repos/octocat/Hello-World/issues/comments{/number}',
          issueEventsUrl:
              'http://api.github.com/repos/octocat/Hello-World/issues/events{/number}',
          issuesUrl:
              'http://api.github.com/repos/octocat/Hello-World/issues{/number}',
          keysUrl:
              'http://api.github.com/repos/octocat/Hello-World/keys{/key_id}',
          labelsUrl:
              'http://api.github.com/repos/octocat/Hello-World/labels{/name}',
          languagesUrl: Uri.parse('https://example.com'),
          mergesUrl: Uri.parse('https://example.com'),
          milestonesUrl:
              'http://api.github.com/repos/octocat/Hello-World/milestones{/number}',
          notificationsUrl:
              'http://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}',
          pullsUrl:
              'http://api.github.com/repos/octocat/Hello-World/pulls{/number}',
          releasesUrl:
              'http://api.github.com/repos/octocat/Hello-World/releases{/id}',
          stargazersUrl: Uri.parse('https://example.com'),
          statusesUrl:
              'http://api.github.com/repos/octocat/Hello-World/statuses/{sha}',
          subscribersUrl: Uri.parse('https://example.com'),
          subscriptionUrl: Uri.parse('https://example.com'),
          tagsUrl: Uri.parse('https://example.com'),
          teamsUrl: Uri.parse('https://example.com'),
          treesUrl:
              'http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}',
          hooksUrl: Uri.parse('https://example.com'),
        ),
        subject: const ThreadSubject(
          title: 'example',
          url: 'example',
          latestCommentUrl: 'example',
          type: 'example',
        ),
        reason: 'example',
        unread: false,
        updatedAt: 'example',
        lastReadAt: 'example',
        url: 'example',
        subscriptionUrl:
            'https://api.github.com/notifications/threads/2/subscription',
      );
      final parsed = Thread.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Thread.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Thread.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
