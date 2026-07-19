// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubWebhook', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubWebhook(
        sender: GithubUser(
          id: 0,
          login: 'example',
          htmlUrl: Uri.parse('https://example.com'),
          avatarUrl: Uri.parse('https://example.com'),
        ),
      );
      final parsed = GithubWebhook.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubWebhook.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubWebhook.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
