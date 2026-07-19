// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysis', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAnalysis(
        ref: const CodeScanningRef('example'),
        commitSha: CodeScanningAnalysisCommitSha(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        ),
        analysisKey: const CodeScanningAnalysisAnalysisKey('example'),
        environment: const CodeScanningAnalysisEnvironment('example'),
        error: 'error reading field xyz',
        createdAt: CodeScanningAnalysisCreatedAt(DateTime.utc(2024)),
        resultsCount: 0,
        rulesCount: 0,
        id: 0,
        url: CodeScanningAnalysisUrl(Uri.parse('https://example.com')),
        sarifId: const CodeScanningAnalysisSarifId(
          '6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53',
        ),
        tool: const CodeScanningAnalysisTool(),
        deletable: false,
        warning: '123 results were ignored',
      );
      final parsed = CodeScanningAnalysis.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysis.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningAnalysis.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
