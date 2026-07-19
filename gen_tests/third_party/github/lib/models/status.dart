import 'package:github/model_helpers.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template status}
/// Status
/// The status of a commit.
/// {@endtemplate}
@immutable
class Status {
  /// {@macro status}
  const Status({
    required this.url,
    required this.avatarUrl,
    required this.id,
    required this.nodeId,
    required this.state,
    required this.description,
    required this.targetUrl,
    required this.context,
    required this.createdAt,
    required this.updatedAt,
    required this.creator,
  });

  /// Converts a `Map<String, dynamic>` to a [Status].
  factory Status.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Status',
      json,
      () => Status(
        url: json['url'] as String,
        avatarUrl: checkedKey(json, 'avatar_url') as String?,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        state: json['state'] as String,
        description: checkedKey(json, 'description') as String?,
        targetUrl: checkedKey(json, 'target_url') as String?,
        context: json['context'] as String,
        createdAt: json['created_at'] as String,
        updatedAt: json['updated_at'] as String,
        creator: SimpleUser.maybeFromJson(
          checkedKey(json, 'creator') as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Status? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Status.fromJson(json);
  }

  final String url;
  final String? avatarUrl;
  final int id;
  final String nodeId;
  final String state;
  final String? description;
  final String? targetUrl;
  final String context;
  final String createdAt;
  final String updatedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? creator;

  /// Converts a [Status] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'avatar_url': avatarUrl,
      'id': id,
      'node_id': nodeId,
      'state': state,
      'description': description,
      'target_url': targetUrl,
      'context': context,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'creator': creator?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    avatarUrl,
    id,
    nodeId,
    state,
    description,
    targetUrl,
    context,
    createdAt,
    updatedAt,
    creator,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Status &&
        url == other.url &&
        avatarUrl == other.avatarUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        state == other.state &&
        description == other.description &&
        targetUrl == other.targetUrl &&
        context == other.context &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        creator == other.creator;
  }
}
