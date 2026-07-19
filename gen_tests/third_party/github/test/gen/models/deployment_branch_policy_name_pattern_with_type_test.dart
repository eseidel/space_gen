// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeploymentBranchPolicyNamePatternWithType', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DeploymentBranchPolicyNamePatternWithType(
        name: 'release/*',
      );
      final parsed = DeploymentBranchPolicyNamePatternWithType.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        DeploymentBranchPolicyNamePatternWithType.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeploymentBranchPolicyNamePatternWithType.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
