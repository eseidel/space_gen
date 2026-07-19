// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AddLobbyMemberRequestFlagsOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = AddLobbyMemberRequestFlagsOneOf1.value1;
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

    test('toString matches toJson for every value', () {
      for (final value in AddLobbyMemberRequestFlagsOneOf1.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in AddLobbyMemberRequestFlagsOneOf1.values) {
        expect(
          AddLobbyMemberRequestFlagsOneOf1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
