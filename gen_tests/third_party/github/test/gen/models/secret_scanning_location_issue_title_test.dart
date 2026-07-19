// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationIssueTitle', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SecretScanningLocationIssueTitle(
        issueTitleUrl: Uri.parse('https://example.com'),
      );
      final parsed = SecretScanningLocationIssueTitle.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationIssueTitle.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            SecretScanningLocationIssueTitle.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
