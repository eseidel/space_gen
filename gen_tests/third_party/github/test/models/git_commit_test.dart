// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitCommit(
        sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
        nodeId: 'example',
        url: Uri.parse('https://example.com'),
        author: GitCommitAuthor(
          date: DateTime.utc(2024),
          email: 'monalisa.octocat@example.com',
          name: 'Monalisa Octocat',
        ),
        committer: GitCommitCommitter(
          date: DateTime.utc(2024),
          email: 'monalisa.octocat@example.com',
          name: 'Monalisa Octocat',
        ),
        message: 'Fix #42',
        tree: GitCommitTree(
          sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
          url: Uri.parse('https://example.com'),
        ),
        parents: <GitCommitParentsInner>[
          GitCommitParentsInner(
            sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
            url: Uri.parse('https://example.com'),
            htmlUrl: Uri.parse('https://example.com'),
          ),
        ],
        verification: const GitCommitVerification(
          verified: false,
          reason: 'example',
          signature: 'example',
          payload: 'example',
          verifiedAt: 'example',
        ),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = GitCommit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
