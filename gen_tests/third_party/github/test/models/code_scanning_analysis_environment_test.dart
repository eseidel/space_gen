// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisEnvironment', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = CodeScanningAnalysisEnvironment('example');
      final parsed = CodeScanningAnalysisEnvironment.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisEnvironment.maybeFromJson(null), isNull);
    });
  });
}
