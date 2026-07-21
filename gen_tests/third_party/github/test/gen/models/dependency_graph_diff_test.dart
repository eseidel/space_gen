// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyGraphDiff', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyGraphDiff(<DependencyGraphDiffInner>[
        DependencyGraphDiffInner(
          changeType: DependencyGraphDiffInnerChangeType.added,
          manifest: 'path/to/package-lock.json',
          ecosystem: 'npm',
          name: '@actions/core',
          version: '1.0.0',
          packageUrl: 'pkg:/npm/%40actions/core@1.1.0',
          license: 'MIT',
          sourceRepositoryUrl: 'https://github.com/github/actions',
          vulnerabilities: <DependencyGraphDiffInnerVulnerabilitiesInner>[
            DependencyGraphDiffInnerVulnerabilitiesInner(
              severity: 'critical',
              advisoryGhsaId: 'GHSA-rf4j-j272-fj86',
              advisorySummary: 'A summary of the advisory.',
              advisoryUrl: 'https://github.com/advisories/GHSA-rf4j-j272-fj86',
            ),
          ],
          scope: DependencyGraphDiffInnerScope.unknown,
        ),
      ]);
      final parsed = DependencyGraphDiff.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DependencyGraphDiff.maybeFromJson(null), isNull);
    });
  });
}
