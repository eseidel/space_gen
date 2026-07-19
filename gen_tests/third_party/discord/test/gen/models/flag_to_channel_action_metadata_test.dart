// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FlagToChannelActionMetadata', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FlagToChannelActionMetadata(
        channelId: SnowflakeType('0'),
      );
      final parsed = FlagToChannelActionMetadata.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FlagToChannelActionMetadata.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FlagToChannelActionMetadata.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
