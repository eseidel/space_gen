import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/repository_rule_merge_queue_parameters_grouping_strategy.dart';
import 'package:github/models/repository_rule_merge_queue_parameters_merge_method.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleMergeQueueParameters {
  RepositoryRuleMergeQueueParameters({
    required this.checkResponseTimeoutMinutes,
    required this.groupingStrategy,
    required this.maxEntriesToBuild,
    required this.maxEntriesToMerge,
    required this.mergeMethod,
    required this.minEntriesToMerge,
    required this.minEntriesToMergeWaitMinutes,
  }) {
    checkResponseTimeoutMinutes.validate(min: 1, max: 360);
    maxEntriesToBuild.validate(min: 0, max: 100);
    maxEntriesToMerge.validate(min: 0, max: 100);
    minEntriesToMerge.validate(min: 0, max: 100);
    minEntriesToMergeWaitMinutes.validate(min: 0, max: 360);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleMergeQueueParameters].
  factory RepositoryRuleMergeQueueParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleMergeQueueParameters',
      json,
      () => RepositoryRuleMergeQueueParameters(
        checkResponseTimeoutMinutes:
            json['check_response_timeout_minutes'] as int,
        groupingStrategy:
            RepositoryRuleMergeQueueParametersGroupingStrategy.fromJson(
              json['grouping_strategy'] as String,
            ),
        maxEntriesToBuild: json['max_entries_to_build'] as int,
        maxEntriesToMerge: json['max_entries_to_merge'] as int,
        mergeMethod: RepositoryRuleMergeQueueParametersMergeMethod.fromJson(
          json['merge_method'] as String,
        ),
        minEntriesToMerge: json['min_entries_to_merge'] as int,
        minEntriesToMergeWaitMinutes:
            json['min_entries_to_merge_wait_minutes'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleMergeQueueParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleMergeQueueParameters.fromJson(json);
  }

  /// Maximum time for a required status check to report a conclusion. After
  /// this much time has elapsed, checks that have not reported a conclusion
  /// will be assumed to have failed
  final int checkResponseTimeoutMinutes;

  /// When set to ALLGREEN, the merge commit created by merge queue for each
  /// PR in the group must pass all required checks to merge. When set to
  /// HEADGREEN, only the commit at the head of the merge group, i.e. the
  /// commit containing changes from all of the PRs in the group, must pass
  /// its required checks to merge.
  final RepositoryRuleMergeQueueParametersGroupingStrategy groupingStrategy;

  /// Limit the number of queued pull requests requesting checks and workflow
  /// runs at the same time.
  final int maxEntriesToBuild;

  /// The maximum number of PRs that will be merged together in a group.
  final int maxEntriesToMerge;

  /// Method to use when merging changes from queued pull requests.
  final RepositoryRuleMergeQueueParametersMergeMethod mergeMethod;

  /// The minimum number of PRs that will be merged together in a group.
  final int minEntriesToMerge;

  /// The time merge queue should wait after the first PR is added to the
  /// queue for the minimum group size to be met. After this time has elapsed,
  /// the minimum group size will be ignored and a smaller group will be
  /// merged.
  final int minEntriesToMergeWaitMinutes;

  /// Converts a [RepositoryRuleMergeQueueParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'check_response_timeout_minutes': checkResponseTimeoutMinutes,
      'grouping_strategy': groupingStrategy.toJson(),
      'max_entries_to_build': maxEntriesToBuild,
      'max_entries_to_merge': maxEntriesToMerge,
      'merge_method': mergeMethod.toJson(),
      'min_entries_to_merge': minEntriesToMerge,
      'min_entries_to_merge_wait_minutes': minEntriesToMergeWaitMinutes,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    checkResponseTimeoutMinutes,
    groupingStrategy,
    maxEntriesToBuild,
    maxEntriesToMerge,
    mergeMethod,
    minEntriesToMerge,
    minEntriesToMergeWaitMinutes,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleMergeQueueParameters &&
        checkResponseTimeoutMinutes == other.checkResponseTimeoutMinutes &&
        groupingStrategy == other.groupingStrategy &&
        maxEntriesToBuild == other.maxEntriesToBuild &&
        maxEntriesToMerge == other.maxEntriesToMerge &&
        mergeMethod == other.mergeMethod &&
        minEntriesToMerge == other.minEntriesToMerge &&
        minEntriesToMergeWaitMinutes == other.minEntriesToMergeWaitMinutes;
  }
}
