// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ContentDirectory', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = ContentDirectory(<ContentDirectoryInner>[
        ContentDirectoryInner(
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
        ),
      ]);
      final parsed = ContentDirectory.maybeFromJson(instance.toJson())!;
      expect(parsed.toJson(), equals(instance.toJson()));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ContentDirectory.maybeFromJson(null), isNull);
    });
  });
}
