// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationIssueComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationIssueComment(
        issueCommentUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationIssueComment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationIssueComment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationIssueComment.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
