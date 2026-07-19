// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateWebhookRequestConfig', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateWebhookRequestConfig();
      final parsed = ReposCreateWebhookRequestConfig.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposCreateWebhookRequestConfig.maybeFromJson(null), isNull);
    });
  });
}
