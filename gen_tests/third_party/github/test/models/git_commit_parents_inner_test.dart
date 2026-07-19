// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCommitParentsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitCommitParentsInner(
        sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
      );
      final parsed = GitCommitParentsInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCommitParentsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCommitParentsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
