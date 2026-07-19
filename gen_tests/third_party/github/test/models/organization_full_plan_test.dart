// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationFullPlan', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationFullPlan(
        name: 'example',
        space: 0,
        privateRepos: 0,
      );
      final parsed = OrganizationFullPlan.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationFullPlan.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationFullPlan.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
