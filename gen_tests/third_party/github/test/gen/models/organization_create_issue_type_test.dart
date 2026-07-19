// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationCreateIssueType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrganizationCreateIssueType(
        name: 'example',
        isEnabled: false,
      );
      final parsed = OrganizationCreateIssueType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationCreateIssueType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationCreateIssueType.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
