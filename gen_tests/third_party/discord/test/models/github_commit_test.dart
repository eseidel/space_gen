// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubCommit', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubCommit(
        id: 'example',
        url: Uri.parse('https://example.com'),
        message: 'example',
        author: const GithubAuthor(name: 'example'),
      );
      final parsed = GithubCommit.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubCommit.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubCommit.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
