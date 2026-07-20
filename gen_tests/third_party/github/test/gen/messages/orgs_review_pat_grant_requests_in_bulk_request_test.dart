// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('OrgsReviewPatGrantRequestsInBulkRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = OrgsReviewPatGrantRequestsInBulkRequest(
        action: OrgsReviewPatGrantRequestsInBulkRequestAction.approve,
      );
      final parsed = OrgsReviewPatGrantRequestsInBulkRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        OrgsReviewPatGrantRequestsInBulkRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => OrgsReviewPatGrantRequestsInBulkRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
