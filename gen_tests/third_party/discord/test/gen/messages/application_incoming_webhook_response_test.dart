// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationIncomingWebhookResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ApplicationIncomingWebhookResponse(
        applicationId: SnowflakeType('0'),
        avatar: 'example',
        channelId: SnowflakeType('0'),
        id: SnowflakeType('0'),
        name: 'example',
      );
      final parsed = ApplicationIncomingWebhookResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationIncomingWebhookResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationIncomingWebhookResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
