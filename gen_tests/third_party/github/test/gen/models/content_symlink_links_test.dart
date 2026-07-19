// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentSymlinkLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentSymlinkLinks(
        git: Uri.parse('https://example.com'),
        html: Uri.parse('https://example.com'),
        self: Uri.parse('https://example.com'),
      );
      final parsed = ContentSymlinkLinks.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentSymlinkLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentSymlinkLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
