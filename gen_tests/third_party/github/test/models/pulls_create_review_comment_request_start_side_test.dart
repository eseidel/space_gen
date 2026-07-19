// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsCreateReviewCommentRequestStartSide', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsCreateReviewCommentRequestStartSide.left;
      final parsed = PullsCreateReviewCommentRequestStartSide.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        PullsCreateReviewCommentRequestStartSide.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullsCreateReviewCommentRequestStartSide.maybeFromJson(
          '__invalid_enum_value__',
        ),
        throwsFormatException,
      );
    });

    test('toString matches toJson for every value', () {
      for (final value in PullsCreateReviewCommentRequestStartSide.values) {
        expect(value.toString(), equals(value.toJson()));
      }
    });

    test('fromJson round-trips every value', () {
      for (final value in PullsCreateReviewCommentRequestStartSide.values) {
        expect(
          PullsCreateReviewCommentRequestStartSide.fromJson(value.toJson()),
          equals(value),
        );
      }
    });
  });
}
