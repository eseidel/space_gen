// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForTeamDiscussionCommentLegacyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForTeamDiscussionCommentLegacyRequest(
        content:
            ReactionsCreateForTeamDiscussionCommentLegacyRequestContent.plus1,
      );
      final parsed =
          ReactionsCreateForTeamDiscussionCommentLegacyRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForTeamDiscussionCommentLegacyRequest.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReactionsCreateForTeamDiscussionCommentLegacyRequest.maybeFromJson(
              <String, dynamic>{},
            ),
        throwsFormatException,
      );
    });
  });
}
