// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisAnalysisKey', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisAnalysisKey('example');
      final parsed = CodeScanningAnalysisAnalysisKey.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisAnalysisKey.maybeFromJson(null), isNull);
    });
  });
}
