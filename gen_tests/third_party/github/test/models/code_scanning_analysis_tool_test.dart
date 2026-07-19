// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisTool', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisTool();
      final parsed = CodeScanningAnalysisTool.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisTool.maybeFromJson(null), isNull);
    });
  });
}
