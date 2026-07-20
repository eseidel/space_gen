// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningCreateVariantAnalysisRequest', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningCreateVariantAnalysisRequest(
        language: CodeScanningVariantAnalysisLanguage.cpp,
        queryPack: 'example',
      );
      final parsed = CodeScanningCreateVariantAnalysisRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningCreateVariantAnalysisRequest.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningCreateVariantAnalysisRequest.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
