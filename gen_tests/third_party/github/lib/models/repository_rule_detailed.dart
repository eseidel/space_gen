import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_branch_name_pattern_parameters.dart';
import 'package:github/models/repository_rule_code_scanning_parameters.dart';
import 'package:github/models/repository_rule_commit_author_email_pattern_parameters.dart';
import 'package:github/models/repository_rule_commit_message_pattern_parameters.dart';
import 'package:github/models/repository_rule_committer_email_pattern_parameters.dart';
import 'package:github/models/repository_rule_file_extension_restriction_parameters.dart';
import 'package:github/models/repository_rule_file_path_restriction_parameters.dart';
import 'package:github/models/repository_rule_max_file_path_length_parameters.dart';
import 'package:github/models/repository_rule_max_file_size_parameters.dart';
import 'package:github/models/repository_rule_merge_queue_parameters.dart';
import 'package:github/models/repository_rule_pull_request_parameters.dart';
import 'package:github/models/repository_rule_required_deployments_parameters.dart';
import 'package:github/models/repository_rule_required_status_checks_parameters.dart';
import 'package:github/models/repository_rule_ruleset_info_ruleset_source_type.dart';
import 'package:github/models/repository_rule_tag_name_pattern_parameters.dart';
import 'package:github/models/repository_rule_update_parameters.dart';
import 'package:github/models/repository_rule_workflows_parameters.dart';
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

  String get type => 'creation';

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
      'type': type,
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf0 &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf1 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf1({
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

  String get type => 'update';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf1 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf2 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf2({
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

  String get type => 'deletion';

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
      'type': type,
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf2 &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf3 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf3({
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

  String get type => 'required_linear_history';

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
      'type': type,
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf3 &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf4 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf4({
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

  String get type => 'merge_queue';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf4 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf5 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf5({
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

  String get type => 'required_deployments';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf5 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf6 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf6({
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

  String get type => 'required_signatures';

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
      'type': type,
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf6 &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf7 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf7({
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

  String get type => 'pull_request';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf7 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf8 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf8({
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

  String get type => 'required_status_checks';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf8 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf9 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf9({
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

  String get type => 'non_fast_forward';

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
      'type': type,
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf9 &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf10 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf10({
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

  String get type => 'commit_message_pattern';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf10 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf11 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf11({
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

  String get type => 'commit_author_email_pattern';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf11 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf12 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf12({
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

  String get type => 'committer_email_pattern';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf12 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf13 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf13({
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

  String get type => 'branch_name_pattern';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf13 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf14 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf14({
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

  String get type => 'tag_name_pattern';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf14 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf15 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf15({
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

  String get type => 'file_path_restriction';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf15 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf16 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf16({
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

  String get type => 'max_file_path_length';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf16 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf17 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf17({
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

  String get type => 'file_extension_restriction';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf17 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf18 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf18({
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

  String get type => 'max_file_size';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf18 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf19 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf19({
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

  String get type => 'workflows';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf19 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}

@immutable
final class RepositoryRuleDetailedOneOf20 extends RepositoryRuleDetailed {
  const RepositoryRuleDetailedOneOf20({
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

  String get type => 'code_scanning';
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
      'type': type,
      'parameters': ?parameters?.toJson(),
      'ruleset_source_type': ?rulesetSourceType?.toJson(),
      'ruleset_source': ?rulesetSource,
      'ruleset_id': ?rulesetId,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([parameters, rulesetSourceType, rulesetSource, rulesetId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleDetailedOneOf20 &&
        parameters == other.parameters &&
        rulesetSourceType == other.rulesetSourceType &&
        rulesetSource == other.rulesetSource &&
        rulesetId == other.rulesetId;
  }
}
