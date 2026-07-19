// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SecretScanningLocationWikiCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SecretScanningLocationWikiCommit(
        path: '/example/Home.md',
        startLine: 0,
        endLine: 0,
        startColumn: 0,
        endColumn: 0,
        blobSha: 'af5626b4a114abcb82d63db7c8082c3c4756e51b',
        pageUrl:
            'https://github.com/octocat/Hello-World/wiki/Home/302c0b7e200761c9dd9b57e57db540ee0b4293a5',
        commitSha: '302c0b7e200761c9dd9b57e57db540ee0b4293a5',
        commitUrl:
            'https://github.com/octocat/Hello-World/wiki/_compare/302c0b7e200761c9dd9b57e57db540ee0b4293a5',
      );
      final parsed = SecretScanningLocationWikiCommit.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SecretScanningLocationWikiCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            SecretScanningLocationWikiCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
