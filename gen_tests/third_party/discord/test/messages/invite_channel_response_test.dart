// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InviteChannelResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InviteChannelResponse(
        id: SnowflakeType('0'),
        type: ChannelTypes.dm,
        name: 'example',
      );
      final parsed = InviteChannelResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InviteChannelResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InviteChannelResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
