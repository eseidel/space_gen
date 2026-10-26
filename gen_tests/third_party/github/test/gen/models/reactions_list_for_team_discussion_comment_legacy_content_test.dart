// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForTeamDiscussionCommentLegacyContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForTeamDiscussionCommentLegacyContent.plus1;
      final parsed =
          ReactionsListForTeamDiscussionCommentLegacyContent.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForTeamDiscussionCommentLegacyContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForTeamDiscussionCommentLegacyContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentLegacyContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForTeamDiscussionCommentLegacyContent.values) {
        expect(
          ReactionsListForTeamDiscussionCommentLegacyContent.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
