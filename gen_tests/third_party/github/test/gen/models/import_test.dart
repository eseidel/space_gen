// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Import', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Import(
        vcs: 'example',
        vcsUrl: 'example',
        status: ImportStatus.auth,
        url: Uri.parse('https://example.com'),
        htmlUrl: Uri.parse('https://example.com'),
        authorsUrl: Uri.parse('https://example.com'),
        repositoryUrl: Uri.parse('https://example.com'),
      );
      final parsed = Import.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Import.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Import.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
