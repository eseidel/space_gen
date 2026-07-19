// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeownersErrorsErrorsInner', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeownersErrorsErrorsInner(
        line: 7,
        column: 3,
        kind: 'Invalid owner',
        message: 'Invalid owner on line 7:\n\n  * user\n    ^',
        path: '.github/CODEOWNERS',
      );
      final parsed = CodeownersErrorsErrorsInner.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeownersErrorsErrorsInner.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeownersErrorsErrorsInner.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
