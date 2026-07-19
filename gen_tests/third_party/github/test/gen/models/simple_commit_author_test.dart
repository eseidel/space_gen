// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleCommitAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SimpleCommitAuthor(
        name: 'Monalisa Octocat',
        email: 'user@example.com',
      );
      final parsed = SimpleCommitAuthor.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleCommitAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleCommitAuthor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
