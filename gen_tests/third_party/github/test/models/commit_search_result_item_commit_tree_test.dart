// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitSearchResultItemCommitTree', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitSearchResultItemCommitTree(
        sha: 'example',
        url: Uri.parse('https://example.com'),
      );
      final parsed = CommitSearchResultItemCommitTree.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitSearchResultItemCommitTree.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            CommitSearchResultItemCommitTree.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
