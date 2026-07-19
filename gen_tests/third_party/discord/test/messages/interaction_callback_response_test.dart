// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('InteractionCallbackResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = InteractionCallbackResponse(
        interaction: InteractionResponse(
          id: SnowflakeType('0'),
          type: InteractionTypes.ping,
        ),
      );
      final parsed = InteractionCallbackResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(InteractionCallbackResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => InteractionCallbackResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
