// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposCreateDeploymentProtectionRuleRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposCreateDeploymentProtectionRuleRequest();
      final parsed = ReposCreateDeploymentProtectionRuleRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposCreateDeploymentProtectionRuleRequest.maybeFromJson(null),
        isNull,
      );
    });
  });
}
