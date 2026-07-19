// GENERATED — do not hand-edit.
import 'package:github/api.dart';
import 'package:test/test.dart';

void main() {
  group('RepositoryRuleDetailed', () {
    test(
      'RepositoryRuleDetailedOneOf0 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf0(
          type: RepositoryRuleCreationType.creation,
        );
        final parsed = RepositoryRuleDetailedOneOf0.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf1 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf1(
          type: RepositoryRuleUpdateType.update,
        );
        final parsed = RepositoryRuleDetailedOneOf1.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf2 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf2(
          type: RepositoryRuleDeletionType.deletion,
        );
        final parsed = RepositoryRuleDetailedOneOf2.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf3 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf3(
          type: RepositoryRuleRequiredLinearHistoryType.requiredLinearHistory,
        );
        final parsed = RepositoryRuleDetailedOneOf3.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf4 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf4(
          type: RepositoryRuleMergeQueueType.mergeQueue,
        );
        final parsed = RepositoryRuleDetailedOneOf4.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf5 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf5(
          type: RepositoryRuleRequiredDeploymentsType.requiredDeployments,
        );
        final parsed = RepositoryRuleDetailedOneOf5.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf6 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf6(
          type: RepositoryRuleRequiredSignaturesType.requiredSignatures,
        );
        final parsed = RepositoryRuleDetailedOneOf6.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf7 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf7(
          type: RepositoryRulePullRequestType.pullRequest,
        );
        final parsed = RepositoryRuleDetailedOneOf7.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf8 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf8(
          type: RepositoryRuleRequiredStatusChecksType.requiredStatusChecks,
        );
        final parsed = RepositoryRuleDetailedOneOf8.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf9 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf9(
          type: RepositoryRuleNonFastForwardType.nonFastForward,
        );
        final parsed = RepositoryRuleDetailedOneOf9.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf10 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf10(
          type: RepositoryRuleCommitMessagePatternType.commitMessagePattern,
        );
        final parsed = RepositoryRuleDetailedOneOf10.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf11 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf11(
          type: RepositoryRuleCommitAuthorEmailPatternType
              .commitAuthorEmailPattern,
        );
        final parsed = RepositoryRuleDetailedOneOf11.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf12 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf12(
          type: RepositoryRuleCommitterEmailPatternType.committerEmailPattern,
        );
        final parsed = RepositoryRuleDetailedOneOf12.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf13 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf13(
          type: RepositoryRuleBranchNamePatternType.branchNamePattern,
        );
        final parsed = RepositoryRuleDetailedOneOf13.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf14 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf14(
          type: RepositoryRuleTagNamePatternType.tagNamePattern,
        );
        final parsed = RepositoryRuleDetailedOneOf14.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf15 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf15(
          type: RepositoryRuleFilePathRestrictionType.filePathRestriction,
        );
        final parsed = RepositoryRuleDetailedOneOf15.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf16 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf16(
          type: RepositoryRuleMaxFilePathLengthType.maxFilePathLength,
        );
        final parsed = RepositoryRuleDetailedOneOf16.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf17 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf17(
          type: RepositoryRuleFileExtensionRestrictionType
              .fileExtensionRestriction,
        );
        final parsed = RepositoryRuleDetailedOneOf17.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf18 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf18(
          type: RepositoryRuleMaxFileSizeType.maxFileSize,
        );
        final parsed = RepositoryRuleDetailedOneOf18.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf19 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf19(
          type: RepositoryRuleWorkflowsType.workflows,
        );
        final parsed = RepositoryRuleDetailedOneOf19.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test(
      'RepositoryRuleDetailedOneOf20 round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleDetailedOneOf20(
          type: RepositoryRuleCodeScanningType.codeScanning,
        );
        final parsed = RepositoryRuleDetailedOneOf20.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('maybeFromJson returns null on null input', () {
      expect(RepositoryRuleDetailed.maybeFromJson(null), isNull);
    });
  });
}
