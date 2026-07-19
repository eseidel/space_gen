// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('TeamsUpdateDiscussionCommentLegacyRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = TeamsUpdateDiscussionCommentLegacyRequest(
        body: 'example',
      );
      final parsed = TeamsUpdateDiscussionCommentLegacyRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        TeamsUpdateDiscussionCommentLegacyRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => TeamsUpdateDiscussionCommentLegacyRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
