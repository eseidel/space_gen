// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelPermissionOverwriteResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChannelPermissionOverwriteResponse(
        id: SnowflakeType('0'),
        type: ChannelPermissionOverwrites.role,
        allow: 'example',
        deny: 'example',
      );
      final parsed = ChannelPermissionOverwriteResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelPermissionOverwriteResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelPermissionOverwriteResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
