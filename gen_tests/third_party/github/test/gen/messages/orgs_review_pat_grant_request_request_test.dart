// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsReviewPatGrantRequestRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsReviewPatGrantRequestRequest(
        action: OrgsReviewPatGrantRequestRequestAction.approve,
      );
      final parsed = OrgsReviewPatGrantRequestRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(OrgsReviewPatGrantRequestRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            OrgsReviewPatGrantRequestRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
