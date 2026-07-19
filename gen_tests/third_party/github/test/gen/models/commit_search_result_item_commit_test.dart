// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitSearchResultItemCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitSearchResultItemCommit(
        author: CommitSearchResultItemCommitAuthor(
          name: 'example',
          email: 'example',
          date: DateTime.utc(2024),
        ),
        committer: const GitUser(),
        commentCount: 0,
        message: 'example',
        tree: CommitSearchResultItemCommitTree(
          sha: 'example',
          url: Uri.parse('https://example.com'),
        ),
        url: Uri.parse('https://example.com'),
      );
      final parsed = CommitSearchResultItemCommit.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitSearchResultItemCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitSearchResultItemCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
