// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrganizationActionsVariable', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrganizationActionsVariable(
        name: 'USERNAME',
        value: 'octocat',
        createdAt: DateTime.utc(2024),
        updatedAt: DateTime.utc(2024),
        visibility: OrganizationActionsVariableVisibility.all,
      );
      final parsed = OrganizationActionsVariable.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrganizationActionsVariable.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrganizationActionsVariable.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
