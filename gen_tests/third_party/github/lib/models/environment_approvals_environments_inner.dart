// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class EnvironmentApprovalsEnvironmentsInner {
  const EnvironmentApprovalsEnvironmentsInner({
    this.id,
    this.nodeId,
    this.name,
    this.url,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [EnvironmentApprovalsEnvironmentsInner].
  factory EnvironmentApprovalsEnvironmentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'EnvironmentApprovalsEnvironmentsInner',
      json,
      () => EnvironmentApprovalsEnvironmentsInner(
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        name: json['name'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EnvironmentApprovalsEnvironmentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return EnvironmentApprovalsEnvironmentsInner.fromJson(json);
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

  /// The time that the environment was created, in ISO 8601 format.
  /// Example: `'2020-11-23T22:00:40Z'`
  final DateTime? createdAt;

  /// The time that the environment was last updated, in ISO 8601 format.
  /// Example: `'2020-11-23T22:00:40Z'`
  final DateTime? updatedAt;

  /// Converts an [EnvironmentApprovalsEnvironmentsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'url': url,
      'html_url': htmlUrl,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, nodeId, name, url, htmlUrl, createdAt, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EnvironmentApprovalsEnvironmentsInner &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
