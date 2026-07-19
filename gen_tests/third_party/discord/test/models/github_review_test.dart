// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubReview(
        user: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
        htmlUrl: Uri.parse('https://example.com'),
        state: 'example',
      );
      final parsed = GithubReview.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubReview.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubReview.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
