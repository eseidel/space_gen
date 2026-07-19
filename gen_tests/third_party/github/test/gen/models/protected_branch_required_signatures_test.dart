// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ProtectedBranchRequiredSignatures', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ProtectedBranchRequiredSignatures(
        url: Uri.parse('https://example.com'),
        enabled: false,
      );
      final parsed = ProtectedBranchRequiredSignatures.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ProtectedBranchRequiredSignatures.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ProtectedBranchRequiredSignatures.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
