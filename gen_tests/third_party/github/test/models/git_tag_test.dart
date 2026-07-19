// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitTag', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitTag(
        nodeId:
            'MDM6VGFnOTQwYmQzMzYyNDhlZmFlMGY5ZWU1YmM3YjJkNWM5ODU4ODdiMTZhYw==',
        tag: 'v0.0.1',
        sha: '940bd336248efae0f9ee5bc7b2d5c985887b16ac',
        url: Uri.parse('https://example.com'),
        message: 'Initial public release',
        tagger: const GitTagTagger(
          date: 'example',
          email: 'example',
          name: 'example',
        ),
        object: GitTagObject(
          sha: 'example',
          type: 'example',
          url: Uri.parse('https://example.com'),
        ),
      );
      final parsed = GitTag.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitTag.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitTag.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
