// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitRefObject', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = GitRefObject(
        type: 'example',
        sha: '7638417db6d59f3c431d3e1f261cc637155684cd',
        url: Uri.parse('https://example.com'),
      );
      final parsed = GitRefObject.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitRefObject.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitRefObject.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
