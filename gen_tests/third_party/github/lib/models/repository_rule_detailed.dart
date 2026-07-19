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
import 'package:github/models/repository_rule_ruleset_info_ruleset_source_type.dart';
import 'package:github/models/repository_rule_tag_name_pattern_parameters.dart';
import 'package:github/models/repository_rule_tag_name_pattern_type.dart';
import 'package:github/models/repository_rule_update_parameters.dart';
import 'package:github/models/repository_rule_update_type.dart';
import 'package:github/models/repository_rule_workflows_parameters.dart';
import 'package:github/models/repository_rule_workflows_type.dart';
import 'package:meta/meta.dart';

/// Repository Rule
/// A repository rule with ruleset details.
sealed class RepositoryRuleDetailed {
  const RepositoryRuleDetailed();

  factory RepositoryRuleDetailed.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      'creation' => RepositoryRuleDetailedOneOf0.fromJson(json),
      'update' => RepositoryRuleDetailedOneOf1.fromJson(json),
      'deletion' => RepositoryRuleDetailedOneOf2.fromJson(json),
      'required_linear_history' => RepositoryRuleDetailedOneOf3.fromJson(json),
      'merge_queue' => RepositoryRuleDetailedOneOf4.fromJson(json),
      'required_deployments' => RepositoryRuleDetailedOneOf5.fromJson(json),
      'required_signatures' => RepositoryRuleDetailedOneOf6.fromJson(json),
      'pull_request' => RepositoryRuleDetailedOneOf7.fromJson(json),
      'required_status_checks' => RepositoryRuleDetailedOneOf8.fromJson(json),
      'non_fast_forward' => RepositoryRuleDetailedOneOf9.fromJson(json),
      'commit_message_pattern' => RepositoryRuleDetailedOneOf10.fromJson(json),
      'commit_author_email_pattern' => RepositoryRuleDetailedOneOf11.fromJson(
        json,
      ),
      'committer_email_pattern' => RepositoryRuleDetailedOneOf12.fromJson(json),
      'branch_name_pattern' => RepositoryRuleDetailedOneOf13.fromJson(json),
      'tag_name_pattern' => RepositoryRuleDetailedOneOf14.fromJson(json),
      'file_path_restriction' => RepositoryRuleDetailedOneOf15.fromJson(json),
      'max_file_path_length' => RepositoryRuleDetailedOneOf16.fromJson(json),
      'file_extension_restriction' => RepositoryRuleDetailedOneOf17.fromJson(
        json,
      ),
      'max_file_size' => RepositoryRuleDetailedOneOf18.fromJson(json),
      'workflows' => RepositoryRuleDetailedOneOf19.fromJson(json),
      'code_scanning' => RepositoryRuleDetailedOneOf20.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for RepositoryRuleDetailed",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailed? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailed.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class RepositoryRuleDetailedOneOf0 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf0({
    required this.type,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf0].
  factory RepositoryRuleDetailedOneOf0.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf0',
      json,
      () => RepositoryRuleDetailedOneOf0(
        type: RepositoryRuleCreationType.fromJson(json['type'] as String),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf0.fromJson(json);
  }

  final RepositoryRuleCreationType type;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf0] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([type, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf0 &&
        type == other.type &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf1 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf1({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf1].
  factory RepositoryRuleDetailedOneOf1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf1',
      json,
      () => RepositoryRuleDetailedOneOf1(
        type: RepositoryRuleUpdateType.fromJson(json['type'] as String),
        parameters: RepositoryRuleUpdateParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf1.fromJson(json);
  }

  final RepositoryRuleUpdateType type;
  final RepositoryRuleUpdateParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf1] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf1 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf2 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf2({
    required this.type,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf2].
  factory RepositoryRuleDetailedOneOf2.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf2',
      json,
      () => RepositoryRuleDetailedOneOf2(
        type: RepositoryRuleDeletionType.fromJson(json['type'] as String),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf2? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf2.fromJson(json);
  }

  final RepositoryRuleDeletionType type;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf2] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([type, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf2 &&
        type == other.type &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf3 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf3({
    required this.type,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf3].
  factory RepositoryRuleDetailedOneOf3.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf3',
      json,
      () => RepositoryRuleDetailedOneOf3(
        type: RepositoryRuleRequiredLinearHistoryType.fromJson(
          json['type'] as String,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf3? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf3.fromJson(json);
  }

  final RepositoryRuleRequiredLinearHistoryType type;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf3] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([type, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf3 &&
        type == other.type &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf4 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf4({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf4].
  factory RepositoryRuleDetailedOneOf4.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf4',
      json,
      () => RepositoryRuleDetailedOneOf4(
        type: RepositoryRuleMergeQueueType.fromJson(json['type'] as String),
        parameters: RepositoryRuleMergeQueueParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf4? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf4.fromJson(json);
  }

  final RepositoryRuleMergeQueueType type;
  final RepositoryRuleMergeQueueParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf4] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf4 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf5 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf5({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf5].
  factory RepositoryRuleDetailedOneOf5.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf5',
      json,
      () => RepositoryRuleDetailedOneOf5(
        type: RepositoryRuleRequiredDeploymentsType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleRequiredDeploymentsParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf5? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf5.fromJson(json);
  }

  final RepositoryRuleRequiredDeploymentsType type;
  final RepositoryRuleRequiredDeploymentsParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf5] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf5 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf6 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf6({
    required this.type,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf6].
  factory RepositoryRuleDetailedOneOf6.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf6',
      json,
      () => RepositoryRuleDetailedOneOf6(
        type: RepositoryRuleRequiredSignaturesType.fromJson(
          json['type'] as String,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf6? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf6.fromJson(json);
  }

  final RepositoryRuleRequiredSignaturesType type;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf6] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([type, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf6 &&
        type == other.type &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf7 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf7({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf7].
  factory RepositoryRuleDetailedOneOf7.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf7',
      json,
      () => RepositoryRuleDetailedOneOf7(
        type: RepositoryRulePullRequestType.fromJson(json['type'] as String),
        parameters: RepositoryRulePullRequestParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf7? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf7.fromJson(json);
  }

  final RepositoryRulePullRequestType type;
  final RepositoryRulePullRequestParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf7] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf7 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf8 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf8({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf8].
  factory RepositoryRuleDetailedOneOf8.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf8',
      json,
      () => RepositoryRuleDetailedOneOf8(
        type: RepositoryRuleRequiredStatusChecksType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleRequiredStatusChecksParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf8? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf8.fromJson(json);
  }

  final RepositoryRuleRequiredStatusChecksType type;
  final RepositoryRuleRequiredStatusChecksParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf8] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf8 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf9 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf9({
    required this.type,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf9].
  factory RepositoryRuleDetailedOneOf9.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf9',
      json,
      () => RepositoryRuleDetailedOneOf9(
        type: RepositoryRuleNonFastForwardType.fromJson(json['type'] as String),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf9? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf9.fromJson(json);
  }

  final RepositoryRuleNonFastForwardType type;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf9] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([type, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf9 &&
        type == other.type &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf10 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf10({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf10].
  factory RepositoryRuleDetailedOneOf10.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf10',
      json,
      () => RepositoryRuleDetailedOneOf10(
        type: RepositoryRuleCommitMessagePatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleCommitMessagePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf10? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf10.fromJson(json);
  }

  final RepositoryRuleCommitMessagePatternType type;
  final RepositoryRuleCommitMessagePatternParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf10] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf10 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf11 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf11({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf11].
  factory RepositoryRuleDetailedOneOf11.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf11',
      json,
      () => RepositoryRuleDetailedOneOf11(
        type: RepositoryRuleCommitAuthorEmailPatternType.fromJson(
          json['type'] as String,
        ),
        parameters:
            RepositoryRuleCommitAuthorEmailPatternParameters.maybeFromJson(
              json['parameters'] as Map<String, dynamic>?,
            ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf11? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf11.fromJson(json);
  }

  final RepositoryRuleCommitAuthorEmailPatternType type;
  final RepositoryRuleCommitAuthorEmailPatternParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf11] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf11 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf12 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf12({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf12].
  factory RepositoryRuleDetailedOneOf12.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf12',
      json,
      () => RepositoryRuleDetailedOneOf12(
        type: RepositoryRuleCommitterEmailPatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleCommitterEmailPatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf12? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf12.fromJson(json);
  }

  final RepositoryRuleCommitterEmailPatternType type;
  final RepositoryRuleCommitterEmailPatternParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf12] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf12 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf13 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf13({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf13].
  factory RepositoryRuleDetailedOneOf13.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf13',
      json,
      () => RepositoryRuleDetailedOneOf13(
        type: RepositoryRuleBranchNamePatternType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleBranchNamePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf13? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf13.fromJson(json);
  }

  final RepositoryRuleBranchNamePatternType type;
  final RepositoryRuleBranchNamePatternParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf13] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf13 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf14 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf14({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf14].
  factory RepositoryRuleDetailedOneOf14.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf14',
      json,
      () => RepositoryRuleDetailedOneOf14(
        type: RepositoryRuleTagNamePatternType.fromJson(json['type'] as String),
        parameters: RepositoryRuleTagNamePatternParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf14? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf14.fromJson(json);
  }

  final RepositoryRuleTagNamePatternType type;
  final RepositoryRuleTagNamePatternParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf14] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf14 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf15 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf15({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf15].
  factory RepositoryRuleDetailedOneOf15.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf15',
      json,
      () => RepositoryRuleDetailedOneOf15(
        type: RepositoryRuleFilePathRestrictionType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleFilePathRestrictionParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf15? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf15.fromJson(json);
  }

  final RepositoryRuleFilePathRestrictionType type;
  final RepositoryRuleFilePathRestrictionParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf15] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf15 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf16 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf16({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf16].
  factory RepositoryRuleDetailedOneOf16.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf16',
      json,
      () => RepositoryRuleDetailedOneOf16(
        type: RepositoryRuleMaxFilePathLengthType.fromJson(
          json['type'] as String,
        ),
        parameters: RepositoryRuleMaxFilePathLengthParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf16? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf16.fromJson(json);
  }

  final RepositoryRuleMaxFilePathLengthType type;
  final RepositoryRuleMaxFilePathLengthParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf16] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf16 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf17 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf17({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf17].
  factory RepositoryRuleDetailedOneOf17.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf17',
      json,
      () => RepositoryRuleDetailedOneOf17(
        type: RepositoryRuleFileExtensionRestrictionType.fromJson(
          json['type'] as String,
        ),
        parameters:
            RepositoryRuleFileExtensionRestrictionParameters.maybeFromJson(
              json['parameters'] as Map<String, dynamic>?,
            ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf17? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf17.fromJson(json);
  }

  final RepositoryRuleFileExtensionRestrictionType type;
  final RepositoryRuleFileExtensionRestrictionParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf17] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf17 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf18 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf18({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf18].
  factory RepositoryRuleDetailedOneOf18.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf18',
      json,
      () => RepositoryRuleDetailedOneOf18(
        type: RepositoryRuleMaxFileSizeType.fromJson(json['type'] as String),
        parameters: RepositoryRuleMaxFileSizeParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf18? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf18.fromJson(json);
  }

  final RepositoryRuleMaxFileSizeType type;
  final RepositoryRuleMaxFileSizeParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf18] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf18 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf19 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf19({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf19].
  factory RepositoryRuleDetailedOneOf19.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf19',
      json,
      () => RepositoryRuleDetailedOneOf19(
        type: RepositoryRuleWorkflowsType.fromJson(json['type'] as String),
        parameters: RepositoryRuleWorkflowsParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf19? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf19.fromJson(json);
  }

  final RepositoryRuleWorkflowsType type;
  final RepositoryRuleWorkflowsParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf19] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf19 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf20 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf20({
    required this.type,
    this.parameters,
    this.rulesetSourceType,
    this.rulesetSource,
    this.rulesetId,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleDetailedOneOf20].
  factory RepositoryRuleDetailedOneOf20.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleDetailedOneOf20',
      json,
      () => RepositoryRuleDetailedOneOf20(
        type: RepositoryRuleCodeScanningType.fromJson(json['type'] as String),
        parameters: RepositoryRuleCodeScanningParameters.maybeFromJson(
          json['parameters'] as Map<String, dynamic>?,
        ),
        rulesetSourceType:
            RepositoryRuleRulesetInfoRulesetSourceType.maybeFromJson(
              json['ruleset_source_type'] as String?,
            ),
        rulesetSource: json['ruleset_source'] as String?,
        rulesetId: json['ruleset_id'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleDetailedOneOf20? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleDetailedOneOf20.fromJson(json);
  }

  final RepositoryRuleCodeScanningType type;
  final RepositoryRuleCodeScanningParameters? parameters;

  /// The type of source for the ruleset that includes this rule.
  final RepositoryRuleRulesetInfoRulesetSourceType? rulesetSourceType;

  /// The name of the source of the ruleset that includes this rule.
  final String? rulesetSource;

  /// The ID of the ruleset that includes this rule.
  final int? rulesetId;

  /// Converts a [RepositoryRuleDetailedOneOf20] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    type,
    parameters,
    rulesetSourceType,
    rulesetSource,
    rulesetId,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf20 &&
        type == other.type &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}
