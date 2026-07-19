// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsHostedRunnerLimitsPublicIps', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsHostedRunnerLimitsPublicIps(
        maximum: 50,
        currentUsage: 17,
      );
      final parsed = ActionsHostedRunnerLimitsPublicIps.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ActionsHostedRunnerLimitsPublicIps.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ActionsHostedRunnerLimitsPublicIps.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
