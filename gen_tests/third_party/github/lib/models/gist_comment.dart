import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template gist_comment}
/// Gist Comment
/// A comment made to a gist.
/// {@endtemplate}
@immutable
class GistComment {
  /// {@macro gist_comment}
  GistComment({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.body,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.authorAssociation,
  }) {
    body.validate(maxLength: 65535);
  }

  /// Converts a `Map<String, dynamic>` to a [GistComment].
  factory GistComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistComment',
      json,
      () => GistComment(
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        body: json['body'] as String,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistComment.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'MDExOkdpc3RDb21tZW50MQ=='`
  final String nodeId;

  /// Example:
  /// `'https://api.github.com/gists/a6db0bec360bb87e9418/comments/1'`
  final Uri url;

  /// The comment text.
  /// Example: `'Body of the attachment'`
  final String body;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;

  /// Example: `'2011-04-18T23:23:56Z'`
  final DateTime createdAt;

  /// Example: `'2011-04-18T23:23:56Z'`
  final DateTime updatedAt;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;

  /// Converts a [GistComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'body': body,
      'user': user?.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'author_association': authorAssociation.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    body,
    user,
    createdAt,
    updatedAt,
    authorAssociation,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistComment &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        body == other.body &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        authorAssociation == other.authorAssociation;
  }
}
