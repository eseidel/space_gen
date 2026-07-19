// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ListApplicationEmojisResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ListApplicationEmojisResponse(
        items: <EmojiResponse>[
          EmojiResponse(
            id: SnowflakeType('0'),
            name: 'example',
            roles: <SnowflakeType>[SnowflakeType('0')],
            requireColons: false,
            managed: false,
            animated: false,
            available: false,
          ),
        ],
      );
      final parsed = ListApplicationEmojisResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ListApplicationEmojisResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ListApplicationEmojisResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
