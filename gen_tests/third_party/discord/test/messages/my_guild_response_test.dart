// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MyGuildResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MyGuildResponse(
        id: SnowflakeType('0'),
        name: 'example',
        icon: 'example',
        banner: 'example',
        owner: false,
        permissions: 'example',
        features: const <GuildFeatures>[GuildFeatures.animatedBanner],
      );
      final parsed = MyGuildResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MyGuildResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MyGuildResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
