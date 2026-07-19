// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = SimpleCommit(
        id: '7638417db6d59f3c431d3e1f261cc637155684cd',
        treeId: 'example',
        message: 'Fix #42',
        timestamp: DateTime.utc(2024),
        author: const SimpleCommitAuthor(
          name: 'Monalisa Octocat',
          email: 'user@example.com',
        ),
        committer: const SimpleCommitCommitter(
          name: 'Monalisa Octocat',
          email: 'user@example.com',
        ),
      );
      final parsed = SimpleCommit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
