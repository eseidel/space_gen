// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateTagRequestTagger', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateTagRequestTagger(
        name: 'example',
        email: 'example',
      );
      final parsed = GitCreateTagRequestTagger.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateTagRequestTagger.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCreateTagRequestTagger.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
