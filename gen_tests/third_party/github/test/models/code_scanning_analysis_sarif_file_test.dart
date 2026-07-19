// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisSarifFile', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisSarifFile('example');
      final parsed = CodeScanningAnalysisSarifFile.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisSarifFile.maybeFromJson(null), isNull);
    });
  });
}
