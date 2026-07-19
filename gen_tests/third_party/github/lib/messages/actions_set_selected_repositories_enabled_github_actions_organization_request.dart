// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest {
  const ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest({
    required this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest].
  factory ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest',
      json,
      () =>
          ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest(
            selectedRepositoryIds: (json['selected_repository_ids'] as List)
                .cast<int>(),
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest.fromJson(
      json,
    );
  }

  /// List of repository IDs to enable for GitHub Actions.
  final List<int> selectedRepositoryIds;

  /// Converts an [ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_repository_ids': selectedRepositoryIds};
  }

  @override
  int get hashCode => listHash(selectedRepositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
