// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryCreateVulnerabilitiesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryCreateVulnerabilitiesInner(
        package: RepositoryAdvisoryCreateVulnerabilitiesInnerPackage(
          ecosystem: SecurityAdvisoryEcosystems.rubygems,
        ),
      );
      final parsed = RepositoryAdvisoryCreateVulnerabilitiesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryAdvisoryCreateVulnerabilitiesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryCreateVulnerabilitiesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
