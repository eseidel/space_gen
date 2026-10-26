// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForTeamDiscussionCommentInOrgContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForTeamDiscussionCommentInOrgContent.plus1;
      final parsed =
          ReactionsListForTeamDiscussionCommentInOrgContent.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForTeamDiscussionCommentInOrgContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForTeamDiscussionCommentInOrgContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentInOrgContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentInOrgContent.values) {
        expect(
          ReactionsListForTeamDiscussionCommentInOrgContent.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
