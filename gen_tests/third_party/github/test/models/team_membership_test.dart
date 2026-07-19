// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamMembership', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = TeamMembership(
        url: Uri.parse('https://example.com'),
        state: TeamMembershipState.active,
      );
      final parsed = TeamMembership.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamMembership.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamMembership.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
