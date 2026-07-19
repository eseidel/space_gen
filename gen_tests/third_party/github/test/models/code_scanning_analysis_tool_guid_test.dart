// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisToolGuid', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisToolGuid('example');
      final parsed = CodeScanningAnalysisToolGuid.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisToolGuid.maybeFromJson(null), isNull);
    });
  });
}
