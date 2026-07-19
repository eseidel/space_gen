// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchEnforceAdmins', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchEnforceAdmins(
        url: Uri.parse('https://example.com'),
        enabled: false,
      );
      final parsed = ProtectedBranchEnforceAdmins.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchEnforceAdmins.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchEnforceAdmins.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
