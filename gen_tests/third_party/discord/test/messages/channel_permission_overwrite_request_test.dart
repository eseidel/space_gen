// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ChannelPermissionOverwriteRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ChannelPermissionOverwriteRequest(
        id: SnowflakeType('0'),
      );
      final parsed = ChannelPermissionOverwriteRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ChannelPermissionOverwriteRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ChannelPermissionOverwriteRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
