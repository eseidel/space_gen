// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertWithRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotAlertWithRepository(
        number: const AlertNumber(0),
        state: DependabotAlertWithRepositoryState.autoDismissed,
        dependency: const DependabotAlertWithRepositoryDependency(),
        securityAdvisory: DependabotAlertSecurityAdvisory(
          ghsaId: 'example',
          cveId: 'example',
          summary: 'example',
          description: 'example',
          vulnerabilities: const <DependabotAlertSecurityVulnerability>[
            DependabotAlertSecurityVulnerability(
              package: DependabotAlertPackage(
                ecosystem: 'example',
                name: 'example',
              ),
              severity: DependabotAlertSecurityVulnerabilitySeverity.low,
              vulnerableVersionRange: 'example',
              firstPatchedVersion:
                  DependabotAlertSecurityVulnerabilityFirstPatchedVersion(
                    identifier: 'example',
                  ),
            ),
          ],
          severity: DependabotAlertSecurityAdvisorySeverity.low,
          cvss: const DependabotAlertSecurityAdvisoryCvss(
            score: 0,
            vectorString: 'example',
          ),
          cwes: const <DependabotAlertSecurityAdvisoryCwesInner>[
            DependabotAlertSecurityAdvisoryCwesInner(
              cweId: 'example',
              name: 'example',
            ),
          ],
          identifiers: const <DependabotAlertSecurityAdvisoryIdentifiersInner>[
            DependabotAlertSecurityAdvisoryIdentifiersInner(
              type: DependabotAlertSecurityAdvisoryIdentifiersInnerType.cve,
              value: 'example',
            ),
          ],
          references: <DependabotAlertSecurityAdvisoryReferencesInner>[
            DependabotAlertSecurityAdvisoryReferencesInner(
              url: Uri.parse('https://example.com'),
            ),
          ],
          publishedAt: DateTime.utc(2024),
          updatedAt: DateTime.utc(2024),
          withdrawnAt: DateTime.utc(2024),
        ),
        securityVulnerability: const DependabotAlertSecurityVulnerability(
          package: DependabotAlertPackage(
            ecosystem: 'example',
            name: 'example',
          ),
          severity: DependabotAlertSecurityVulnerabilitySeverity.low,
          vulnerableVersionRange: 'example',
          firstPatchedVersion:
              DependabotAlertSecurityVulnerabilityFirstPatchedVersion(
                identifier: 'example',
              ),
        ),
        url: AlertUrl(Uri.parse('https://example.com')),
        htmlUrl: AlertHtmlUrl(Uri.parse('https://example.com')),
        createdAt: AlertCreatedAt(DateTime.utc(2024)),
        updatedAt: AlertUpdatedAt(DateTime.utc(2024)),
        dismissedAt: AlertDismissedAt(DateTime.utc(2024)),
        dismissedBy: SimpleUser(
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
        dismissedReason:
            DependabotAlertWithRepositoryDismissedReason.fixStarted,
        dismissedComment: 'example',
        fixedAt: AlertFixedAt(DateTime.utc(2024)),
        repository: SimpleRepository(
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
              'https://api.github.com/repos/octocat/Hello-World/{archive_format}{/ref}',
          assigneesUrl:
              'https://api.github.com/repos/octocat/Hello-World/assignees{/user}',
          blobsUrl:
              'https://api.github.com/repos/octocat/Hello-World/git/blobs{/sha}',
          branchesUrl:
              'https://api.github.com/repos/octocat/Hello-World/branches{/branch}',
          collaboratorsUrl:
              'https://api.github.com/repos/octocat/Hello-World/collaborators{/collaborator}',
          commentsUrl:
              'https://api.github.com/repos/octocat/Hello-World/comments{/number}',
          commitsUrl:
              'https://api.github.com/repos/octocat/Hello-World/commits{/sha}',
          compareUrl:
              'https://api.github.com/repos/octocat/Hello-World/compare/{base}...{head}',
          contentsUrl:
              'https://api.github.com/repos/octocat/Hello-World/contents/{+path}',
          contributorsUrl: Uri.parse('https://example.com'),
          deploymentsUrl: Uri.parse('https://example.com'),
          downloadsUrl: Uri.parse('https://example.com'),
          eventsUrl: Uri.parse('https://example.com'),
          forksUrl: Uri.parse('https://example.com'),
          gitCommitsUrl:
              'https://api.github.com/repos/octocat/Hello-World/git/commits{/sha}',
          gitRefsUrl:
              'https://api.github.com/repos/octocat/Hello-World/git/refs{/sha}',
          gitTagsUrl:
              'https://api.github.com/repos/octocat/Hello-World/git/tags{/sha}',
          issueCommentUrl:
              'https://api.github.com/repos/octocat/Hello-World/issues/comments{/number}',
          issueEventsUrl:
              'https://api.github.com/repos/octocat/Hello-World/issues/events{/number}',
          issuesUrl:
              'https://api.github.com/repos/octocat/Hello-World/issues{/number}',
          keysUrl:
              'https://api.github.com/repos/octocat/Hello-World/keys{/key_id}',
          labelsUrl:
              'https://api.github.com/repos/octocat/Hello-World/labels{/name}',
          languagesUrl: Uri.parse('https://example.com'),
          mergesUrl: Uri.parse('https://example.com'),
          milestonesUrl:
              'https://api.github.com/repos/octocat/Hello-World/milestones{/number}',
          notificationsUrl:
              'https://api.github.com/repos/octocat/Hello-World/notifications{?since,all,participating}',
          pullsUrl:
              'https://api.github.com/repos/octocat/Hello-World/pulls{/number}',
          releasesUrl:
              'https://api.github.com/repos/octocat/Hello-World/releases{/id}',
          stargazersUrl: Uri.parse('https://example.com'),
          statusesUrl:
              'https://api.github.com/repos/octocat/Hello-World/statuses/{sha}',
          subscribersUrl: Uri.parse('https://example.com'),
          subscriptionUrl: Uri.parse('https://example.com'),
          tagsUrl: Uri.parse('https://example.com'),
          teamsUrl: Uri.parse('https://example.com'),
          treesUrl:
              'https://api.github.com/repos/octocat/Hello-World/git/trees{/sha}',
          hooksUrl: Uri.parse('https://example.com'),
        ),
      );
      final parsed = DependabotAlertWithRepository.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlertWithRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlertWithRepository.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
