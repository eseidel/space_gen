// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('ApplicationEventWebhooksStatus', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ApplicationEventWebhooksStatus.disabled;
      final parsed = ApplicationEventWebhooksStatus.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ApplicationEventWebhooksStatus.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ApplicationEventWebhooksStatus.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in ApplicationEventWebhooksStatus.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in ApplicationEventWebhooksStatus.values) {
        expect(
          ApplicationEventWebhooksStatus.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
