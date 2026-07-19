// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookConfigUrl', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = WebhookConfigUrl(Uri.parse('https://example.com'));
      final parsed = WebhookConfigUrl.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookConfigUrl.maybeFromJson(null), isNull);
    });
  });
}
