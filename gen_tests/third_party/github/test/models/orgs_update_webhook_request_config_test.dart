// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsUpdateWebhookRequestConfig', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsUpdateWebhookRequestConfig(
        url: WebhookConfigUrl(Uri.parse('https://example.com')),
      );
      final parsed = OrgsUpdateWebhookRequestConfig.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsUpdateWebhookRequestConfig.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsUpdateWebhookRequestConfig.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
