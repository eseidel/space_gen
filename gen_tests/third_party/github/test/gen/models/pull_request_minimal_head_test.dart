// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMinimalHead', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMinimalHead(
        ref: 'example',
        sha: 'example',
        repo: PullRequestMinimalHeadRepo(
          id: 0,
          url: 'example',
          name: 'example',
        ),
      );
      final parsed = PullRequestMinimalHead.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMinimalHead.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMinimalHead.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
