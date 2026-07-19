// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitTreeTreeInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitTreeTreeInner(
        path: 'test/file.rb',
        mode: '040000',
        type: 'tree',
        sha: '23f6827669e43831def8a7ad935069c8bd418261',
      );
      final parsed = GitTreeTreeInner.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitTreeTreeInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitTreeTreeInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
