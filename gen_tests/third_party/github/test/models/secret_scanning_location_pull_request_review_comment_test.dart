// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationPullRequestReviewComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationPullRequestReviewComment(
        pullRequestReviewCommentUrl: Uri.parse('https://example.com'),
      );
      final parsed =
          SecretScanningLocationPullRequestReviewComment.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecretScanningLocationPullRequestReviewComment.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationPullRequestReviewComment.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
