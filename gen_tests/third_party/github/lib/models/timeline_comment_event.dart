// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/author_association.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/reaction_rollup.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template timeline_comment_event}
/// Timeline Comment Event
/// Timeline Comment Event
/// {@endtemplate}
@immutable
class TimelineCommentEvent {
  /// {@macro timeline_comment_event}
  const TimelineCommentEvent({
    required this.event,
    required this.actor,
    required this.id,
    required this.nodeId,
    required this.url,
    required this.htmlUrl,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.issueUrl,
    required this.authorAssociation,
    this.body,
    this.bodyText,
    this.bodyHtml,
    this.performedViaGithubApp,
    this.reactions,
  });

  /// Converts a `Map<String, dynamic>` to a [TimelineCommentEvent].
  factory TimelineCommentEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TimelineCommentEvent',
      json,
      () => TimelineCommentEvent(
        event: json['event'] as String,
        actor: SimpleUser.fromJson(json['actor'] as Map<String, dynamic>),
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        body: json['body'] as String?,
        bodyText: json['body_text'] as String?,
        bodyHtml: json['body_html'] as String?,
        htmlUrl: Uri.parse(json['html_url'] as String),
        user: SimpleUser.fromJson(json['user'] as Map<String, dynamic>),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        issueUrl: Uri.parse(json['issue_url'] as String),
        authorAssociation: AuthorAssociation.fromJson(
          json['author_association'] as String,
        ),
        performedViaGithubApp: Integration.maybeFromJson(
          json['performed_via_github_app'] as Map<String, dynamic>?,
        ),
        reactions: ReactionRollup.maybeFromJson(
          json['reactions'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TimelineCommentEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TimelineCommentEvent.fromJson(json);
  }

  final String event;

  /// Simple User
  /// A GitHub user.
  final SimpleUser actor;

  /// Unique identifier of the issue comment
  /// Example: `42`
  final int id;
  final String nodeId;

  /// URL for the issue comment
  /// Example: `'https://api.github.com/repositories/42/issues/comments/1'`
  final Uri url;

  /// Contents of the issue comment
  /// Example: `'What version of Safari were you using when you observed this bug?'`
  final String? body;
  final String? bodyText;
  final String? bodyHtml;
  final Uri htmlUrl;

  /// Simple User
  /// A GitHub user.
  final SimpleUser user;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime createdAt;

  /// Example: `'2011-04-14T16:00:49Z'`
  final DateTime updatedAt;
  final Uri issueUrl;

  /// author_association
  /// How the author is associated with the repository.
  /// Example: `'OWNER'`
  final AuthorAssociation authorAssociation;

  /// GitHub app
  /// GitHub apps are a new way to extend GitHub. They can be installed
  /// directly on organizations and user accounts and granted access to
  /// specific repositories. They come with granular permissions and built-in
  /// webhooks. GitHub apps are first class actors within GitHub.
  final Integration? performedViaGithubApp;

  /// Reaction Rollup
  final ReactionRollup? reactions;

  /// Converts a [TimelineCommentEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'event': event,
      'actor': actor.toJson(),
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      if (body != null) 'body': body,
      if (bodyText != null) 'body_text': bodyText,
      if (bodyHtml != null) 'body_html': bodyHtml,
      'html_url': htmlUrl.toString(),
      'user': user.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'issue_url': issueUrl.toString(),
      'author_association': authorAssociation.toJson(),
      'performed_via_github_app': performedViaGithubApp?.toJson(),
      if (reactions != null) 'reactions': reactions?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    event,
    actor,
    id,
    nodeId,
    url,
    body,
    bodyText,
    bodyHtml,
    htmlUrl,
    user,
    createdAt,
    updatedAt,
    issueUrl,
    authorAssociation,
    performedViaGithubApp,
    reactions,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TimelineCommentEvent &&
        event == other.event &&
        actor == other.actor &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        body == other.body &&
        bodyText == other.bodyText &&
        bodyHtml == other.bodyHtml &&
        htmlUrl == other.htmlUrl &&
        user == other.user &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        issueUrl == other.issueUrl &&
        authorAssociation == other.authorAssociation &&
        performedViaGithubApp == other.performedViaGithubApp &&
        reactions == other.reactions;
  }
}
