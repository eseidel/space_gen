// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependabotAlertSecurityAdvisory', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = DependabotAlertSecurityAdvisory(
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
      );
      final parsed = DependabotAlertSecurityAdvisory.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependabotAlertSecurityAdvisory.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            DependabotAlertSecurityAdvisory.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
