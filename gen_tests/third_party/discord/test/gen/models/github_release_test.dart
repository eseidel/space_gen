// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubRelease', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubRelease(
        id: 0,
        tagName: 'example',
        htmlUrl: Uri.parse('https://example.com'),
        author: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
      );
      final parsed = GithubRelease.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubRelease.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubRelease.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
