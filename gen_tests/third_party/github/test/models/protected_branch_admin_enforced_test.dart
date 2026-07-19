// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchAdminEnforced', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchAdminEnforced(
        url: Uri.parse('https://example.com'),
        enabled: false,
      );
      final parsed = ProtectedBranchAdminEnforced.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchAdminEnforced.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchAdminEnforced.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
