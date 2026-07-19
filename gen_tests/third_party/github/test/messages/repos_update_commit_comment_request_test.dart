// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposUpdateCommitCommentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposUpdateCommitCommentRequest(body: 'example');
      final parsed = ReposUpdateCommitCommentRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposUpdateCommitCommentRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReposUpdateCommitCommentRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
