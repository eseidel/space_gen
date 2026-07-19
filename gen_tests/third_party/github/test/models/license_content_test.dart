// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('LicenseContent', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = LicenseContent(
        name: 'example',
        path: 'example',
        sha: 'example',
        size: 0,
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        gitUrl: Uri.parse('https://example.com'),
        downloadUrl: Uri.parse('https://example.com'),
        type: 'example',
        content: 'example',
        encoding: 'example',
        links: LicenseContentLinks(
          git: Uri.parse('https://example.com'),
          html: Uri.parse('https://example.com'),
          self: Uri.parse('https://example.com'),
        ),
        license: LicenseSimple(
          key: 'mit',
          name: 'MIT License',
          url: Uri.parse('https://example.com'),
          spdxId: 'MIT',
          nodeId: 'MDc6TGljZW5zZW1pdA==',
        ),
      );
      final parsed = LicenseContent.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(LicenseContent.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => LicenseContent.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
