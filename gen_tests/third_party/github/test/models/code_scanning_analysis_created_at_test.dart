// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisCreatedAt', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAnalysisCreatedAt(DateTime.utc(2024));
      final parsed = CodeScanningAnalysisCreatedAt.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisCreatedAt.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAnalysisCreatedAt.maybeFromJson('not a date'),
        throwsFormatException,
      );
    });
  });
}
