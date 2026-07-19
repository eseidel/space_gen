// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisSarifId', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisSarifId(
        '6c81cd8e-b078-4ac3-a3be-1dad7dbd0b53',
      );
      final parsed = CodeScanningAnalysisSarifId.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisSarifId.maybeFromJson(null), isNull);
    });
  });
}
