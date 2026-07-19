// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMinimal', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMinimal(
        id: 0,
        number: 0,
        url: 'example',
        head: PullRequestMinimalHead(
          ref: 'example',
          sha: 'example',
          repo: PullRequestMinimalHeadRepo(
            id: 0,
            url: 'example',
            name: 'example',
          ),
        ),
        base: PullRequestMinimalBase(
          ref: 'example',
          sha: 'example',
          repo: PullRequestMinimalBaseRepo(
            id: 0,
            url: 'example',
            name: 'example',
          ),
        ),
      );
      final parsed = PullRequestMinimal.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMinimal.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMinimal.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
