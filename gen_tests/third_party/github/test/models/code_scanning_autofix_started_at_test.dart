// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAutofixStartedAt', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAutofixStartedAt(DateTime.utc(2024));
      final parsed = CodeScanningAutofixStartedAt.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAutofixStartedAt.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAutofixStartedAt.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
