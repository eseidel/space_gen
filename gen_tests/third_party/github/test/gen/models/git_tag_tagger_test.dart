// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitTagTagger', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitTagTagger(
        date: 'example',
        email: 'example',
        name: 'example',
      );
      final parsed = GitTagTagger.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitTagTagger.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitTagTagger.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
