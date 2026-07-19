// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/workflow_state.dart';
import 'package:meta/meta.dart';

/// {@template workflow}
/// Workflow
/// A GitHub Actions workflow
/// {@endtemplate}
@immutable
class Workflow {
  /// {@macro workflow}
  const Workflow({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.path,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    required this.url,
    required this.htmlUrl,
    required this.badgeUrl,
    this.deletedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [Workflow].
  factory Workflow.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Workflow',
      json,
      () => Workflow(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        name: json['name'] as String,
        path: json['path'] as String,
        state: WorkflowState.fromJson(json['state'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        url: json['url'] as String,
        htmlUrl: json['html_url'] as String,
        badgeUrl: json['badge_url'] as String,
        deletedAt: maybeParseDateTime(json['deleted_at'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Workflow? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Workflow.fromJson(json);
  }

  /// Example: `5`
  final int id;

  /// Example: `'MDg6V29ya2Zsb3cxMg=='`
  final String nodeId;

  /// Example: `'CI'`
  final String name;

  /// Example: `'ruby.yaml'`
  final String path;

  /// Example: `'active'`
  final WorkflowState state;

  /// Example: `'2019-12-06T14:20:20.000Z'`
  final DateTime createdAt;

  /// Example: `'2019-12-06T14:20:20.000Z'`
  final DateTime updatedAt;

  /// Example: `'https://api.github.com/repos/actions/setup-ruby/workflows/5'`
  final String url;

  /// Example:
  /// `'https://github.com/actions/setup-ruby/blob/master/.github/workflows/ruby.yaml'`
  final String htmlUrl;

  /// Example:
  /// `'https://github.com/actions/setup-ruby/workflows/CI/badge.svg'`
  final String badgeUrl;

  /// Example: `'2019-12-06T14:20:20.000Z'`
  final DateTime? deletedAt;

  /// Converts a [Workflow] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'name': name,
      'path': path,
      'state': state.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'url': url,
      'html_url': htmlUrl,
      'badge_url': badgeUrl,
      'deleted_at': deletedAt?.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    name,
    path,
    state,
    createdAt,
    updatedAt,
    url,
    htmlUrl,
    badgeUrl,
    deletedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Workflow &&
        id == other.id &&
        nodeId == other.nodeId &&
        name == other.name &&
        path == other.path &&
        state == other.state &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        badgeUrl == other.badgeUrl &&
        deletedAt == other.deletedAt;
  }
}
