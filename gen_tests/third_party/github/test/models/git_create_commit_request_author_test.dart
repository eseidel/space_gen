// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateCommitRequestAuthor', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateCommitRequestAuthor(
        name: 'example',
        email: 'example',
      );
      final parsed = GitCreateCommitRequestAuthor.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateCommitRequestAuthor.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCreateCommitRequestAuthor.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
