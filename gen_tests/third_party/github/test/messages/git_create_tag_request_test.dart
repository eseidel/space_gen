// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateTagRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateTagRequest(
        tag: 'example',
        message: 'example',
        object: 'example',
        type: GitCreateTagRequestType.commit,
      );
      final parsed = GitCreateTagRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateTagRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCreateTagRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
