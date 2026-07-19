// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryAdvisoryUpdateVulnerabilitiesInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryAdvisoryUpdateVulnerabilitiesInner(
        package: RepositoryAdvisoryUpdateVulnerabilitiesInnerPackage(
          ecosystem: SecurityAdvisoryEcosystems.rubygems,
        ),
      );
      final parsed = RepositoryAdvisoryUpdateVulnerabilitiesInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryAdvisoryUpdateVulnerabilitiesInner.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryAdvisoryUpdateVulnerabilitiesInner.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
