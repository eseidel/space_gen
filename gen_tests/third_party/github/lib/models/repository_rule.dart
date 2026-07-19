import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_branch_name_pattern_parameters.dart';
import 'package:github/models/repository_rule_branch_name_pattern_type.dart';
import 'package:github/models/repository_rule_code_scanning_parameters.dart';
import 'package:github/models/repository_rule_code_scanning_type.dart';
import 'package:github/models/repository_rule_commit_author_email_pattern_parameters.dart';
import 'package:github/models/repository_rule_commit_author_email_pattern_type.dart';
import 'package:github/models/repository_rule_commit_message_pattern_parameters.dart';
import 'package:github/models/repository_rule_commit_message_pattern_type.dart';
import 'package:github/models/repository_rule_committer_email_pattern_parameters.dart';
import 'package:github/models/repository_rule_committer_email_pattern_type.dart';
import 'package:github/models/repository_rule_creation_type.dart';
import 'package:github/models/repository_rule_deletion_type.dart';
import 'package:github/models/repository_rule_file_extension_restriction_parameters.dart';
import 'package:github/models/repository_rule_file_extension_restriction_type.dart';
import 'package:github/models/repository_rule_file_path_restriction_parameters.dart';
import 'package:github/models/repository_rule_file_path_restriction_type.dart';
import 'package:github/models/repository_rule_max_file_path_length_parameters.dart';
import 'package:github/models/repository_rule_max_file_path_length_type.dart';
import 'package:github/models/repository_rule_max_file_size_parameters.dart';
import 'package:github/models/repository_rule_max_file_size_type.dart';
import 'package:github/models/repository_rule_merge_queue_parameters.dart';
import 'package:github/models/repository_rule_merge_queue_type.dart';
import 'package:github/models/repository_rule_non_fast_forward_type.dart';
import 'package:github/models/repository_rule_pull_request_parameters.dart';
import 'package:github/models/repository_rule_pull_request_type.dart';
import 'package:github/models/repository_rule_required_deployments_parameters.dart';
import 'package:github/models/repository_rule_required_deployments_type.dart';
import 'package:github/models/repository_rule_required_linear_history_type.dart';
import 'package:github/models/repository_rule_required_signatures_type.dart';
import 'package:github/models/repository_rule_required_status_checks_parameters.dart';
import 'package:github/models/repository_rule_required_status_checks_type.dart';
import 'package:github/models/repository_rule_tag_name_pattern_parameters.dart';
import 'package:github/models/repository_rule_tag_name_pattern_type.dart';
import 'package:github/models/repository_rule_update_parameters.dart';
import 'package:github/models/repository_rule_update_type.dart';
import 'package:github/models/repository_rule_workflows_parameters.dart';
import 'package:github/models/repository_rule_workflows_type.dart';
import 'package:meta/meta.dart';

/// Repository Rule
/// A repository rule.
sealed class RepositoryRule {
  const RepositoryRule();

