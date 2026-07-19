// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsSubmitReviewRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsSubmitReviewRequest(
        event: PullsSubmitReviewRequestEvent.approve,
      );
      final parsed = PullsSubmitReviewRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsSubmitReviewRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PullsSubmitReviewRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
