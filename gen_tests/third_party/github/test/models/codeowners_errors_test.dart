// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeownersErrors', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeownersErrors(
        errors: <CodeownersErrorsErrorsInner>[
          CodeownersErrorsErrorsInner(
            line: 7,
            column: 3,
            kind: 'Invalid owner',
            message: 'Invalid owner on line 7:\n\n  * user\n    ^',
            path: '.github/CODEOWNERS',
          ),
        ],
      );
      final parsed = CodeownersErrors.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeownersErrors.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeownersErrors.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
