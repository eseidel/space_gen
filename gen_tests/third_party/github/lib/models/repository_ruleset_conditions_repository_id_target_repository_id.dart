import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetConditionsRepositoryIdTargetRepositoryId {
  const RepositoryRulesetConditionsRepositoryIdTargetRepositoryId({
    this.repositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulesetConditionsRepositoryIdTargetRepositoryId].
  factory RepositoryRulesetConditionsRepositoryIdTargetRepositoryId.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulesetConditionsRepositoryIdTargetRepositoryId',
      json,
      () => RepositoryRulesetConditionsRepositoryIdTargetRepositoryId(
        repositoryIds: (json['repository_ids'] as List?)?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditionsRepositoryIdTargetRepositoryId?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditionsRepositoryIdTargetRepositoryId.fromJson(
      json,
    );
  }

  /// The repository IDs that the ruleset applies to. One of these IDs must
  /// match for the condition to pass.
  final List<int>? repositoryIds;

  /// Converts a [RepositoryRulesetConditionsRepositoryIdTargetRepositoryId]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'repository_ids': ?repositoryIds};
  }

  @override
  int get hashCode => listHash(repositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetConditionsRepositoryIdTargetRepositoryId &&
        listsEqual(repositoryIds, other.repositoryIds);
  }
}
