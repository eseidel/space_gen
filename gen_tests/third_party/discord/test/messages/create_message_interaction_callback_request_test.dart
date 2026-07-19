// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('CreateMessageInteractionCallbackRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CreateMessageInteractionCallbackRequest(
        type: InteractionCallbackTypes.pong,
      );
      final parsed = CreateMessageInteractionCallbackRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CreateMessageInteractionCallbackRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CreateMessageInteractionCallbackRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
