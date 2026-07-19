// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReactionsListForPullRequestReviewCommentParameter3', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReactionsListForPullRequestReviewCommentParameter3.plus1;
      final parsed =
          ReactionsListForPullRequestReviewCommentParameter3.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReactionsListForPullRequestReviewCommentParameter3.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReactionsListForPullRequestReviewCommentParameter3.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value
          in ReactionsListForPullRequestReviewCommentParameter3.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value
          in ReactionsListForPullRequestReviewCommentParameter3.values) {
        expect(
          ReactionsListForPullRequestReviewCommentParameter3.fromJson(
            value.toJson(),
          ),
          equals(value),
        );
      }
    });
  });
}
