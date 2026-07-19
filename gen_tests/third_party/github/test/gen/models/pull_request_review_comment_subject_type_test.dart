// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullRequestReviewCommentSubjectType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullRequestReviewCommentSubjectType.line;
      final parsed = PullRequestReviewCommentSubjectType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullRequestReviewCommentSubjectType.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullRequestReviewCommentSubjectType.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PullRequestReviewCommentSubjectType.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PullRequestReviewCommentSubjectType.values) {
        expect(
          PullRequestReviewCommentSubjectType.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
