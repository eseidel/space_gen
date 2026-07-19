// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsUpdateDiscussionCommentInOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsUpdateDiscussionCommentInOrgRequest(
        body: 'example',
      );
      final parsed = TeamsUpdateDiscussionCommentInOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TeamsUpdateDiscussionCommentInOrgRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsUpdateDiscussionCommentInOrgRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
