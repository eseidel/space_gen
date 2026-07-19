// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchAllowDeletions', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = ProtectedBranchAllowDeletions(enabled: false);
      final parsed = ProtectedBranchAllowDeletions.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchAllowDeletions.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchAllowDeletions.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
