// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CommitCommitTree', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CommitCommitTree(
        sha: '827efc6d56897b048c772eb4087f854f46256132',
        url: Uri.parse('https://example.com'),
      );
      final parsed = CommitCommitTree.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CommitCommitTree.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CommitCommitTree.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
