// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCommitAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitCommitAuthor(
        date: DateTime.utc(2024),
        email: 'monalisa.octocat@example.com',
        name: 'Monalisa Octocat',
      );
      final parsed = GitCommitAuthor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCommitAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCommitAuthor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
