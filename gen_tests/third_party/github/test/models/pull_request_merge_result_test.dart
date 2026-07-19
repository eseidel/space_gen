// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestMergeResult', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestMergeResult(
        sha: 'example',
        merged: false,
        message: 'example',
      );
      final parsed = PullRequestMergeResult.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestMergeResult.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestMergeResult.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
