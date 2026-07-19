// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookSourceGuildResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WebhookSourceGuildResponse(
        id: SnowflakeType('0'),
        icon: 'example',
        name: 'example',
      );
      final parsed = WebhookSourceGuildResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookSourceGuildResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => WebhookSourceGuildResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
