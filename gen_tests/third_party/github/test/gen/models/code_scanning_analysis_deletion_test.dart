// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisDeletion', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAnalysisDeletion(
        nextAnalysisUrl: Uri.parse('https://example.com'),
        confirmDeleteUrl: Uri.parse('https://example.com'),
      );
      final parsed = CodeScanningAnalysisDeletion.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisDeletion.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAnalysisDeletion.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
