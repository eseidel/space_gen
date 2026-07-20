// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('IncomingWebhookUpdateRequestPartial', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = IncomingWebhookUpdateRequestPartial();
      final parsed = IncomingWebhookUpdateRequestPartial.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(IncomingWebhookUpdateRequestPartial.maybeFromJson(null), isNull);
    });
  });
}
