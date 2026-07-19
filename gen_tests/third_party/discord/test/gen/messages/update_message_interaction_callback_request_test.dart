// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UpdateMessageInteractionCallbackRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = UpdateMessageInteractionCallbackRequest(
        type: InteractionCallbackTypes.pong,
      );
      final parsed = UpdateMessageInteractionCallbackRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UpdateMessageInteractionCallbackRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UpdateMessageInteractionCallbackRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
