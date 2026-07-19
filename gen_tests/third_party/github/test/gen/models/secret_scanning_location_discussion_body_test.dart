// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationDiscussionBody', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationDiscussionBody(
        discussionBodyUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationDiscussionBody.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationDiscussionBody.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationDiscussionBody.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
