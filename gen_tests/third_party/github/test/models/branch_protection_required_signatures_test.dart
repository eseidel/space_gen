// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchProtectionRequiredSignatures', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BranchProtectionRequiredSignatures(
        url: Uri.parse('https://example.com'),
        enabled: false,
      );
      final parsed = BranchProtectionRequiredSignatures.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchProtectionRequiredSignatures.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BranchProtectionRequiredSignatures.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
