// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageEmbedFieldResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = MessageEmbedFieldResponse(
        name: 'example',
        value: 'example',
        inline: false,
      );
      final parsed = MessageEmbedFieldResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageEmbedFieldResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageEmbedFieldResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
