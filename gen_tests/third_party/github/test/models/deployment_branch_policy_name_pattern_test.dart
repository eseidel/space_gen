// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('DeploymentBranchPolicyNamePattern', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = DeploymentBranchPolicyNamePattern(name: 'release/*');
      final parsed = DeploymentBranchPolicyNamePattern.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(DeploymentBranchPolicyNamePattern.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => DeploymentBranchPolicyNamePattern.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
