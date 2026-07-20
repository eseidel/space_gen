// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryCreate', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = RepositoryAdvisoryCreate(
        summary: 'example',
        description: 'example',
        vulnerabilities: const <RepositoryAdvisoryCreateVulnerabilitiesInner>[
          RepositoryAdvisoryCreateVulnerabilitiesInner(
            package: RepositoryAdvisoryCreateVulnerabilitiesInnerPackage(
              ecosystem: SecurityAdvisoryEcosystems.rubygems,
            ),
          ),
        ],
      );
      final parsed = RepositoryAdvisoryCreate.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryAdvisoryCreate.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryCreate.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
