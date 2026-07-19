// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('AttachmentResponse', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = AttachmentResponse(
        id: SnowflakeType('0'),
        filename: 'example',
        size: 0,
        url: Uri.parse('https://example.com'),
        proxyUrl: Uri.parse('https://example.com'),
      );
      final parsed = AttachmentResponse.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(AttachmentResponse.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => AttachmentResponse.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
