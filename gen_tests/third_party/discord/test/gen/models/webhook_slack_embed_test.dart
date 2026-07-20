// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookSlackEmbed', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WebhookSlackEmbed();
      final parsed = WebhookSlackEmbed.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookSlackEmbed.maybeFromJson(null), isNull);
    });
  });
}
