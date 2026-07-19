// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('LobbyMemberResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LobbyMemberResponse(
        id: SnowflakeType('0'),
        metadata: const {'key': 'example'},
        flags: 0,
      );
      final parsed = LobbyMemberResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LobbyMemberResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LobbyMemberResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