  factory RepositoryRule.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      'creation' => RepositoryRuleCreation.fromJson(json),
      'update' => RepositoryRuleUpdate.fromJson(json),
      'deletion' => RepositoryRuleDeletion.fromJson(json),
      'required_linear_history' => RepositoryRuleRequiredLinearHistory.fromJson(
        json,
      ),
      'merge_queue' => RepositoryRuleMergeQueue.fromJson(json),
      'required_deployments' => RepositoryRuleRequiredDeployments.fromJson(
        json,
      ),
      'required_signatures' => RepositoryRuleRequiredSignatures.fromJson(json),
      'pull_request' => RepositoryRulePullRequest.fromJson(json),
      'required_status_checks' => RepositoryRuleRequiredStatusChecks.fromJson(
        json,
      ),
      'non_fast_forward' => RepositoryRuleNonFastForward.fromJson(json),
      'commit_message_pattern' => RepositoryRuleCommitMessagePattern.fromJson(
        json,
      ),
      'commit_author_email_pattern' =>
        RepositoryRuleCommitAuthorEmailPattern.fromJson(json),
      'committer_email_pattern' => RepositoryRuleCommitterEmailPattern.fromJson(
        json,
      ),
      'branch_name_pattern' => RepositoryRuleBranchNamePattern.fromJson(json),
      'tag_name_pattern' => RepositoryRuleTagNamePattern.fromJson(json),
      'file_path_restriction' => RepositoryRuleFilePathRestriction.fromJson(
        json,
      ),
      'max_file_path_length' => RepositoryRuleMaxFilePathLength.fromJson(json),
      'file_extension_restriction' =>
        RepositoryRuleFileExtensionRestriction.fromJson(json),
      'max_file_size' => RepositoryRuleMaxFileSize.fromJson(json),
      'workflows' => RepositoryRuleWorkflows.fromJson(json),
      'code_scanning' => RepositoryRuleCodeScanning.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for RepositoryRule",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRule.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

/// {@template repository_rule_creation}
/// creation
/// Only allow users with bypass permission to create matching refs.
/// {@endtemplate}
@immutable
final class RepositoryRuleCreation extends RepositoryRule {
  /// {@macro repository_rule_creation}
  const RepositoryRuleCreation({required this.type});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleCreation].
  factory RepositoryRuleCreation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleCreation',
      json,
      () => RepositoryRuleCreation(
        type: RepositoryRuleCreationType.fromJson(json['type'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCreation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCreation.fromJson(json);
  }

  final RepositoryRuleCreationType type;

  /// Converts a [RepositoryRuleCreation] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCreation && type == other.type;
  }
}

/// {@template repository_rule_update}
/// update
/// Only allow users with bypass permission to update matching refs.
/// {@endtemplate}
@immutable
final class RepositoryRuleUpdate extends RepositoryRule {
  /// {@macro repository_rule_update}
  const RepositoryRuleUpdate({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleUpdate].
  factory RepositoryRuleUpdate.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleUpdate',
      json,
      () => RepositoryRuleUpdate(
        type: RepositoryRuleUpdateType.fromJson(json['type'] as String),
        parameters: RepositoryRuleUpdateParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleUpdate? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleUpdate.fromJson(json);
  }

  final RepositoryRuleUpdateType type;
  final RepositoryRuleUpdateParameters? parameters;

  /// Converts a [RepositoryRuleUpdate] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleUpdate &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_deletion}
/// deletion
/// Only allow users with bypass permissions to delete matching refs.
/// {@endtemplate}
@immutable
final class RepositoryRuleDeletion extends RepositoryRule {
  /// {@macro repository_rule_deletion}
  const RepositoryRuleDeletion({required this.type});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDeletion].
  factory RepositoryRuleDeletion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDeletion',
      json,
      () => RepositoryRuleDeletion(
        type: RepositoryRuleDeletionType.fromJson(json['type'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDeletion? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDeletion.fromJson(json);
  }

  final RepositoryRuleDeletionType type;

  /// Converts a [RepositoryRuleDeletion] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDeletion && type == other.type;
  }
}

/// {@template repository_rule_required_linear_history}
/// required_linear_history
/// Prevent merge commits from being pushed to matching refs.
/// {@endtemplate}
@immutable
final class RepositoryRuleRequiredLinearHistory extends RepositoryRule {
  /// {@macro repository_rule_required_linear_history}
  const RepositoryRuleRequiredLinearHistory({required this.type});

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleRequiredLinearHistory].
  factory RepositoryRuleRequiredLinearHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleRequiredLinearHistory',
      json,
      () => RepositoryRuleRequiredLinearHistory(
        type: RepositoryRuleRequiredLinearHistoryType.fromJson(
          json['type'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredLinearHistory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredLinearHistory.fromJson(json);
  }

  final RepositoryRuleRequiredLinearHistoryType type;

  /// Converts a [RepositoryRuleRequiredLinearHistory]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredLinearHistory && type == other.type;
  }
}

/// {@template repository_rule_merge_queue}
/// merge_queue
/// Merges must be performed via a merge queue.
/// {@endtemplate}
@immutable
final class RepositoryRuleMergeQueue extends RepositoryRule {
  /// {@macro repository_rule_merge_queue}
  const RepositoryRuleMergeQueue({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleMergeQueue].
  factory RepositoryRuleMergeQueue.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleMergeQueue',
      json,
      () => RepositoryRuleMergeQueue(
        type: RepositoryRuleMergeQueueType.fromJson(json['type'] as String),
        parameters: RepositoryRuleMergeQueueParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMergeQueue? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMergeQueue.fromJson(json);
  }

  final RepositoryRuleMergeQueueType type;
  final RepositoryRuleMergeQueueParameters? parameters;

  /// Converts a [RepositoryRuleMergeQueue] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMergeQueue &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_required_deployments}
/// required_deployments
/// Choose which environments must be successfully deployed to before refs can
/// be pushed into a ref that matches this rule.
/// {@endtemplate}
@immutable
final class RepositoryRuleRequiredDeployments extends RepositoryRule {
  /// {@macro repository_rule_required_deployments}
  const RepositoryRuleRequiredDeployments({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleRequiredDeployments].
  factory RepositoryRuleRequiredDeployments.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleRequiredDeployments',
      json,
      () => RepositoryRuleRequiredDeployments(
        type: RepositoryRuleRequiredDeploymentsType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleRequiredDeploymentsParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredDeployments? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredDeployments.fromJson(json);
  }

  final RepositoryRuleRequiredDeploymentsType type;
  final RepositoryRuleRequiredDeploymentsParameters? parameters;

  /// Converts a [RepositoryRuleRequiredDeployments]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredDeployments &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_required_signatures}
/// required_signatures
/// Commits pushed to matching refs must have verified signatures.
/// {@endtemplate}
@immutable
final class RepositoryRuleRequiredSignatures extends RepositoryRule {
  /// {@macro repository_rule_required_signatures}
  const RepositoryRuleRequiredSignatures({required this.type});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleRequiredSignatures].
  factory RepositoryRuleRequiredSignatures.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleRequiredSignatures',
      json,
      () => RepositoryRuleRequiredSignatures(
        type: RepositoryRuleRequiredSignaturesType.fromJson(
          json['type'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredSignatures? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredSignatures.fromJson(json);
  }

  final RepositoryRuleRequiredSignaturesType type;

  /// Converts a [RepositoryRuleRequiredSignatures] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredSignatures && type == other.type;
  }
}

/// {@template repository_rule_pull_request}
/// pull_request
/// Require all commits be made to a non-target branch and submitted via a pull
/// request before they can be merged.
/// {@endtemplate}
@immutable
final class RepositoryRulePullRequest extends RepositoryRule {
  /// {@macro repository_rule_pull_request}
  const RepositoryRulePullRequest({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRulePullRequest].
  factory RepositoryRulePullRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRulePullRequest',
      json,
      () => RepositoryRulePullRequest(
        type: RepositoryRulePullRequestType.fromJson(json['type'] as String),
        parameters: RepositoryRulePullRequestParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulePullRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulePullRequest.fromJson(json);
  }

  final RepositoryRulePullRequestType type;
  final RepositoryRulePullRequestParameters? parameters;

  /// Converts a [RepositoryRulePullRequest] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulePullRequest &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_required_status_checks}
/// required_status_checks
/// Choose which status checks must pass before the ref is updated. When
/// enabled, commits must first be pushed to another ref where the checks pass.
/// {@endtemplate}
@immutable
final class RepositoryRuleRequiredStatusChecks extends RepositoryRule {
  /// {@macro repository_rule_required_status_checks}
  const RepositoryRuleRequiredStatusChecks({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleRequiredStatusChecks].
  factory RepositoryRuleRequiredStatusChecks.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleRequiredStatusChecks',
      json,
      () => RepositoryRuleRequiredStatusChecks(
        type: RepositoryRuleRequiredStatusChecksType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleRequiredStatusChecksParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleRequiredStatusChecks? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleRequiredStatusChecks.fromJson(json);
  }

  final RepositoryRuleRequiredStatusChecksType type;
  final RepositoryRuleRequiredStatusChecksParameters? parameters;

  /// Converts a [RepositoryRuleRequiredStatusChecks]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleRequiredStatusChecks &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_non_fast_forward}
/// non_fast_forward
/// Prevent users with push access from force pushing to refs.
/// {@endtemplate}
@immutable
final class RepositoryRuleNonFastForward extends RepositoryRule {
  /// {@macro repository_rule_non_fast_forward}
  const RepositoryRuleNonFastForward({required this.type});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleNonFastForward].
  factory RepositoryRuleNonFastForward.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleNonFastForward',
      json,
      () => RepositoryRuleNonFastForward(
        type: RepositoryRuleNonFastForwardType.fromJson(json['type'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleNonFastForward? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleNonFastForward.fromJson(json);
  }

  final RepositoryRuleNonFastForwardType type;

  /// Converts a [RepositoryRuleNonFastForward] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson()};
  }

  @override
  int get hashCode => type.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleNonFastForward && type == other.type;
  }
}

/// {@template repository_rule_commit_message_pattern}
/// commit_message_pattern
/// Parameters to be used for the commit_message_pattern rule
/// {@endtemplate}
@immutable
final class RepositoryRuleCommitMessagePattern extends RepositoryRule {
  /// {@macro repository_rule_commit_message_pattern}
  const RepositoryRuleCommitMessagePattern({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCommitMessagePattern].
  factory RepositoryRuleCommitMessagePattern.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCommitMessagePattern',
      json,
      () => RepositoryRuleCommitMessagePattern(
        type: RepositoryRuleCommitMessagePatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleCommitMessagePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitMessagePattern? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitMessagePattern.fromJson(json);
  }

  final RepositoryRuleCommitMessagePatternType type;
  final RepositoryRuleCommitMessagePatternParameters? parameters;

  /// Converts a [RepositoryRuleCommitMessagePattern]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCommitMessagePattern &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_commit_author_email_pattern}
/// commit_author_email_pattern
/// Parameters to be used for the commit_author_email_pattern rule
/// {@endtemplate}
@immutable
final class RepositoryRuleCommitAuthorEmailPattern extends RepositoryRule {
  /// {@macro repository_rule_commit_author_email_pattern}
  const RepositoryRuleCommitAuthorEmailPattern({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCommitAuthorEmailPattern].
  factory RepositoryRuleCommitAuthorEmailPattern.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCommitAuthorEmailPattern',
      json,
      () => RepositoryRuleCommitAuthorEmailPattern(
        type: RepositoryRuleCommitAuthorEmailPatternType.fromJson(
          json['type'] as String,
        ),
        parameters:
            RepositoryRuleCommitAuthorEmailPatternParameters.maybeFromJson(
              json['parameters'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitAuthorEmailPattern? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitAuthorEmailPattern.fromJson(json);
  }

  final RepositoryRuleCommitAuthorEmailPatternType type;
  final RepositoryRuleCommitAuthorEmailPatternParameters? parameters;

  /// Converts a [RepositoryRuleCommitAuthorEmailPattern]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCommitAuthorEmailPattern &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_committer_email_pattern}
/// committer_email_pattern
/// Parameters to be used for the committer_email_pattern rule
/// {@endtemplate}
@immutable
final class RepositoryRuleCommitterEmailPattern extends RepositoryRule {
  /// {@macro repository_rule_committer_email_pattern}
  const RepositoryRuleCommitterEmailPattern({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleCommitterEmailPattern].
  factory RepositoryRuleCommitterEmailPattern.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleCommitterEmailPattern',
      json,
      () => RepositoryRuleCommitterEmailPattern(
        type: RepositoryRuleCommitterEmailPatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleCommitterEmailPatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCommitterEmailPattern? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCommitterEmailPattern.fromJson(json);
  }

  final RepositoryRuleCommitterEmailPatternType type;
  final RepositoryRuleCommitterEmailPatternParameters? parameters;

  /// Converts a [RepositoryRuleCommitterEmailPattern]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCommitterEmailPattern &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_branch_name_pattern}
/// branch_name_pattern
/// Parameters to be used for the branch_name_pattern rule
/// {@endtemplate}
@immutable
final class RepositoryRuleBranchNamePattern extends RepositoryRule {
  /// {@macro repository_rule_branch_name_pattern}
  const RepositoryRuleBranchNamePattern({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleBranchNamePattern].
  factory RepositoryRuleBranchNamePattern.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleBranchNamePattern',
      json,
      () => RepositoryRuleBranchNamePattern(
        type: RepositoryRuleBranchNamePatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleBranchNamePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleBranchNamePattern? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleBranchNamePattern.fromJson(json);
  }

  final RepositoryRuleBranchNamePatternType type;
  final RepositoryRuleBranchNamePatternParameters? parameters;

  /// Converts a [RepositoryRuleBranchNamePattern] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleBranchNamePattern &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_tag_name_pattern}
/// tag_name_pattern
/// Parameters to be used for the tag_name_pattern rule
/// {@endtemplate}
@immutable
final class RepositoryRuleTagNamePattern extends RepositoryRule {
  /// {@macro repository_rule_tag_name_pattern}
  const RepositoryRuleTagNamePattern({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleTagNamePattern].
  factory RepositoryRuleTagNamePattern.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleTagNamePattern',
      json,
      () => RepositoryRuleTagNamePattern(
        type: RepositoryRuleTagNamePatternType.fromJson(json['type'] as String),
        parameters: RepositoryRuleTagNamePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleTagNamePattern? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleTagNamePattern.fromJson(json);
  }

  final RepositoryRuleTagNamePatternType type;
  final RepositoryRuleTagNamePatternParameters? parameters;

  /// Converts a [RepositoryRuleTagNamePattern] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleTagNamePattern &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_file_path_restriction}
/// file_path_restriction
/// Prevent commits that include changes in specified file and folder paths from
/// being pushed to the commit graph. This includes absolute paths that contain
/// file names.
/// {@endtemplate}
@immutable
final class RepositoryRuleFilePathRestriction extends RepositoryRule {
  /// {@macro repository_rule_file_path_restriction}
  const RepositoryRuleFilePathRestriction({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleFilePathRestriction].
  factory RepositoryRuleFilePathRestriction.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleFilePathRestriction',
      json,
      () => RepositoryRuleFilePathRestriction(
        type: RepositoryRuleFilePathRestrictionType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleFilePathRestrictionParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleFilePathRestriction? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleFilePathRestriction.fromJson(json);
  }

  final RepositoryRuleFilePathRestrictionType type;
  final RepositoryRuleFilePathRestrictionParameters? parameters;

  /// Converts a [RepositoryRuleFilePathRestriction]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleFilePathRestriction &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_max_file_path_length}
/// max_file_path_length
/// Prevent commits that include file paths that exceed the specified character
/// limit from being pushed to the commit graph.
/// {@endtemplate}
@immutable
final class RepositoryRuleMaxFilePathLength extends RepositoryRule {
  /// {@macro repository_rule_max_file_path_length}
  const RepositoryRuleMaxFilePathLength({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleMaxFilePathLength].
  factory RepositoryRuleMaxFilePathLength.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleMaxFilePathLength',
      json,
      () => RepositoryRuleMaxFilePathLength(
        type: RepositoryRuleMaxFilePathLengthType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleMaxFilePathLengthParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMaxFilePathLength? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMaxFilePathLength.fromJson(json);
  }

  final RepositoryRuleMaxFilePathLengthType type;
  final RepositoryRuleMaxFilePathLengthParameters? parameters;

  /// Converts a [RepositoryRuleMaxFilePathLength] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMaxFilePathLength &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_file_extension_restriction}
/// file_extension_restriction
/// Prevent commits that include files with specified file extensions from being
/// pushed to the commit graph.
/// {@endtemplate}
@immutable
final class RepositoryRuleFileExtensionRestriction extends RepositoryRule {
  /// {@macro repository_rule_file_extension_restriction}
  const RepositoryRuleFileExtensionRestriction({
    required this.type,
    this.parameters,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleFileExtensionRestriction].
  factory RepositoryRuleFileExtensionRestriction.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleFileExtensionRestriction',
      json,
      () => RepositoryRuleFileExtensionRestriction(
        type: RepositoryRuleFileExtensionRestrictionType.fromJson(
          json['type'] as String,
        ),
        parameters:
            RepositoryRuleFileExtensionRestrictionParameters.maybeFromJson(
              json['parameters'] as Map<String, dynamic>?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleFileExtensionRestriction? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleFileExtensionRestriction.fromJson(json);
  }

  final RepositoryRuleFileExtensionRestrictionType type;
  final RepositoryRuleFileExtensionRestrictionParameters? parameters;

  /// Converts a [RepositoryRuleFileExtensionRestriction]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleFileExtensionRestriction &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_max_file_size}
/// max_file_size
/// Prevent commits with individual files that exceed the specified limit from
/// being pushed to the commit graph.
/// {@endtemplate}
@immutable
final class RepositoryRuleMaxFileSize extends RepositoryRule {
  /// {@macro repository_rule_max_file_size}
  const RepositoryRuleMaxFileSize({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleMaxFileSize].
  factory RepositoryRuleMaxFileSize.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleMaxFileSize',
      json,
      () => RepositoryRuleMaxFileSize(
        type: RepositoryRuleMaxFileSizeType.fromJson(json['type'] as String),
        parameters: RepositoryRuleMaxFileSizeParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMaxFileSize? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMaxFileSize.fromJson(json);
  }

  final RepositoryRuleMaxFileSizeType type;
  final RepositoryRuleMaxFileSizeParameters? parameters;

  /// Converts a [RepositoryRuleMaxFileSize] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMaxFileSize &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_workflows}
/// workflows
/// Require all changes made to a targeted branch to pass the specified
/// workflows before they can be merged.
/// {@endtemplate}
@immutable
final class RepositoryRuleWorkflows extends RepositoryRule {
  /// {@macro repository_rule_workflows}
  const RepositoryRuleWorkflows({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleWorkflows].
  factory RepositoryRuleWorkflows.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleWorkflows',
      json,
      () => RepositoryRuleWorkflows(
        type: RepositoryRuleWorkflowsType.fromJson(json['type'] as String),
        parameters: RepositoryRuleWorkflowsParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleWorkflows? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleWorkflows.fromJson(json);
  }

  final RepositoryRuleWorkflowsType type;
  final RepositoryRuleWorkflowsParameters? parameters;

  /// Converts a [RepositoryRuleWorkflows] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleWorkflows &&
        type == other.type &&
        parameters == other.parameters;
  }
}

/// {@template repository_rule_code_scanning}
/// code_scanning
/// Choose which tools must provide code scanning results before the reference
/// is updated. When configured, code scanning must be enabled and have results
/// for both the commit and the reference being updated.
/// {@endtemplate}
@immutable
final class RepositoryRuleCodeScanning extends RepositoryRule {
  /// {@macro repository_rule_code_scanning}
  const RepositoryRuleCodeScanning({required this.type, this.parameters});

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleCodeScanning].
  factory RepositoryRuleCodeScanning.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleCodeScanning',
      json,
      () => RepositoryRuleCodeScanning(
        type: RepositoryRuleCodeScanningType.fromJson(json['type'] as String),
        parameters: RepositoryRuleCodeScanningParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleCodeScanning? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleCodeScanning.fromJson(json);
  }

  final RepositoryRuleCodeScanningType type;
  final RepositoryRuleCodeScanningParameters? parameters;

  /// Converts a [RepositoryRuleCodeScanning] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'parameters': ?parameters?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([type, parameters]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleCodeScanning &&
        type == other.type &&
        parameters == other.parameters;
  }
}
