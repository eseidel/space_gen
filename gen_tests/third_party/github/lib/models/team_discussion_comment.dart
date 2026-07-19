// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template team_discussion_comment}
/// Team Discussion Comment
/// A reply to a discussion within a team.
/// {@endtemplate}
@immutable
class TeamDiscussionComment {
  /// {@macro team_discussion_comment}
  const TeamDiscussionComment({
    required this.author,
    required this.body,
    required this.bodyHtml,
    required this.bodyVersion,
    required this.createdAt,
    required this.lastEditedAt,
    required this.discussionUrl,
    required this.htmlUrl,
    required this.nodeId,
    required this.number,
    required this.updatedAt,
    required this.url,
    this.reactions,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamDiscussionComment].
  factory TeamDiscussionComment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamDiscussionComment',
      json,
      () => TeamDiscussionComment(
        author: SimpleUser.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        body: json['body'] as String,
        bodyHtml: json['body_html'] as String,
        bodyVersion: json['body_version'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        lastEditedAt: maybeParseDateTime(
          checkedKey(json, 'last_edited_at') as String?,
        ),
        discussionUrl: Uri.parse(json['discussion_url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        nodeId: json['node_id'] as String,
        number: json['number'] as int,
        updatedAt: DateTime.parse(json['updated_at'] as String),
        url: Uri.parse(json['url'] as String),
        reactions: ReactionRollup.maybeFromJson(
          json['reactions'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamDiscussionComment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamDiscussionComment.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? author;

  /// The main text of the comment.
  /// Example: `'I agree with this suggestion.'`
  final String body;

  /// Example: `'<p>Do you like apples?</p>'`
  final String bodyHtml;

  /// The current version of the body content. If provided, this update
  /// operation will be rejected if the given version does not match the
  /// latest version on the server.
  /// Example: `'0307116bbf7ced493b8d8a346c650b71'`
  final String bodyVersion;

  /// Example: `'2018-01-15T23:53:58Z'`
  final DateTime createdAt;
  final DateTime? lastEditedAt;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/2403582/discussions/1'`
  final Uri discussionUrl;

  /// Example:
  /// `'https://github.com/orgs/github/teams/justice-league/discussions/1/comments/1'`
  final Uri htmlUrl;

  /// Example: `'MDIxOlRlYW1EaXNjdXNzaW9uQ29tbWVudDE='`
  final String nodeId;

  /// The unique sequence number of a team discussion comment.
  /// Example: `42`
  final int number;

  /// Example: `'2018-01-15T23:53:58Z'`
  final DateTime updatedAt;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/2403582/discussions/1/comments/1'`
  final Uri url;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// Converts a [TeamDiscussionComment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'author': author?.toJson(),
      'body': body,
      'body_html': bodyHtml,
      'body_version': bodyVersion,
      'created_at': createdAt.toIso8601String(),
      'last_edited_at': lastEditedAt?.toIso8601String(),
      'discussion_url': discussionUrl.toString(),
      'html_url': htmlUrl.toString(),
      'node_id': nodeId,
      'number': number,
      'updated_at': updatedAt.toIso8601String(),
      'url': url.toString(),
      'reactions': reactions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    author,
    body,
    bodyHtml,
    bodyVersion,
    createdAt,
    lastEditedAt,
    discussionUrl,
    htmlUrl,
    nodeId,
    number,
    updatedAt,
    url,
    reactions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamDiscussionComment &&
        author == other.author &&
        body == other.body &&
        bodyHtml == other.bodyHtml &&
        bodyVersion == other.bodyVersion &&
        createdAt == other.createdAt &&
        lastEditedAt == other.lastEditedAt &&
        discussionUrl == other.discussionUrl &&
        htmlUrl == other.htmlUrl &&
        nodeId == other.nodeId &&
        number == other.number &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        reactions == other.reactions;
  }
}
