// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsCreateForTeamDiscussionCommentInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsCreateForTeamDiscussionCommentInOrgRequest(
        content:
            ReactionsCreateForTeamDiscussionCommentInOrgRequestContent.plus1,
      );
      final parsed =
          ReactionsCreateForTeamDiscussionCommentInOrgRequest.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsCreateForTeamDiscussionCommentInOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsCreateForTeamDiscussionCommentInOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
