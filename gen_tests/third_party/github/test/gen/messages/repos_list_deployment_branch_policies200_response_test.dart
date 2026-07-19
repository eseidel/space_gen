// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposListDeploymentBranchPolicies200Response', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ReposListDeploymentBranchPolicies200Response(
        totalCount: 2,
        branchPolicies: <DeploymentBranchPolicy>[DeploymentBranchPolicy()],
      );
      final parsed = ReposListDeploymentBranchPolicies200Response.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        ReposListDeploymentBranchPolicies200Response.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ReposListDeploymentBranchPolicies200Response.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
