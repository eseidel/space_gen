// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('Tag', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = Tag(
        name: 'v0.1',
        commit: TagCommit(
          sha: 'example',
          url: Uri.parse('https://example.com'),
        ),
        zipballUrl: Uri.parse('https://example.com'),
        tarballUrl: Uri.parse('https://example.com'),
        nodeId: 'example',
      );
      final parsed = Tag.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(Tag.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => Tag.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
