// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FlagToChannelActionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FlagToChannelActionMetadataResponse(
        channelId: SnowflakeType('0'),
      );
      final parsed = FlagToChannelActionMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FlagToChannelActionMetadataResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FlagToChannelActionMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
