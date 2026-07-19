// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('BasicGuildMemberResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BasicGuildMemberResponse(
        avatar: 'example',
        banner: 'example',
        communicationDisabledUntil: DateTime.utc(2024),
        flags: 0,
        joinedAt: DateTime.utc(2024),
        nick: 'example',
        pending: false,
        premiumSince: DateTime.utc(2024),
        roles: <SnowflakeType>[SnowflakeType('0')],
      );
      final parsed = BasicGuildMemberResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BasicGuildMemberResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BasicGuildMemberResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
