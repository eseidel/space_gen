// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchRestrictionPolicyAppsInnerOwner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BranchRestrictionPolicyAppsInnerOwner();
      final parsed = BranchRestrictionPolicyAppsInnerOwner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchRestrictionPolicyAppsInnerOwner.maybeFromJson(null), isNull);
    });
  });
}
