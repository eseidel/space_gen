// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeploymentProtectionRule', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DeploymentProtectionRule(
        id: 3515,
        nodeId: 'MDQ6R2F0ZTM1MTU=',
        enabled: false,
        app: CustomDeploymentRuleApp(
          id: 3515,
          slug: 'my-custom-app',
          integrationUrl: 'https://api.github.com/apps/custom-app-slug',
          nodeId: 'MDQ6R2F0ZTM1MTU=',
        ),
      );
      final parsed = DeploymentProtectionRule.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeploymentProtectionRule.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeploymentProtectionRule.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
