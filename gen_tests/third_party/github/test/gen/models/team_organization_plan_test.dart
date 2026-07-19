// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamOrganizationPlan', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamOrganizationPlan(
        name: 'example',
        space: 0,
        privateRepos: 0,
      );
      final parsed = TeamOrganizationPlan.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamOrganizationPlan.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamOrganizationPlan.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
