// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitTagObject', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitTagObject(
        sha: 'example',
        type: 'example',
        url: Uri.parse('https://example.com'),
      );
      final parsed = GitTagObject.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitTagObject.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitTagObject.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
