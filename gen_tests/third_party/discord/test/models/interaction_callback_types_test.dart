// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionCallbackTypes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = InteractionCallbackTypes.pong;
      final parsed = InteractionCallbackTypes.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InteractionCallbackTypes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InteractionCallbackTypes.maybeFromJson(-1),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in InteractionCallbackTypes.values) {
        expect(value.toString(), equals(value.toJson().toString()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in InteractionCallbackTypes.values) {
        expect(
          InteractionCallbackTypes.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
