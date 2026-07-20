import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesSetCodespacesAccessUsersRequest {
  CodespacesSetCodespacesAccessUsersRequest({required this.selectedUsernames}) {
    selectedUsernames.validate(maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesSetCodespacesAccessUsersRequest].
  factory CodespacesSetCodespacesAccessUsersRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesSetCodespacesAccessUsersRequest',
      json,
      () => CodespacesSetCodespacesAccessUsersRequest(
        selectedUsernames: (json['selected_usernames'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesSetCodespacesAccessUsersRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesSetCodespacesAccessUsersRequest.fromJson(json);
  }

  /// The usernames of the organization members whose codespaces be billed to
  /// the organization.
  final List<String> selectedUsernames;

  /// Converts a [CodespacesSetCodespacesAccessUsersRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'selected_usernames': selectedUsernames};
  }

  @override
  int get hashCode => listHash(selectedUsernames).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesSetCodespacesAccessUsersRequest &&
        listsEqual(selectedUsernames, other.selectedUsernames);
  }
}
