import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesDeleteCodespacesAccessUsersRequest {
  const CodespacesDeleteCodespacesAccessUsersRequest({
    required this.selectedUsernames,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesDeleteCodespacesAccessUsersRequest].
  factory CodespacesDeleteCodespacesAccessUsersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesDeleteCodespacesAccessUsersRequest',
      json,
      () => CodespacesDeleteCodespacesAccessUsersRequest(
        selectedUsernames: (json['selected_usernames'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesDeleteCodespacesAccessUsersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesDeleteCodespacesAccessUsersRequest.fromJson(json);
  }

  /// The usernames of the organization members whose codespaces should not be
  /// billed to the organization.
  final List<String> selectedUsernames;

  /// Converts a [CodespacesDeleteCodespacesAccessUsersRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_usernames': selectedUsernames};
  }

  @override
  int get hashCode => listHash(selectedUsernames).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesDeleteCodespacesAccessUsersRequest &&
        listsEqual(selectedUsernames, other.selectedUsernames);
  }
}
