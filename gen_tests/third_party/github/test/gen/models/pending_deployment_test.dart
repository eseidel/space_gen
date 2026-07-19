// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('PendingDeployment', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = PendingDeployment(
        environment: const PendingDeploymentEnvironment(),
        waitTimer: 30,
        waitTimerStartedAt: DateTime.utc(2024),
        currentUserCanApprove: false,
        reviewers: const <PendingDeploymentReviewersInner>[
          PendingDeploymentReviewersInner(),
        ],
      );
      final parsed = PendingDeployment.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(PendingDeployment.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => PendingDeployment.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
