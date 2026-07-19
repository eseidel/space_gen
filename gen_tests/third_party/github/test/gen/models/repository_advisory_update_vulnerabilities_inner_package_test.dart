// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage(
        ecosystem: SecurityAdvisoryEcosystems.rubygems,
      );
      final parsed =
          RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
