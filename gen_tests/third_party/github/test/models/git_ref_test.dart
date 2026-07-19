// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitRef', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitRef(
        ref: 'example',
        nodeId: 'example',
        url: Uri.parse('https://example.com'),
        object: GitRefObject(
          type: 'example',
          sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
          url: Uri.parse('https://example.com'),
        ),
      );
      final parsed = GitRef.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitRef.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitRef.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
