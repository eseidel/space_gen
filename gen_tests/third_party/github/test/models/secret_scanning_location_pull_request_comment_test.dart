// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationPullRequestComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationPullRequestComment(
        pullRequestCommentUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationPullRequestComment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecretScanningLocationPullRequestComment.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationPullRequestComment.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
