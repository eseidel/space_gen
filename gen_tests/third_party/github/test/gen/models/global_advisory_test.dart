// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GlobalAdvisory', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GlobalAdvisory(
        ghsaId: 'example',
        cveId: 'example',
        url: 'example',
        htmlUrl: Uri.parse('https://example.com'),
        repositoryAdvisoryUrl: Uri.parse('https://example.com'),
        summary: 'example',
        description: 'example',
        type: GlobalAdvisoryType.reviewed,
        severity: GlobalAdvisorySeverity.critical,
        sourceCodeLocation: Uri.parse('https://example.com'),
        identifiers: const <GlobalAdvisoryIdentifiersInner>[
          GlobalAdvisoryIdentifiersInner(
            type: GlobalAdvisoryIdentifiersInnerType.cve,
            value: 'example',
          ),
        ],
        references: const <String>['example'],
        publishedAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        githubReviewedAt: DateTime.utc(2024),
        nvdPublishedAt: DateTime.utc(2024),
        withdrawnAt: DateTime.utc(2024),
        vulnerabilities: const <Vulnerability>[
          Vulnerability(
            package: VulnerabilityPackage(
              ecosystem: SecurityAdvisoryEcosystems.rubygems,
              name: 'example',
            ),
            vulnerableVersionRange: 'example',
            firstPatchedVersion: 'example',
            vulnerableFunctions: <String>['example'],
          ),
        ],
        cvss: GlobalAdvisoryCvss(vectorString: 'example', score: 0),
        cwes: const <GlobalAdvisoryCwesInner>[
          GlobalAdvisoryCwesInner(cweId: 'example', name: 'example'),
        ],
        credits: <GlobalAdvisoryCreditsInner>[
          GlobalAdvisoryCreditsInner(
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
              eventsUrl:
                  'https://api.github.com/users/octocat/events{/privacy}',
              receivedEventsUrl: Uri.parse('https://example.com'),
              type: 'User',
              siteAdmin: false,
            ),
            type: SecurityAdvisoryCreditTypes.analyst,
          ),
        ],
      );
      final parsed = GlobalAdvisory.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GlobalAdvisory.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GlobalAdvisory.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
