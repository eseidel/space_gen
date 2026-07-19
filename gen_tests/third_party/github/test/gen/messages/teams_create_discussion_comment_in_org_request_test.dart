// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsCreateDiscussionCommentInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsCreateDiscussionCommentInOrgRequest(
        body: 'example',
      );
      final parsed = TeamsCreateDiscussionCommentInOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TeamsCreateDiscussionCommentInOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsCreateDiscussionCommentInOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
