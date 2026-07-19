// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgMembershipPermissions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgMembershipPermissions(canCreateRepository: false);
      final parsed = OrgMembershipPermissions.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgMembershipPermissions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgMembershipPermissions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
