// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleMergeQueueParameters', () {
    test('round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleMergeQueueParameters(
        checkResponseTimeoutMinutes: 1,
        groupingStrategy:
            RepositoryRuleMergeQueueParametersGroupingStrategy.allgreen,
        maxEntriesToBuild: 0,
        maxEntriesToMerge: 0,
        mergeMethod: RepositoryRuleMergeQueueParametersMergeMethod.merge,
        minEntriesToMerge: 0,
        minEntriesToMergeWaitMinutes: 0,
      );
      final parsed = RepositoryRuleMergeQueueParameters.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleMergeQueueParameters.maybeFromJson(null), isNull);
    });

    test('maybeFromJson throws FormatException on invalid input', () {
      expect(
        () => RepositoryRuleMergeQueueParameters.maybeFromJson(
          <String, dynamic>{},
        ),
        throwsFormatException,
      );
    });
  });
}
