// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlert', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotAlert(
        number: const AlertNumber(0),
        state: DependabotAlertState.autoDismissed,
        dependency: const DependabotAlertDependency(),
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
        dismissedReason: DependabotAlertDismissedReason.fixStarted,
        dismissedComment: 'example',
        fixedAt: AlertFixedAt(DateTime.utc(2024)),
      );
      final parsed = DependabotAlert.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlert.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependabotAlert.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
