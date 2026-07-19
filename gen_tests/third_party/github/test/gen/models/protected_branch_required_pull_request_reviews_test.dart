// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchRequiredPullRequestReviews', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchRequiredPullRequestReviews(
        url: Uri.parse('https://example.com'),
      );
      final parsed = ProtectedBranchRequiredPullRequestReviews.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ProtectedBranchRequiredPullRequestReviews.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchRequiredPullRequestReviews.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
