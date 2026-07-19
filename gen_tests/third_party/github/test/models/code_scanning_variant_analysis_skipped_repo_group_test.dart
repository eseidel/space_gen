// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningVariantAnalysisSkippedRepoGroup', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningVariantAnalysisSkippedRepoGroup(
        repositoryCount: 2,
        repositories: <CodeScanningVariantAnalysisRepository>[
          CodeScanningVariantAnalysisRepository(
            id: 1296269,
            name: 'Hello-World',
            fullName: 'octocat/Hello-World',
            private: false,
            stargazersCount: 80,
            updatedAt: DateTime.utc(2024),
          ),
        ],
      );
      final parsed = CodeScanningVariantAnalysisSkippedRepoGroup.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningVariantAnalysisSkippedRepoGroup.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningVariantAnalysisSkippedRepoGroup.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
