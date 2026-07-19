// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationUpdateIssueType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationUpdateIssueType(
        name: 'example',
        isEnabled: false,
      );
      final parsed = OrganizationUpdateIssueType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationUpdateIssueType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationUpdateIssueType.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
