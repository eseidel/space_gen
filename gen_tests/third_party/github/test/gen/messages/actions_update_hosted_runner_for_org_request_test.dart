// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ActionsUpdateHostedRunnerForOrgRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ActionsUpdateHostedRunnerForOrgRequest();
      final parsed = ActionsUpdateHostedRunnerForOrgRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ActionsUpdateHostedRunnerForOrgRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
