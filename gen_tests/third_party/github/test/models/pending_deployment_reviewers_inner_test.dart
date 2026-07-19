// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PendingDeploymentReviewersInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = PendingDeploymentReviewersInner();
      final parsed = PendingDeploymentReviewersInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PendingDeploymentReviewersInner.maybeFromJson(null), isNull);
    });
  });
}
