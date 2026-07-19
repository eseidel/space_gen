import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest {
  const ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest({
    required this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest].
  factory ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest',
      json,
      () => ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest(
        selectedRepositoryIds: (json['selected_repository_ids'] as List)
            .cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest.fromJson(
      json,
    );
  }

  /// List of repository IDs that can access the runner group.
  final List<int> selectedRepositoryIds;

  /// Converts an [ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_repository_ids': selectedRepositoryIds};
  }

  @override
  int get hashCode => listHash(selectedRepositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
