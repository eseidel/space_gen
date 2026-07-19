// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageInteractionResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageInteractionResponse(
        id: SnowflakeType('0'),
        type: InteractionTypes.ping,
        name: 'example',
      );
      final parsed = MessageInteractionResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageInteractionResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageInteractionResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
