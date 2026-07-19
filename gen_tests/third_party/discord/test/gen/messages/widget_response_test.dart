// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WidgetResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WidgetResponse(
        id: SnowflakeType('0'),
        name: 'example',
        instantInvite: 'example',
        channels: <WidgetChannel>[
          WidgetChannel(id: SnowflakeType('0'), name: 'example', position: 0),
        ],
        members: <WidgetMember>[
          WidgetMember(
            id: 'example',
            username: 'example',
            discriminator: WidgetUserDiscriminator.zeroes,
            avatar: const <String, dynamic>{},
            status: 'example',
            avatarUrl: Uri.parse('https://example.com'),
          ),
        ],
        presenceCount: 0,
      );
      final parsed = WidgetResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WidgetResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WidgetResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
