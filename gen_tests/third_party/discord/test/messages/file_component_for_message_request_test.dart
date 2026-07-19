// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('FileComponentForMessageRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = FileComponentForMessageRequest(
        file: UnfurledMediaRequestWithAttachmentReferenceRequired(
          url: Uri.parse('https://example.com'),
        ),
      );
      final parsed = FileComponentForMessageRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(FileComponentForMessageRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => FileComponentForMessageRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
