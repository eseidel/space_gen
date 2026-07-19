// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationPullRequestBody', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationPullRequestBody(
        pullRequestBodyUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationPullRequestBody.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationPullRequestBody.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationPullRequestBody.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
