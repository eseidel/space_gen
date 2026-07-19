// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestSimple', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PullRequestSimple(
        url: Uri.parse('https://example.com'),
        id: 1,
        nodeId: 'MDExOlB1bGxSZXF1ZXN0MQ==',
        htmlUrl: Uri.parse('https://example.com'),
        diffUrl: Uri.parse('https://example.com'),
        patchUrl: Uri.parse('https://example.com'),
        issueUrl: Uri.parse('https://example.com'),
        commitsUrl: Uri.parse('https://example.com'),
        reviewCommentsUrl: Uri.parse('https://example.com'),
        reviewCommentUrl:
            'https://api.github.com/repos/octocat/Hello-World/pulls/comments{/number}',
        commentsUrl: Uri.parse('https://example.com'),
        statusesUrl: Uri.parse('https://example.com'),
        number: 1347,
        state: 'open',
        locked: false,
        title: 'new-feature',
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
        body: 'Please pull these awesome changes',
        labels: const <PullRequestSimpleLabelsInner>[
          PullRequestSimpleLabelsInner(
            id: 0,
            nodeId: 'example',
            url: 'example',
            name: 'example',
            description: 'example',
            color: 'example',
            default_: false,
          ),
        ],
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
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        closedAt: DateTime.utc(2024),
        mergedAt: DateTime.utc(2024),
        mergeCommitSha: 'e5bd3914e2e596debea16f433f57875b5b90bcd6',
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
        head: PullRequestSimpleHead(
          label: 'example',
          ref: 'example',
          repo: Repository(
            id: 42,
            nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
            name: 'Team Environment',
            fullName: 'octocat/Hello-World',
            license: LicenseSimple(
              key: 'mit',
              name: 'MIT License',
              url: Uri.parse('https://example.com'),
              spdxId: 'MIT',
              nodeId: 'MDc6TGljZW5zZW1pdA==',
            ),
            forks: 0,
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
            gitUrl: 'git:github.com/octocat/Hello-World.git',
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
            sshUrl: 'git@github.com:octocat/Hello-World.git',
            stargazersUrl: Uri.parse('https://example.com'),
            statusesUrl:
                'http://api.github.com/repos/octocat/Hello-World/statuses/{sha}',
            subscribersUrl: Uri.parse('https://example.com'),
            subscriptionUrl: Uri.parse('https://example.com'),
            tagsUrl: Uri.parse('https://example.com'),
            teamsUrl: Uri.parse('https://example.com'),
            treesUrl:
                'http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}',
            cloneUrl: 'https://github.com/octocat/Hello-World.git',
            mirrorUrl: Uri.parse('https://example.com'),
            hooksUrl: Uri.parse('https://example.com'),
            svnUrl: Uri.parse('https://example.com'),
            homepage: Uri.parse('https://example.com'),
            language: 'example',
            forksCount: 9,
            stargazersCount: 80,
            watchersCount: 80,
            size: 108,
            defaultBranch: 'master',
            openIssuesCount: 0,
            hasIssues: false,
            hasProjects: false,
            hasWiki: false,
            hasPages: false,
            hasDownloads: false,
            disabled: false,
            pushedAt: DateTime.utc(2024),
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            openIssues: 0,
            watchers: 0,
          ),
          sha: 'example',
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
        ),
        base: PullRequestSimpleBase(
          label: 'example',
          ref: 'example',
          repo: Repository(
            id: 42,
            nodeId: 'MDEwOlJlcG9zaXRvcnkxMjk2MjY5',
            name: 'Team Environment',
            fullName: 'octocat/Hello-World',
            license: LicenseSimple(
              key: 'mit',
              name: 'MIT License',
              url: Uri.parse('https://example.com'),
              spdxId: 'MIT',
              nodeId: 'MDc6TGljZW5zZW1pdA==',
            ),
            forks: 0,
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
            gitUrl: 'git:github.com/octocat/Hello-World.git',
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
            sshUrl: 'git@github.com:octocat/Hello-World.git',
            stargazersUrl: Uri.parse('https://example.com'),
            statusesUrl:
                'http://api.github.com/repos/octocat/Hello-World/statuses/{sha}',
            subscribersUrl: Uri.parse('https://example.com'),
            subscriptionUrl: Uri.parse('https://example.com'),
            tagsUrl: Uri.parse('https://example.com'),
            teamsUrl: Uri.parse('https://example.com'),
            treesUrl:
                'http://api.github.com/repos/octocat/Hello-World/git/trees{/sha}',
            cloneUrl: 'https://github.com/octocat/Hello-World.git',
            mirrorUrl: Uri.parse('https://example.com'),
            hooksUrl: Uri.parse('https://example.com'),
            svnUrl: Uri.parse('https://example.com'),
            homepage: Uri.parse('https://example.com'),
            language: 'example',
            forksCount: 9,
            stargazersCount: 80,
            watchersCount: 80,
            size: 108,
            defaultBranch: 'master',
            openIssuesCount: 0,
            hasIssues: false,
            hasProjects: false,
            hasWiki: false,
            hasPages: false,
            hasDownloads: false,
            disabled: false,
            pushedAt: DateTime.utc(2024),
            createdAt: DateTime.utc(2024),
            updatedAt: DateTime.utc(2024),
            openIssues: 0,
            watchers: 0,
          ),
          sha: 'example',
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
        ),
        links: const PullRequestSimpleLinks(
          comments: Link(href: 'example'),
          commits: Link(href: 'example'),
          statuses: Link(href: 'example'),
          html: Link(href: 'example'),
          issue: Link(href: 'example'),
          reviewComments: Link(href: 'example'),
          reviewComment: Link(href: 'example'),
          self: Link(href: 'example'),
        ),
        authorAssociation: AuthorAssociation.collaborator,
        autoMerge: AutoMerge(
          enabledBy: SimpleUser(
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
          mergeMethod: AutoMergeMergeMethod.merge,
          commitTitle: 'example',
          commitMessage: 'example',
        ),
      );
      final parsed = PullRequestSimple.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestSimple.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestSimple.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
