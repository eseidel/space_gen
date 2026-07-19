// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunnerLimits', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunnerLimits(
        publicIps: ActionsHostedRunnerLimitsPublicIps(
          maximum: 50,
          currentUsage: 17,
        ),
      );
      final parsed = ActionsHostedRunnerLimits.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunnerLimits.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunnerLimits.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
