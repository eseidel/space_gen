// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubIssue', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubIssue(
        id: 0,
        number: 0,
        htmlUrl: Uri.parse('https://example.com'),
        user: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
        title: 'example',
      );
      final parsed = GithubIssue.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubIssue.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubIssue.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
