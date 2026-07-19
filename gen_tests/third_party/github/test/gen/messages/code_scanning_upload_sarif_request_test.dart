// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningUploadSarifRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningUploadSarifRequest(
        commitSha: CodeScanningAnalysisCommitSha(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        ),
        ref: CodeScanningRefFull('refs/heads/main'),
        sarif: const CodeScanningAnalysisSarifFile('example'),
      );
      final parsed = CodeScanningUploadSarifRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningUploadSarifRequest.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningUploadSarifRequest.maybeFromJson(<String, dynamic>{}),
        throwsFormatException,
      );
    });
  });
}
