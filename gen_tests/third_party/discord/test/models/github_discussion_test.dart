// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubDiscussion', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubDiscussion(
        title: 'example',
        number: 0,
        htmlUrl: Uri.parse('https://example.com'),
        user: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
      );
      final parsed = GithubDiscussion.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubDiscussion.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubDiscussion.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
