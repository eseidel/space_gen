// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('SimpleCommitCommitter', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = SimpleCommitCommitter(
        name: 'Monalisa Octocat',
        email: 'user@example.com',
      );
      final parsed = SimpleCommitCommitter.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(SimpleCommitCommitter.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => SimpleCommitCommitter.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
