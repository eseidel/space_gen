// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PendingDeploymentEnvironment {
  const PendingDeploymentEnvironment({
    this.id,
    this.nodeId,
    this.name,
    this.url,
    this.htmlUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [PendingDeploymentEnvironment].
  factory PendingDeploymentEnvironment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PendingDeploymentEnvironment',
      json,
      () => PendingDeploymentEnvironment(
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PendingDeploymentEnvironment? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PendingDeploymentEnvironment.fromJson(json);
  }

  /// The id of the environment.
  /// Example: `56780428`
  final int? id;

  /// Example: `'MDExOkVudmlyb25tZW50NTY3ODA0Mjg='`
  final String? nodeId;

  /// The name of the environment.
  /// Example: `'staging'`
  final String? name;

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/environments/staging'`
  final String? url;

  /// Example:
  /// `'https://github.com/github/hello-world/deployments/activity_log?environments_filter=staging'`
  final String? htmlUrl;

  /// Converts a [PendingDeploymentEnvironment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (name != null) 'name': name,
      if (url != null) 'url': url,
      if (htmlUrl != null) 'html_url': htmlUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, nodeId, name, url, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PendingDeploymentEnvironment &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        url == other.url &&
        htmlUrl == other.htmlUrl;
  }
}
