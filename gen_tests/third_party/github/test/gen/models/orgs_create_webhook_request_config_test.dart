// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsCreateWebhookRequestConfig', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsCreateWebhookRequestConfig(
        url: WebhookConfigUrl(Uri.parse('https://example.com')),
      );
      final parsed = OrgsCreateWebhookRequestConfig.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsCreateWebhookRequestConfig.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsCreateWebhookRequestConfig.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
