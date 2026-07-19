// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DependencyGraphDiffInnerVulnerabilitiesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DependencyGraphDiffInnerVulnerabilitiesInner(
        severity: 'critical',
        advisoryGhsaId: 'GHSA-rf4j-j272-fj86',
        advisorySummary: 'A summary of the advisory.',
        advisoryUrl: 'https://github.com/advisories/GHSA-rf4j-j272-fj86',
      );
      final parsed = DependencyGraphDiffInnerVulnerabilitiesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DependencyGraphDiffInnerVulnerabilitiesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DependencyGraphDiffInnerVulnerabilitiesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
