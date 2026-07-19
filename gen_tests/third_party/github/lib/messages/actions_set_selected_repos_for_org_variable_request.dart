import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetSelectedReposForOrgVariableRequest {
  const ActionsSetSelectedReposForOrgVariableRequest({
    required this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetSelectedReposForOrgVariableRequest].
  factory ActionsSetSelectedReposForOrgVariableRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetSelectedReposForOrgVariableRequest',
      json,
      () => ActionsSetSelectedReposForOrgVariableRequest(
        selectedRepositoryIds: (json['selected_repository_ids'] as List)
            .cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetSelectedReposForOrgVariableRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetSelectedReposForOrgVariableRequest.fromJson(json);
  }

  /// The IDs of the repositories that can access the organization variable.
  final List<int> selectedRepositoryIds;

  /// Converts an [ActionsSetSelectedReposForOrgVariableRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_repository_ids': selectedRepositoryIds};
  }

  @override
  int get hashCode => listHash(selectedRepositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetSelectedReposForOrgVariableRequest &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
