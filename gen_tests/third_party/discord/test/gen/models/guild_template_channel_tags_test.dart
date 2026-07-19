// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GuildTemplateChannelTags', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GuildTemplateChannelTags(
        id: 0,
        name: 'example',
        emojiId: SnowflakeType('0'),
        emojiName: 'example',
        moderated: false,
      );
      final parsed = GuildTemplateChannelTags.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GuildTemplateChannelTags.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GuildTemplateChannelTags.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
