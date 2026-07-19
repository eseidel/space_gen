// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageReferenceResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageReferenceResponse(
        type: MessageReferenceType.default_,
        channelId: SnowflakeType('0'),
      );
      final parsed = MessageReferenceResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageReferenceResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageReferenceResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
