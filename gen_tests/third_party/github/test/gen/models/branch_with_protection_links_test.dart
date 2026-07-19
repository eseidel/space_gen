// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('BranchWithProtectionLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = BranchWithProtectionLinks(
        html: 'example',
        self: Uri.parse('https://example.com'),
      );
      final parsed = BranchWithProtectionLinks.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(BranchWithProtectionLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => BranchWithProtectionLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
