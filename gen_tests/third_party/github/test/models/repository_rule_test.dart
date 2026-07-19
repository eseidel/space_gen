// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRule', () {
    test('RepositoryRuleCreation round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCreation(
        type: RepositoryRuleCreationType.creation,
      );
      final parsed = RepositoryRuleCreation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleUpdate round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleUpdate(
        type: RepositoryRuleUpdateType.update,
      );
      final parsed = RepositoryRuleUpdate.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleDeletion round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleDeletion(
        type: RepositoryRuleDeletionType.deletion,
      );
      final parsed = RepositoryRuleDeletion.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredLinearHistory round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredLinearHistory(
          type: RepositoryRuleRequiredLinearHistoryType.requiredLinearHistory,
        );
        final parsed = RepositoryRuleRequiredLinearHistory.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRuleMergeQueue round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleMergeQueue(
        type: RepositoryRuleMergeQueueType.mergeQueue,
      );
      final parsed = RepositoryRuleMergeQueue.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredDeployments round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredDeployments(
          type: RepositoryRuleRequiredDeploymentsType.requiredDeployments,
        );
        final parsed = RepositoryRuleRequiredDeployments.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleRequiredSignatures round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredSignatures(
          type: RepositoryRuleRequiredSignaturesType.requiredSignatures,
        );
        final parsed = RepositoryRuleRequiredSignatures.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRulePullRequest round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRulePullRequest(
        type: RepositoryRulePullRequestType.pullRequest,
      );
      final parsed = RepositoryRulePullRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredStatusChecks round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredStatusChecks(
          type: RepositoryRuleRequiredStatusChecksType.requiredStatusChecks,
        );
        final parsed = RepositoryRuleRequiredStatusChecks.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleNonFastForward round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleNonFastForward(
          type: RepositoryRuleNonFastForwardType.nonFastForward,
        );
        final parsed = RepositoryRuleNonFastForward.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleCommitMessagePattern round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleCommitMessagePattern(
          type: RepositoryRuleCommitMessagePatternType.commitMessagePattern,
        );
        final parsed = RepositoryRuleCommitMessagePattern.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleCommitAuthorEmailPattern round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleCommitAuthorEmailPattern(
          type: RepositoryRuleCommitAuthorEmailPatternType
              .commitAuthorEmailPattern,
        );
        final parsed = RepositoryRuleCommitAuthorEmailPattern.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleCommitterEmailPattern round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleCommitterEmailPattern(
          type: RepositoryRuleCommitterEmailPatternType.committerEmailPattern,
        );
        final parsed = RepositoryRuleCommitterEmailPattern.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleBranchNamePattern round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleBranchNamePattern(
          type: RepositoryRuleBranchNamePatternType.branchNamePattern,
        );
        final parsed = RepositoryRuleBranchNamePattern.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleTagNamePattern round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleTagNamePattern(
          type: RepositoryRuleTagNamePatternType.tagNamePattern,
        );
        final parsed = RepositoryRuleTagNamePattern.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleFilePathRestriction round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleFilePathRestriction(
          type: RepositoryRuleFilePathRestrictionType.filePathRestriction,
        );
        final parsed = RepositoryRuleFilePathRestriction.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleMaxFilePathLength round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleMaxFilePathLength(
          type: RepositoryRuleMaxFilePathLengthType.maxFilePathLength,
        );
        final parsed = RepositoryRuleMaxFilePathLength.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleFileExtensionRestriction round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleFileExtensionRestriction(
          type: RepositoryRuleFileExtensionRestrictionType
              .fileExtensionRestriction,
        );
        final parsed = RepositoryRuleFileExtensionRestriction.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRuleMaxFileSize round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleMaxFileSize(
        type: RepositoryRuleMaxFileSizeType.maxFileSize,
      );
      final parsed = RepositoryRuleMaxFileSize.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleWorkflows round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleWorkflows(
        type: RepositoryRuleWorkflowsType.workflows,
      );
      final parsed = RepositoryRuleWorkflows.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleCodeScanning round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCodeScanning(
        type: RepositoryRuleCodeScanningType.codeScanning,
      );
      final parsed = RepositoryRuleCodeScanning.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRule.maybeFromJson(null), isNull);
    });
  });
}
