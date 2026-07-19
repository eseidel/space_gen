// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchProtectionAllowForcePushes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = BranchProtectionAllowForcePushes();
      final parsed = BranchProtectionAllowForcePushes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchProtectionAllowForcePushes.maybeFromJson(null), isNull);
    });
  });
}
