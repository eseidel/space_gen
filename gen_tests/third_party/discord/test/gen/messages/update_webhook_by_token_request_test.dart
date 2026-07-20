// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateWebhookByTokenRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UpdateWebhookByTokenRequest();
      final parsed = UpdateWebhookByTokenRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(UpdateWebhookByTokenRequest.maybeFromJson(null), isNull);
    });
  });
}
