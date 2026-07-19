// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentFile', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentFile(
        type: ContentFileType.file,
        encoding: 'example',
        size: 0,
        name: 'example',
        path: 'example',
        content: 'example',
        sha: 'example',
        url: Uri.parse('https://example.com'),
        gitUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        downloadUrl: Uri.parse('https://example.com'),
        links: ContentFileLinks(
          git: Uri.parse('https://example.com'),
          html: Uri.parse('https://example.com'),
          self: Uri.parse('https://example.com'),
        ),
      );
      final parsed = ContentFile.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentFile.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentFile.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
