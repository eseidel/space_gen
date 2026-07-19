// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubComment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubComment(
        id: 0,
        htmlUrl: Uri.parse('https://example.com'),
        user: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
        body: 'example',
      );
      final parsed = GithubComment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubComment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubComment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
