// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateWebhookRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateWebhookRequest();
      final parsed = ReposUpdateWebhookRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateWebhookRequest.maybeFromJson(null), isNull);
    });
  });
}
