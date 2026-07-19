// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryCreateVulnerabilitiesInnerPackage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryCreateVulnerabilitiesInnerPackage(
        ecosystem: SecurityAdvisoryEcosystems.rubygems,
      );
      final parsed =
          RepositoryAdvisoryCreateVulnerabilitiesInnerPackage.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryAdvisoryCreateVulnerabilitiesInnerPackage.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryCreateVulnerabilitiesInnerPackage.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
