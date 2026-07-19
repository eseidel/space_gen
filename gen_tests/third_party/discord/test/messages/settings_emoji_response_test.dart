// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('SettingsEmojiResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SettingsEmojiResponse(
        id: SnowflakeType('0'),
        name: 'example',
        animated: false,
      );
      final parsed = SettingsEmojiResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SettingsEmojiResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SettingsEmojiResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
