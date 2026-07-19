// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('CodeScanningVariantAnalysisSkippedRepositories', () {
    test('round-trips via maybeFromJson/toJson', () {
      final instance = CodeScanningVariantAnalysisSkippedRepositories(
        accessMismatchRepos: CodeScanningVariantAnalysisSkippedRepoGroup(
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
        ),
        notFoundRepos:
            const CodeScanningVariantAnalysisSkippedRepositoriesNotFoundRepos(
              repositoryCount: 2,
              repositoryFullNames: <String>['example'],
            ),
        noCodeqlDbRepos: CodeScanningVariantAnalysisSkippedRepoGroup(
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
        ),
        overLimitRepos: CodeScanningVariantAnalysisSkippedRepoGroup(
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
        ),
      );
      final parsed =
          CodeScanningVariantAnalysisSkippedRepositories.maybeFromJson(
            instance.toJson(),
          )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(
        CodeScanningVariantAnalysisSkippedRepositories.maybeFromJson(null),
        isNull,
      );
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => CodeScanningVariantAnalysisSkippedRepositories.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
