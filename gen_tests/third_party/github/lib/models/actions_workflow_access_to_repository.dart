import 'package:github/model_helpers.dart';
import 'package:github/models/actions_workflow_access_to_repository_access_level.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsWorkflowAccessToRepository {
  const ActionsWorkflowAccessToRepository({required this.accessLevel});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsWorkflowAccessToRepository].
  factory ActionsWorkflowAccessToRepository.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsWorkflowAccessToRepository',
      json,
      () => ActionsWorkflowAccessToRepository(
        accessLevel: ActionsWorkflowAccessToRepositoryAccessLevel.fromJson(
          json['access_level'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsWorkflowAccessToRepository? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsWorkflowAccessToRepository.fromJson(json);
  }

  /// Defines the level of access that workflows outside of the repository
  /// have to actions and reusable workflows within the
  /// repository.
  ///
  /// `none` means the access is only possible from workflows in this
  /// repository. `user` level access allows sharing across user owned private
  /// repositories only. `organization` level access allows sharing across the
  /// organization.
  final ActionsWorkflowAccessToRepositoryAccessLevel accessLevel;

  /// Converts an [ActionsWorkflowAccessToRepository]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_level': accessLevel.toJson()};
  }

  @override
  int get hashCode => accessLevel.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsWorkflowAccessToRepository &&
        accessLevel == other.accessLevel;
  }
}
