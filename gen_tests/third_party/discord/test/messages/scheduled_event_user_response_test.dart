// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ScheduledEventUserResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ScheduledEventUserResponse(
        guildScheduledEventId: SnowflakeType('0'),
        userId: SnowflakeType('0'),
      );
      final parsed = ScheduledEventUserResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ScheduledEventUserResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ScheduledEventUserResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
