// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsCreateWebhookRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsCreateWebhookRequest(
        name: 'example',
        config: OrgsCreateWebhookRequestConfig(
          url: WebhookConfigUrl(Uri.parse('https://example.com')),
        ),
      );
      final parsed = OrgsCreateWebhookRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsCreateWebhookRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsCreateWebhookRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
