// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LicenseContentLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LicenseContentLinks(
        git: Uri.parse('https://example.com'),
        html: Uri.parse('https://example.com'),
        self: Uri.parse('https://example.com'),
      );
      final parsed = LicenseContentLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LicenseContentLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LicenseContentLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
