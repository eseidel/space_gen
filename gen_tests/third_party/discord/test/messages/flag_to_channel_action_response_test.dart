// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FlagToChannelActionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FlagToChannelActionResponse(
        metadata: FlagToChannelActionMetadataResponse(
          channelId: SnowflakeType('0'),
        ),
      );
      final parsed = FlagToChannelActionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FlagToChannelActionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FlagToChannelActionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
