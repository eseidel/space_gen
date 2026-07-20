// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchPullRequestReview', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchPullRequestReview(
        dismissStaleReviews: false,
        requireCodeOwnerReviews: false,
      );
      final parsed = ProtectedBranchPullRequestReview.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchPullRequestReview.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ProtectedBranchPullRequestReview.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
