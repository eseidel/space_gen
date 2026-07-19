// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_ruleset_conditions_ref_name.dart';
import 'package:github/models/repository_ruleset_conditions_repository_id_target_repository_id.dart';
import 'package:github/models/repository_ruleset_conditions_repository_name_target_repository_name.dart';
import 'package:github/models/repository_ruleset_conditions_repository_property_target_repository_property.dart';
import 'package:meta/meta.dart';

/// Organization ruleset conditions
/// Conditions for an organization ruleset.
/// The branch and tag rulesets conditions object should contain both
/// `repository_name` and `ref_name` properties, or both `repository_id` and
/// `ref_name` properties, or both `repository_property` and `ref_name`
/// properties.
/// The push rulesets conditions object does not require the `ref_name`
/// property.
/// For repository policy rulesets, the conditions object should only contain
/// the `repository_name`, the `repository_id`, or the `repository_property`.
sealed class OrgRulesetConditions {
  const OrgRulesetConditions();

  factory OrgRulesetConditions.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('repository_name')) {
      return RepositoryNameAndRefName.fromJson(json);
    }
    if (json.containsKey('repository_id')) {
      return RepositoryIdAndRefName.fromJson(json);
    }
    if (json.containsKey('repository_property')) {
      return RepositoryPropertyAndRefName.fromJson(json);
    }
    throw FormatException(
      'No variant of OrgRulesetConditions matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgRulesetConditions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgRulesetConditions.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

/// {@template org_ruleset_conditions_one_of_0}
/// repository_name_and_ref_name
/// Conditions to target repositories by name and refs by name
/// {@endtemplate}
@immutable
final class RepositoryNameAndRefName extends OrgRulesetConditions {
  /// {@macro org_ruleset_conditions_one_of_0}
  const RepositoryNameAndRefName({required this.repositoryName, this.refName});

  /// Converts a `Map<String, dynamic>` to a [RepositoryNameAndRefName].
  factory RepositoryNameAndRefName.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryNameAndRefName',
      json,
      () => RepositoryNameAndRefName(
        refName: RepositoryRulesetConditionsRefName.maybeFromJson(
          json['ref_name'] as Map<String, dynamic>?,
        ),
        repositoryName:
            RepositoryRulesetConditionsRepositoryNameTargetRepositoryName.fromJson(
              json['repository_name'] as Map<String, dynamic>,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryNameAndRefName? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryNameAndRefName.fromJson(json);
  }

  final RepositoryRulesetConditionsRefName? refName;
  final RepositoryRulesetConditionsRepositoryNameTargetRepositoryName
  repositoryName;

  /// Converts a [RepositoryNameAndRefName] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      if (refName != null) 'ref_name': refName?.toJson(),
      'repository_name': repositoryName.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([refName, repositoryName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryNameAndRefName &&
        refName == other.refName &&
        repositoryName == other.repositoryName;
  }
}

/// {@template org_ruleset_conditions_one_of_1}
/// repository_id_and_ref_name
/// Conditions to target repositories by id and refs by name
/// {@endtemplate}
@immutable
final class RepositoryIdAndRefName extends OrgRulesetConditions {
  /// {@macro org_ruleset_conditions_one_of_1}
  const RepositoryIdAndRefName({required this.repositoryId, this.refName});

  /// Converts a `Map<String, dynamic>` to a [RepositoryIdAndRefName].
  factory RepositoryIdAndRefName.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryIdAndRefName',
      json,
      () => RepositoryIdAndRefName(
        refName: RepositoryRulesetConditionsRefName.maybeFromJson(
          json['ref_name'] as Map<String, dynamic>?,
        ),
        repositoryId:
            RepositoryRulesetConditionsRepositoryIdTargetRepositoryId.fromJson(
              json['repository_id'] as Map<String, dynamic>,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryIdAndRefName? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryIdAndRefName.fromJson(json);
  }

  final RepositoryRulesetConditionsRefName? refName;
  final RepositoryRulesetConditionsRepositoryIdTargetRepositoryId repositoryId;

  /// Converts a [RepositoryIdAndRefName] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      if (refName != null) 'ref_name': refName?.toJson(),
      'repository_id': repositoryId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([refName, repositoryId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryIdAndRefName &&
        refName == other.refName &&
        repositoryId == other.repositoryId;
  }
}

/// {@template org_ruleset_conditions_one_of_2}
/// repository_property_and_ref_name
/// Conditions to target repositories by property and refs by name
/// {@endtemplate}
@immutable
final class RepositoryPropertyAndRefName extends OrgRulesetConditions {
  /// {@macro org_ruleset_conditions_one_of_2}
  const RepositoryPropertyAndRefName({
    required this.repositoryProperty,
    this.refName,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryPropertyAndRefName].
  factory RepositoryPropertyAndRefName.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryPropertyAndRefName',
      json,
      () => RepositoryPropertyAndRefName(
        refName: RepositoryRulesetConditionsRefName.maybeFromJson(
          json['ref_name'] as Map<String, dynamic>?,
        ),
        repositoryProperty:
            RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty.fromJson(
              json['repository_property'] as Map<String, dynamic>,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryPropertyAndRefName? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryPropertyAndRefName.fromJson(json);
  }

  final RepositoryRulesetConditionsRefName? refName;
  final RepositoryRulesetConditionsRepositoryPropertyTargetRepositoryProperty
  repositoryProperty;

  /// Converts a [RepositoryPropertyAndRefName] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      if (refName != null) 'ref_name': refName?.toJson(),
      'repository_property': repositoryProperty.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([refName, repositoryProperty]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryPropertyAndRefName &&
        refName == other.refName &&
        repositoryProperty == other.repositoryProperty;
  }
}
