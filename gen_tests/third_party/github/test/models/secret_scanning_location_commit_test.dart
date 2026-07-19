// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningLocationCommit(
        path: '/example/secrets.txt',
        startLine: 0,
        endLine: 0,
        startColumn: 0,
        endColumn: 0,
        blobSha: 'af5626b4a114abcb82d63db7c8082c3c4756e51b',
        blobUrl: 'example',
        commitSha: 'af5626b4a114abcb82d63db7c8082c3c4756e51b',
        commitUrl: 'example',
      );
      final parsed = SecretScanningLocationCommit.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SecretScanningLocationCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
