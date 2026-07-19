// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('StageInstanceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = StageInstanceResponse(
        guildId: SnowflakeType('0'),
        channelId: SnowflakeType('0'),
        topic: 'example',
        privacyLevel: StageInstancesPrivacyLevels.public,
        id: SnowflakeType('0'),
        discoverableDisabled: false,
        guildScheduledEventId: SnowflakeType('0'),
      );
      final parsed = StageInstanceResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(StageInstanceResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => StageInstanceResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
