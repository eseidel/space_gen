// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningAnalysisUrl', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningAnalysisUrl(
        Uri.parse('https://example.com'),
      );
      final parsed = CodeScanningAnalysisUrl.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningAnalysisUrl.maybeFromJson(null), isNull);
    });
  });
}
