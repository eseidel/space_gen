// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('UnfurledMediaRequestWithAttachmentReferenceRequired', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = UnfurledMediaRequestWithAttachmentReferenceRequired(
        url: Uri.parse('https://example.com'),
      );
      final parsed =
          UnfurledMediaRequestWithAttachmentReferenceRequired.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        UnfurledMediaRequestWithAttachmentReferenceRequired.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => UnfurledMediaRequestWithAttachmentReferenceRequired.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
