import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template commit_comment}
/// Commit Comment
/// Commit Comment
/// {@endtemplate}
@immutable
class CommitComment {
  /// {@macro commit_comment}
  const CommitComment({
    required this.htmlUrl,
    required this.url,
    required this.id,
    required this.nodeId,
    required this.body,
    required this.path,
    required this.position,
    required this.line,
    required this.commitId,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.authorAssociation,
    this.reactions,
  });

  /// Converts a `Map<String, dynamic>` to a [CommitComment].
  factory CommitComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommitComment',
      json,
      () => CommitComment(
        htmlUrl: Uri.parse(json['html_url'] as String),
        url: Uri.parse(json['url'] as String),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        body: json['body'] as String,
        path: checkedKey(json, 'path') as String?,
        position: checkedKey(json, 'position') as int?,
        line: checkedKey(json, 'line') as int?,
        commitId: json['commit_id'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
        reactions: ReactionRollup.maybeFromJson(
          json['reactions'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommitComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommitComment.fromJson(json);
  }

  final Uri htmlUrl;
  final Uri url;
  final int id;
  final String nodeId;
  final String body;
  final String? path;
  final int? position;
  final int? line;
  final String commitId;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// Converts a [CommitComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'html_url': htmlUrl.toString(),
      'url': url.toString(),
      'id': id,
      'node_id': nodeId,
      'body': body,
      'path': path,
      'position': position,
      'line': line,
      'commit_id': commitId,
      'user': user?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'author_association': authorAssociation.toJson(),
      'reactions': reactions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    htmlUrl,
    url,
    id,
    nodeId,
    body,
    path,
    position,
    line,
    commitId,
    user,
    createdAt,
    updatedAt,
    authorAssociation,
    reactions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommitComment &&
        htmlUrl == other.htmlUrl &&
        url == other.url &&
        id == other.id &&
        nodeId == other.nodeId &&
        body == other.body &&
        path == other.path &&
        position == other.position &&
        line == other.line &&
        commitId == other.commitId &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        authorAssociation == other.authorAssociation &&
        reactions == other.reactions;
  }
}
