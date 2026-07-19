// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamRoleAssignmentPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamRoleAssignmentPermissions(
        pull: false,
        triage: false,
        push: false,
        maintain: false,
        admin: false,
      );
      final parsed = TeamRoleAssignmentPermissions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamRoleAssignmentPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamRoleAssignmentPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
