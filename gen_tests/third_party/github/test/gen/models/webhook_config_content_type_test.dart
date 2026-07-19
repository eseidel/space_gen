// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookConfigContentType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WebhookConfigContentType('"json"');
      final parsed = WebhookConfigContentType.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookConfigContentType.maybeFromJson(null), isNull);
    });
  });
}
