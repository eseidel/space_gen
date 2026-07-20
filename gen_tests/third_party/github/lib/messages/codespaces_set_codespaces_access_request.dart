import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_set_codespaces_access_request_visibility.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesSetCodespacesAccessRequest {
  CodespacesSetCodespacesAccessRequest({
    required this.visibility,
    this.selectedUsernames,
  }) {
    selectedUsernames?.validate(maxItems: 100);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesSetCodespacesAccessRequest].
  factory CodespacesSetCodespacesAccessRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesSetCodespacesAccessRequest',
      json,
      () => CodespacesSetCodespacesAccessRequest(
        visibility: CodespacesSetCodespacesAccessRequestVisibility.fromJson(
          json['visibility'] as String,
        ),
        selectedUsernames: (json['selected_usernames'] as List?)
            ?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesSetCodespacesAccessRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesSetCodespacesAccessRequest.fromJson(json);
  }

  /// Which users can access codespaces in the organization. `disabled` means
  /// that no users can access codespaces in the organization.
  final CodespacesSetCodespacesAccessRequestVisibility visibility;

  /// The usernames of the organization members who should have access to
  /// codespaces in the organization. Required when `visibility` is
  /// `selected_members`. The provided list of usernames will replace any
  /// existing value.
  final List<String>? selectedUsernames;

  /// Converts a [CodespacesSetCodespacesAccessRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'visibility': visibility.toJson(),
      'selected_usernames': ?selectedUsernames,
    };
  }

  @override
  int get hashCode => Object.hashAll([visibility, listHash(selectedUsernames)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesSetCodespacesAccessRequest &&
        visibility == other.visibility &&
        listsEqual(selectedUsernames, other.selectedUsernames);
  }
}
