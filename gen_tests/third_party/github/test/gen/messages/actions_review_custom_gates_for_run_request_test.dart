// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsReviewCustomGatesForRunRequest', () {
    test(
      'ReviewCustomGatesCommentRequired round-trips via maybeFromJson/toJson',
      () {
        const instance = ReviewCustomGatesCommentRequired(
          environmentName: 'example',
          comment: 'example',
        );
        final parsed = ReviewCustomGatesCommentRequired.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'ReviewCustomGatesStateRequired round-trips via maybeFromJson/toJson',
      () {
        const instance = ReviewCustomGatesStateRequired(
          environmentName: 'example',
          state: ReviewCustomGatesStateRequiredState.approved,
        );
        final parsed = ReviewCustomGatesStateRequired.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(ActionsReviewCustomGatesForRunRequest.maybeFromJson(null), isNull);
    });
  });
}
