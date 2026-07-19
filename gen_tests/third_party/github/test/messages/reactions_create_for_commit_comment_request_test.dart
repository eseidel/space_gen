// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForCommitCommentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForCommitCommentRequest(
        content: ReactionsCreateForCommitCommentRequestContent.plus1,
      );
      final parsed = ReactionsCreateForCommitCommentRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForCommitCommentRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForCommitCommentRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
