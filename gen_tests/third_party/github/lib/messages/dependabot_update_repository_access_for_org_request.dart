import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// Example:
/// ```json
/// {
///   "repository_ids_to_add": [
///     123,
///     456
///   ],
///   "repository_ids_to_remove": [
///     789
///   ]
/// }
/// ```
@immutable
class DependabotUpdateRepositoryAccessForOrgRequest {
  const DependabotUpdateRepositoryAccessForOrgRequest({
    this.repositoryIdsToAdd,
    this.repositoryIdsToRemove,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [DependabotUpdateRepositoryAccessForOrgRequest].
  factory DependabotUpdateRepositoryAccessForOrgRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'DependabotUpdateRepositoryAccessForOrgRequest',
      json,
      () => DependabotUpdateRepositoryAccessForOrgRequest(
        repositoryIdsToAdd: (json['repository_ids_to_add'] as List?)
            ?.cast<int>(),
        repositoryIdsToRemove: (json['repository_ids_to_remove'] as List?)
            ?.cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DependabotUpdateRepositoryAccessForOrgRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotUpdateRepositoryAccessForOrgRequest.fromJson(json);
  }

  /// List of repository IDs to add.
  final List<int>? repositoryIdsToAdd;

  /// List of repository IDs to remove.
  final List<int>? repositoryIdsToRemove;

  /// Converts a [DependabotUpdateRepositoryAccessForOrgRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (repositoryIdsToAdd != null)
        'repository_ids_to_add': repositoryIdsToAdd,
      if (repositoryIdsToRemove != null)
        'repository_ids_to_remove': repositoryIdsToRemove,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(repositoryIdsToAdd),
    listHash(repositoryIdsToRemove),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotUpdateRepositoryAccessForOrgRequest &&
        listsEqual(repositoryIdsToAdd, other.repositoryIdsToAdd) &&
        listsEqual(repositoryIdsToRemove, other.repositoryIdsToRemove);
  }
}
