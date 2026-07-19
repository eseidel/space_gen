// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsListWorkflowRuns200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ActionsListWorkflowRuns200Response(
        totalCount: 0,
        workflowRuns: <WorkflowRun>[
          WorkflowRun(
            id: 5,
            nodeId: 'MDEwOkNoZWNrU3VpdGU1',
            headBranch: 'master',
            headSha: '009b8a3a9ccbb128af87f9b1c0f4c62e8a304f6d',
            path: 'octocat/octo-repo/.github/workflows/ci.yml@main',
            runNumber: 106,
            event: 'push',
            status: 'completed',
            conclusion: 'neutral',
            workflowId: 5,
            url:
                'https://api.github.com/repos/github/hello-world/actions/runs/5',
            htmlUrl: 'https://github.com/github/hello-world/suites/4',
            pullRequests: const <PullRequestMinimal>[
              PullRequestMinimal(
                id: 0,
                number: 0,
                url: 'example',
                head: PullRequestMinimalHead(
                  ref: 'example',
                  sha: 'example',
                  repo: PullRequestMinimalHeadRepo(
                    id: 0,
                    url: 'example',
                    name: 'example',
                  ),
                ),
                base: PullRequestMinimalBase(
                  ref: 'example',
                  sha: 'example',
                  repo: PullRequestMinimalBaseRepo(
                    id: 0,
                    url: 'example',
                    name: 'example',
                  ),
                ),
              ),
            ],
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            jobsUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5/jobs',
            logsUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5/logs',
            checkSuiteUrl:
                'https://api.github.com/repos/github/hello-world/check-suites/12',
            artifactsUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5/rerun/artifacts',
            cancelUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5/cancel',
            rerunUrl:
                'https://api.github.com/repos/github/hello-world/actions/runs/5/rerun',
            workflowUrl:
                'https://api.github.com/repos/github/hello-world/actions/workflows/main.yaml',
            headCommit: SimpleCommit(
              id: '7638417db6d59f3c431d3e1f261cc637155684cd',
              treeId: 'example',
              message: 'Fix #42',
              timestamp: DateTime.utc(2024),
              author: const SimpleCommitAuthor(
                name: 'Monalisa Octocat',
                email: 'user@example.com',
              ),
              committer: const SimpleCommitCommitter(
                name: 'Monalisa Octocat',
                email: 'user@example.com',
              ),
            ),
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
                gistsUrl:
                    'https://api.github.com/users/octocat/gists{/gist_id}',
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
            headRepository: MinimalRepository(
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
                gistsUrl:
                    'https://api.github.com/users/octocat/gists{/gist_id}',
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
            displayTitle: 'Simple Workflow',
          ),
        ],
      );
      final parsed = ActionsListWorkflowRuns200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsListWorkflowRuns200Response.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsListWorkflowRuns200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
