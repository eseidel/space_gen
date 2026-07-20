// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AddLobbyMemberRequestFlagsOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AddLobbyMemberRequestFlagsOneOf1(1);
      final parsed = AddLobbyMemberRequestFlagsOneOf1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AddLobbyMemberRequestFlagsOneOf1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AddLobbyMemberRequestFlagsOneOf1.maybeFromJson(-1),
        throwsFormatException,
      );
    });
  });
}
