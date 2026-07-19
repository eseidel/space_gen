// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationIssueBody', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationIssueBody(
        issueBodyUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationIssueBody.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationIssueBody.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            SecretScanningLocationIssueBody.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
