// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookSlackEmbedField', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WebhookSlackEmbedField();
      final parsed = WebhookSlackEmbedField.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookSlackEmbedField.maybeFromJson(null), isNull);
    });
  });
}
