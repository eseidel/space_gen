// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisToolName', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisToolName('example');
      final parsed = CodeScanningAnalysisToolName.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisToolName.maybeFromJson(null), isNull);
    });
  });
}
