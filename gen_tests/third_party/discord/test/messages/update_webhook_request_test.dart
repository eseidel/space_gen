// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateWebhookRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateWebhookRequest();
      final parsed = UpdateWebhookRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateWebhookRequest.maybeFromJson(null), isNull);
    });
  });
}
