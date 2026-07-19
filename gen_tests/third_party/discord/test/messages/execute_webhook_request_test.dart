// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ExecuteWebhookRequest', () {
    test(
      'IncomingWebhookRequestPartial round-trips via maybeFromJson/toJson',
      () {
        const instance = IncomingWebhookRequestPartial();
        final parsed = IncomingWebhookRequestPartial.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(ExecuteWebhookRequest.maybeFromJson(null), isNull);
    });
  });
}
