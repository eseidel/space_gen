// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('GitCreateTreeRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = GitCreateTreeRequest(
        tree: <GitCreateTreeRequestTreeInner>[GitCreateTreeRequestTreeInner()],
      );
      final parsed = GitCreateTreeRequest.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(GitCreateTreeRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => GitCreateTreeRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
