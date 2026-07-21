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
      const instance = RepositoryRuleCreation();
      final parsed = RepositoryRuleCreation.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleUpdate round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleUpdate();
      final parsed = RepositoryRuleUpdate.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleDeletion round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleDeletion();
      final parsed = RepositoryRuleDeletion.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredLinearHistory round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredLinearHistory();
        final parsed = RepositoryRuleRequiredLinearHistory.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRuleMergeQueue round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleMergeQueue();
      final parsed = RepositoryRuleMergeQueue.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredDeployments round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredDeployments();
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
        const instance = RepositoryRuleRequiredSignatures();
        final parsed = RepositoryRuleRequiredSignatures.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRulePullRequest round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRulePullRequest();
      final parsed = RepositoryRulePullRequest.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test(
      'RepositoryRuleRequiredStatusChecks round-trips via maybeFromJson/toJson',
      () {
        const instance = RepositoryRuleRequiredStatusChecks();
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
        const instance = RepositoryRuleNonFastForward();
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
        const instance = RepositoryRuleCommitMessagePattern();
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
        const instance = RepositoryRuleCommitAuthorEmailPattern();
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
        const instance = RepositoryRuleCommitterEmailPattern();
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
        const instance = RepositoryRuleBranchNamePattern();
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
        const instance = RepositoryRuleTagNamePattern();
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
        const instance = RepositoryRuleFilePathRestriction();
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
        const instance = RepositoryRuleMaxFilePathLength();
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
        const instance = RepositoryRuleFileExtensionRestriction();
        final parsed = RepositoryRuleFileExtensionRestriction.maybeFromJson(
          instance.toJson(),
        )!;
        expect(parsed, equals(instance));
        expect(parsed.hashCode, equals(instance.hashCode));
      },
    );

    test('RepositoryRuleMaxFileSize round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleMaxFileSize();
      final parsed = RepositoryRuleMaxFileSize.maybeFromJson(
        instance.toJson(),
      )!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleWorkflows round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleWorkflows();
      final parsed = RepositoryRuleWorkflows.maybeFromJson(instance.toJson())!;
      expect(parsed, equals(instance));
      expect(parsed.hashCode, equals(instance.hashCode));
    });

    test('RepositoryRuleCodeScanning round-trips via maybeFromJson/toJson', () {
      const instance = RepositoryRuleCodeScanning();
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
