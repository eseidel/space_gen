// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsSetSelectedReposForOrgSecretRequest {
  const ActionsSetSelectedReposForOrgSecretRequest({
    required this.selectedRepositoryIds,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsSetSelectedReposForOrgSecretRequest].
  factory ActionsSetSelectedReposForOrgSecretRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsSetSelectedReposForOrgSecretRequest',
      json,
      () => ActionsSetSelectedReposForOrgSecretRequest(
        selectedRepositoryIds: (json['selected_repository_ids'] as List)
            .cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsSetSelectedReposForOrgSecretRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsSetSelectedReposForOrgSecretRequest.fromJson(json);
  }

  /// An array of repository ids that can access the organization secret. You
  /// can only provide a list of repository ids when the `visibility` is set
  /// to `selected`. You can add and remove individual repositories using the
  /// [Add selected repository to an organization
  /// secret](https://docs.github.com/rest/actions/secrets#add-selected-repository-to-an-organization-secret)
  /// and [Remove selected repository from an organization
  /// secret](https://docs.github.com/rest/actions/secrets#remove-selected-repository-from-an-organization-secret)
  /// endpoints.
  final List<int> selectedRepositoryIds;

  /// Converts an [ActionsSetSelectedReposForOrgSecretRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_repository_ids': selectedRepositoryIds};
  }

  @override
  int get hashCode => listHash(selectedRepositoryIds).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsSetSelectedReposForOrgSecretRequest &&
        listsEqual(selectedRepositoryIds, other.selectedRepositoryIds);
  }
}
