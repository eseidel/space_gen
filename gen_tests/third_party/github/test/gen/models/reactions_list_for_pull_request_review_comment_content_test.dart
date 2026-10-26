// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForPullRequestReviewCommentContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForPullRequestReviewCommentContent.plus1;
      final parsed =
          ReactionsListForPullRequestReviewCommentContent.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForPullRequestReviewCommentContent.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForPullRequestReviewCommentContent.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForPullRequestReviewCommentContent.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForPullRequestReviewCommentContent.values) {
        expect(
          ReactionsListForPullRequestReviewCommentContent.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
