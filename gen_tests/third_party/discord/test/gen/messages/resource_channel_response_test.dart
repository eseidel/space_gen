// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ResourceChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ResourceChannelResponse(
        channelId: SnowflakeType('0'),
        title: 'example',
        description: 'example',
      );
      final parsed = ResourceChannelResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ResourceChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ResourceChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
