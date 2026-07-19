// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchAllowForcePushes', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProtectedBranchAllowForcePushes(enabled: false);
      final parsed = ProtectedBranchAllowForcePushes.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchAllowForcePushes.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () =>
            ProtectedBranchAllowForcePushes.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
