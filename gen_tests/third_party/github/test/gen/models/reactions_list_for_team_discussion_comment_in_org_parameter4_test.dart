// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForTeamDiscussionCommentInOrgParameter4', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance =
          ReactionsListForTeamDiscussionCommentInOrgParameter4.plus1;
      final parsed =
          ReactionsListForTeamDiscussionCommentInOrgParameter4.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForTeamDiscussionCommentInOrgParameter4.maybeFromJson(
          null,
        ),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ReactionsListForTeamDiscussionCommentInOrgParameter4.maybeFromJson(
              '__invalid_enum_value__',
            ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentInOrgParameter4.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentInOrgParameter4.values) {
        expect(
          ReactionsListForTeamDiscussionCommentInOrgParameter4.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
