// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageComponentInteractionMetadataResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageComponentInteractionMetadataResponse(
        id: SnowflakeType('0'),
        authorizingIntegrationOwners: {'key': SnowflakeType('0')},
        interactedMessageId: SnowflakeType('0'),
      );
      final parsed = MessageComponentInteractionMetadataResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        MessageComponentInteractionMetadataResponse.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageComponentInteractionMetadataResponse.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
