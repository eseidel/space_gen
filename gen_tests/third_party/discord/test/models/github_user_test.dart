// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubUser', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubUser(
        id: 0,
        login: 'example',
        htmlUrl: Uri.parse('https://example.com'),
        avatarUrl: Uri.parse('https://example.com'),
      );
      final parsed = GithubUser.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubUser.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubUser.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
