// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCommitCommitter', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitCommitCommitter(
        date: DateTime.utc(2024),
        email: 'monalisa.octocat@example.com',
        name: 'Monalisa Octocat',
      );
      final parsed = GitCommitCommitter.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCommitCommitter.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCommitCommitter.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
