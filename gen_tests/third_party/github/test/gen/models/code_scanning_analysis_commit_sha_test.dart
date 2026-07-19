// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisCommitSha', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAnalysisCommitSha(
        'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
      );
      final parsed = CodeScanningAnalysisCommitSha.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisCommitSha.maybeFromJson(null), isNull);
    });
  });
}
