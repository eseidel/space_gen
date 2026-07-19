// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('WebhookConfig', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = WebhookConfig();
      final parsed = WebhookConfig.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(WebhookConfig.maybeFromJson(null), isNull);
    });
  });
}
