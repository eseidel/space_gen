// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateLobbyRequestFlagsOneOf1', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateLobbyRequestFlagsOneOf1.value1;
      final parsed = CreateLobbyRequestFlagsOneOf1.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CreateLobbyRequestFlagsOneOf1.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateLobbyRequestFlagsOneOf1.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in CreateLobbyRequestFlagsOneOf1.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in CreateLobbyRequestFlagsOneOf1.values) {
        expect(
          CreateLobbyRequestFlagsOneOf1.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
