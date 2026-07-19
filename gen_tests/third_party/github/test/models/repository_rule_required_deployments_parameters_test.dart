// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleRequiredDeploymentsParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleRequiredDeploymentsParameters(
        requiredDeploymentEnvironments: <String>['example'],
      );
      final parsed = RepositoryRuleRequiredDeploymentsParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        RepositoryRuleRequiredDeploymentsParameters.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleRequiredDeploymentsParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
