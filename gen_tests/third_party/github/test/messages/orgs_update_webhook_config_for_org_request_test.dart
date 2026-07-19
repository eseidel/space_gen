// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsUpdateWebhookConfigForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = OrgsUpdateWebhookConfigForOrgRequest();
      final parsed = OrgsUpdateWebhookConfigForOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsUpdateWebhookConfigForOrgRequest.maybeFromJson(null), isNull);
    });
  });
}
