// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PullsCreateReviewRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PullsCreateReviewRequest();
      final parsed = PullsCreateReviewRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PullsCreateReviewRequest.maybeFromJson(null), isNull);
    });
  });
}
