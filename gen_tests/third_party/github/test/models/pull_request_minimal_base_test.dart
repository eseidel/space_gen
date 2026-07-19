// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMinimalBase', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMinimalBase(
        ref: 'example',
        sha: 'example',
        repo: PullRequestMinimalBaseRepo(
          id: 0,
          url: 'example',
          name: 'example',
        ),
      );
      final parsed = PullRequestMinimalBase.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMinimalBase.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMinimalBase.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
