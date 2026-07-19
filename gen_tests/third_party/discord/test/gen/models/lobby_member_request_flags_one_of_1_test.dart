// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('LobbyMemberRequestFlagsOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = LobbyMemberRequestFlagsOneOf1.value1;
      final parsed = LobbyMemberRequestFlagsOneOf1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LobbyMemberRequestFlagsOneOf1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LobbyMemberRequestFlagsOneOf1.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in LobbyMemberRequestFlagsOneOf1.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in LobbyMemberRequestFlagsOneOf1.values) {
        expect(
          LobbyMemberRequestFlagsOneOf1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
