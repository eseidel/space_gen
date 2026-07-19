// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('ReposGetContent200Response', () {
    test('ContentSymlink round-trips via maybeFromJson/toJson', () {
      final instance = ContentSymlink(
        type: ContentSymlinkType.symlink,
        target: 'example',
        size: 0,
        name: 'example',
        path: 'example',
        sha: 'example',
        url: Uri.parse('https://example.com'),
        gitUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        downloadUrl: Uri.parse('https://example.com'),
        links: ContentSymlinkLinks(
          git: Uri.parse('https://example.com'),
          html: Uri.parse('https://example.com'),
          self: Uri.parse('https://example.com'),
        ),
      );
      final parsed = ContentSymlink.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('ContentSubmodule round-trips via maybeFromJson/toJson', () {
      final instance = ContentSubmodule(
        type: ContentSubmoduleType.submodule,
        submoduleGitUrl: Uri.parse('https://example.com'),
        size: 0,
        name: 'example',
        path: 'example',
        sha: 'example',
        url: Uri.parse('https://example.com'),
        gitUrl: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        downloadUrl: Uri.parse('https://example.com'),
        links: ContentSubmoduleLinks(
          git: Uri.parse('https://example.com'),
          html: Uri.parse('https://example.com'),
          self: Uri.parse('https://example.com'),
        ),
      );
      final parsed = ContentSubmodule.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(ReposGetContent200Response.maybeFromJson(null), isNull);
    });
  });
}
