import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesUpdateForAuthenticatedUserRequest {
  const CodespacesUpdateForAuthenticatedUserRequest({
    this.machine,
    this.displayName,
    this.recentFolders,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesUpdateForAuthenticatedUserRequest].
  factory CodespacesUpdateForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesUpdateForAuthenticatedUserRequest',
      json,
      () => CodespacesUpdateForAuthenticatedUserRequest(
        machine: json['machine'] as String?,
        displayName: json['display_name'] as String?,
        recentFolders: (json['recent_folders'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesUpdateForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesUpdateForAuthenticatedUserRequest.fromJson(json);
  }

  /// A valid machine to transition this codespace to.
  final String? machine;

  /// Display name for this codespace
  final String? displayName;

  /// Recently opened folders inside the codespace. It is currently used by
  /// the clients to determine the folder path to load the codespace in.
  final List<String>? recentFolders;

  /// Converts a [CodespacesUpdateForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (machine != null) 'machine': machine,
      if (displayName != null) 'display_name': displayName,
      if (recentFolders != null) 'recent_folders': recentFolders,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([machine, displayName, listHash(recentFolders)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesUpdateForAuthenticatedUserRequest &&
        machine == other.machine &&
        displayName == other.displayName &&
        listsEqual(recentFolders, other.recentFolders);
  }
}
