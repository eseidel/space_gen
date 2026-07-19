// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAutofix', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAutofix(
        status: CodeScanningAutofixStatus.pending,
        description: const CodeScanningAutofixDescription('example'),
        startedAt: CodeScanningAutofixStartedAt(DateTime.utc(2024)),
      );
      final parsed = CodeScanningAutofix.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAutofix.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAutofix.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
