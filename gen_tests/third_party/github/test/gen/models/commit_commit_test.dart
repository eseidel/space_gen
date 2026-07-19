// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitCommit(
        url: Uri.parse('https://example.com'),
        author: const GitUser(),
        committer: const GitUser(),
        message: 'Fix all the bugs',
        commentCount: 0,
        tree: CommitCommitTree(
          sha: '827efc6d56897b048c772eb4087f854f46256132',
          url: Uri.parse('https://example.com'),
        ),
      );
      final parsed = CommitCommit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
