// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningVariantAnalysisRepository', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningVariantAnalysisRepository(
        id: 1296269,
        name: 'Hello-World',
        fullName: 'octocat/Hello-World',
        private: false,
        stargazersCount: 80,
        updatedAt: DateTime.utc(2024),
      );
      final parsed = CodeScanningVariantAnalysisRepository.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(CodeScanningVariantAnalysisRepository.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningVariantAnalysisRepository.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
