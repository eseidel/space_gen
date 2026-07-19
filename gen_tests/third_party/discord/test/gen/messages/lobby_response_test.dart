// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('LobbyResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LobbyResponse(
        id: SnowflakeType('0'),
        applicationId: SnowflakeType('0'),
        metadata: const {'key': 'example'},
        members: <LobbyMemberResponse>[
          LobbyMemberResponse(
            id: SnowflakeType('0'),
            metadata: const {'key': 'example'},
            flags: 0,
          ),
        ],
        flags: UInt32Type(0),
      );
      final parsed = LobbyResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LobbyResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LobbyResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
