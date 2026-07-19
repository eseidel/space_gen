// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForIssueCommentRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForIssueCommentRequest(
        content: ReactionsCreateForIssueCommentRequestContent.plus1,
      );
      final parsed = ReactionsCreateForIssueCommentRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReactionsCreateForIssueCommentRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForIssueCommentRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
