// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationPullRequestReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationPullRequestReview(
        pullRequestReviewUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationPullRequestReview.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        SecretScanningLocationPullRequestReview.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationPullRequestReview.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
