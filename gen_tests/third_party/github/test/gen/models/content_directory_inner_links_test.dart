// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentDirectoryInnerLinks', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentDirectoryInnerLinks(
        git: Uri.parse('https://example.com'),
        html: Uri.parse('https://example.com'),
        self: Uri.parse('https://example.com'),
      );
      final parsed = ContentDirectoryInnerLinks.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentDirectoryInnerLinks.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentDirectoryInnerLinks.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
