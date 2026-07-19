// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template team_discussion}
/// Team Discussion
/// A team discussion is a persistent record of a free-form conversation within
/// a team.
/// {@endtemplate}
@immutable
class TeamDiscussion {
  /// {@macro team_discussion}
  const TeamDiscussion({
    required this.author,
    required this.body,
    required this.bodyHtml,
    required this.bodyVersion,
    required this.commentsCount,
    required this.commentsUrl,
    required this.createdAt,
    required this.lastEditedAt,
    required this.htmlUrl,
    required this.nodeId,
    required this.number,
    required this.pinned,
    required this.private,
    required this.teamUrl,
    required this.title,
    required this.updatedAt,
    required this.url,
    this.reactions,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamDiscussion].
  factory TeamDiscussion.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamDiscussion',
      json,
      () => TeamDiscussion(
        author: SimpleUser.maybeFromJson(
          checkedKey(json, 'author') as Map<String, dynamic>?,
        ),
        body: json['body'] as String,
        bodyHtml: json['body_html'] as String,
        bodyVersion: json['body_version'] as String,
        commentsCount: json['comments_count'] as int,
        commentsUrl: Uri.parse(json['comments_url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        lastEditedAt: maybeParseDateTime(
          checkedKey(json, 'last_edited_at') as String?,
        ),
        htmlUrl: Uri.parse(json['html_url'] as String),
        nodeId: json['node_id'] as String,
        number: json['number'] as int,
        pinned: json['pinned'] as bool,
        private: json['private'] as bool,
        teamUrl: Uri.parse(json['team_url'] as String),
        title: json['title'] as String,
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
  static TeamDiscussion? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamDiscussion.fromJson(json);
  }

  /// Simple User
  /// A GitHub user.
  final SimpleUser? author;

  /// The main text of the discussion.
  /// Example: `'Please suggest improvements to our workflow in comments.'`
  final String body;

  /// Example: `'<p>Hi! This is an area for us to collaborate as a team</p>'`
  final String bodyHtml;

  /// The current version of the body content. If provided, this update
  /// operation will be rejected if the given version does not match the
  /// latest version on the server.
  /// Example: `'0307116bbf7ced493b8d8a346c650b71'`
  final String bodyVersion;

  /// Example: `0`
  final int commentsCount;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/2343027/discussions/1/comments'`
  final Uri commentsUrl;

  /// Example: `'2018-01-25T18:56:31Z'`
  final DateTime createdAt;
  final DateTime? lastEditedAt;

  /// Example:
  /// `'https://github.com/orgs/github/teams/justice-league/discussions/1'`
  final Uri htmlUrl;

  /// Example: `'MDE0OlRlYW1EaXNjdXNzaW9uMQ=='`
  final String nodeId;

  /// The unique sequence number of a team discussion.
  /// Example: `42`
  final int number;

  /// Whether or not this discussion should be pinned for easy retrieval.
  /// Example: `true`
  final bool pinned;

  /// Whether or not this discussion should be restricted to team members and
  /// organization owners.
  /// Example: `true`
  final bool private;

  /// Example: `'https://api.github.com/organizations/1/team/2343027'`
  final Uri teamUrl;

  /// The title of the discussion.
  /// Example: `'How can we improve our workflow?'`
  final String title;

  /// Example: `'2018-01-25T18:56:31Z'`
  final DateTime updatedAt;

  /// Example:
  /// `'https://api.github.com/organizations/1/team/2343027/discussions/1'`
  final Uri url;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// Converts a [TeamDiscussion] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'author': author?.toJson(),
      'body': body,
      'body_html': bodyHtml,
      'body_version': bodyVersion,
      'comments_count': commentsCount,
      'comments_url': commentsUrl.toString(),
      'created_at': createdAt.toIso8601String(),
      'last_edited_at': lastEditedAt?.toIso8601String(),
      'html_url': htmlUrl.toString(),
      'node_id': nodeId,
      'number': number,
      'pinned': pinned,
      'private': private,
      'team_url': teamUrl.toString(),
      'title': title,
      'updated_at': updatedAt.toIso8601String(),
      'url': url.toString(),
      'reactions': ?reactions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    author,
    body,
    bodyHtml,
    bodyVersion,
    commentsCount,
    commentsUrl,
    createdAt,
    lastEditedAt,
    htmlUrl,
    nodeId,
    number,
    pinned,
    private,
    teamUrl,
    title,
    updatedAt,
    url,
    reactions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamDiscussion &&
        author == other.author &&
        body == other.body &&
        bodyHtml == other.bodyHtml &&
        bodyVersion == other.bodyVersion &&
        commentsCount == other.commentsCount &&
        commentsUrl == other.commentsUrl &&
        createdAt == other.createdAt &&
        lastEditedAt == other.lastEditedAt &&
        htmlUrl == other.htmlUrl &&
        nodeId == other.nodeId &&
        number == other.number &&
        pinned == other.pinned &&
        private == other.private &&
        teamUrl == other.teamUrl &&
        title == other.title &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        reactions == other.reactions;
  }
}
