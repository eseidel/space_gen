// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('MessageAttachmentResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = MessageAttachmentResponse(
        id: SnowflakeType('0'),
        filename: 'example',
        size: 0,
        url: Uri.parse('https://example.com'),
        proxyUrl: Uri.parse('https://example.com'),
      );
      final parsed = MessageAttachmentResponse.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(MessageAttachmentResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => MessageAttachmentResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
