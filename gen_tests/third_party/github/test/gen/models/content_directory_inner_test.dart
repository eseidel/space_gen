// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentDirectoryInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentDirectoryInner(
        type: ContentDirectoryInnerType.dir,
        size: 0,
        name: 'example',
        path: 'example',
        sha: 'example',
        url: Uri.parse('https://example.com'),
        gitUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        downloadUrl: Uri.parse('https://example.com'),
        links: ContentDirectoryInnerLinks(
          git: Uri.parse('https://example.com'),
          html: Uri.parse('https://example.com'),
          self: Uri.parse('https://example.com'),
        ),
      );
      final parsed = ContentDirectoryInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentDirectoryInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => ContentDirectoryInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
