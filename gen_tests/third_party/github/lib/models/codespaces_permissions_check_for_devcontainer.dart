import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template codespaces_permissions_check_for_devcontainer}
/// Codespaces Permissions Check
/// Permission check result for a given devcontainer config.
/// {@endtemplate}
@immutable
class CodespacesPermissionsCheckForDevcontainer {
  /// {@macro codespaces_permissions_check_for_devcontainer}
  const CodespacesPermissionsCheckForDevcontainer({required this.accepted});

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesPermissionsCheckForDevcontainer].
  factory CodespacesPermissionsCheckForDevcontainer.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesPermissionsCheckForDevcontainer',
      json,
      () => CodespacesPermissionsCheckForDevcontainer(
        accepted: json['accepted'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesPermissionsCheckForDevcontainer? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesPermissionsCheckForDevcontainer.fromJson(json);
  }

  /// Whether the user has accepted the permissions defined by the
  /// devcontainer config
  /// Example: `true`
  final bool accepted;

  /// Converts a [CodespacesPermissionsCheckForDevcontainer]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'accepted': accepted};
  }

  @override
  int get hashCode => accepted.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesPermissionsCheckForDevcontainer &&
        accepted == other.accepted;
  }
}
