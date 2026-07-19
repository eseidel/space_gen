// GENERATED — do not hand-edit.
import 'package:discord/api.dart';
import 'package:test/test.dart';

void main() {
  group('GithubRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GithubRepository(
        id: 0,
        htmlUrl: Uri.parse('https://example.com'),
        name: 'example',
        fullName: 'example',
      );
      final parsed = GithubRepository.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GithubRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GithubRepository.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
