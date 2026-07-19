// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsCacheUsageOrgEnterprise', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsCacheUsageOrgEnterprise(
        totalActiveCachesCount: 0,
        totalActiveCachesSizeInBytes: 0,
      );
      final parsed = ActionsCacheUsageOrgEnterprise.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsCacheUsageOrgEnterprise.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsCacheUsageOrgEnterprise.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
