// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamMembershipStates', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamMembershipStates.invited;
      final parsed = TeamMembershipStates.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(TeamMembershipStates.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamMembershipStates.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in TeamMembershipStates.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in TeamMembershipStates.values) {
        expect(TeamMembershipStates.fromJson(value.toJson()), equals(value));
      }
    });
  });
}
