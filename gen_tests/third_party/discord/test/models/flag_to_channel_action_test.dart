// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FlagToChannelAction', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FlagToChannelAction(
        metadata: FlagToChannelActionMetadata(channelId: SnowflakeType('0')),
      );
      final parsed = FlagToChannelAction.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FlagToChannelAction.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FlagToChannelAction.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
