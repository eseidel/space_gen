// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelSelectDefaultValueResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChannelSelectDefaultValueResponse(
        id: SnowflakeType('0'),
      );
      final parsed = ChannelSelectDefaultValueResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelSelectDefaultValueResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelSelectDefaultValueResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
