import 'package:github/model_helpers.dart';
import 'package:github/models/gist_simple_fork_of_files.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template gist_simple_fork_of}
/// Gist
/// Gist
/// {@endtemplate}
@immutable
class GistSimpleForkOf {
  /// {@macro gist_simple_fork_of}
  const GistSimpleForkOf({
    required this.url,
    required this.forksUrl,
    required this.commitsUrl,
    required this.id,
    required this.nodeId,
    required this.gitPullUrl,
    required this.gitPushUrl,
    required this.htmlUrl,
    required this.files,
    required this.public,
    required this.createdAt,
    required this.updatedAt,
    required this.description,
    required this.comments,
    required this.user,
    required this.commentsUrl,
    this.commentsEnabled,
    this.owner,
    this.truncated,
    this.forks,
    this.history,
  });

  /// Converts a `Map<String, dynamic>` to a [GistSimpleForkOf].
  factory GistSimpleForkOf.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistSimpleForkOf',
      json,
      () => GistSimpleForkOf(
        url: Uri.parse(json['url'] as String),
        forksUrl: Uri.parse(json['forks_url'] as String),
        commitsUrl: Uri.parse(json['commits_url'] as String),
        id: json['id'] as String,
        nodeId: json['node_id'] as String,
        gitPullUrl: Uri.parse(json['git_pull_url'] as String),
        gitPushUrl: Uri.parse(json['git_push_url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        files: (json['files'] as Map<String, dynamic>).map(
          (key, value) => MapEntry(
            key,
            GistSimpleForkOfFiles.fromJson(value as Map<String, dynamic>),
          ),
        ),
        public: json['public'] as bool,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        description: checkedKey(json, 'description') as String?,
        comments: json['comments'] as int,
        commentsEnabled: json['comments_enabled'] as bool?,
        user: SimpleUser.maybeFromJson(
          checkedKey(json, 'user') as Map<String, dynamic>?,
        ),
        commentsUrl: Uri.parse(json['comments_url'] as String),
        owner: SimpleUser.maybeFromJson(json['owner'] as Map<String, dynamic>?),
        truncated: json['truncated'] as bool?,
        forks: (json['forks'] as List?)?.cast<dynamic>(),
        history: (json['history'] as List?)?.cast<dynamic>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistSimpleForkOf? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistSimpleForkOf.fromJson(json);
  }

  final Uri url;
  final Uri forksUrl;
  final Uri commitsUrl;
  final String id;
  final String nodeId;
  final Uri gitPullUrl;
  final Uri gitPushUrl;
  final Uri htmlUrl;
  final Map<String, GistSimpleForkOfFiles> files;
  final bool public;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final int comments;
  final bool? commentsEnabled;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? user;
  final Uri commentsUrl;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? owner;
  final bool? truncated;
  final List<dynamic>? forks;
  final List<dynamic>? history;

  /// Converts a [GistSimpleForkOf] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'forks_url': forksUrl.toString(),
      'commits_url': commitsUrl.toString(),
      'id': id,
      'node_id': nodeId,
      'git_pull_url': gitPullUrl.toString(),
      'git_push_url': gitPushUrl.toString(),
      'html_url': htmlUrl.toString(),
      'files': files.map((key, value) => MapEntry(key, value.toJson())),
      'public': public,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'description': description,
      'comments': comments,
      if (commentsEnabled != null) 'comments_enabled': commentsEnabled,
      'user': user?.toJson(),
      'comments_url': commentsUrl.toString(),
      'owner': owner?.toJson(),
      if (truncated != null) 'truncated': truncated,
      if (forks != null) 'forks': forks,
      if (history != null) 'history': history,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    forksUrl,
    commitsUrl,
    id,
    nodeId,
    gitPullUrl,
    gitPushUrl,
    htmlUrl,
    mapHash(files),
    public,
    createdAt,
    updatedAt,
    description,
    comments,
    commentsEnabled,
    user,
    commentsUrl,
    owner,
    truncated,
    listHash(forks),
    listHash(history),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistSimpleForkOf &&
        url == other.url &&
        forksUrl == other.forksUrl &&
        commitsUrl == other.commitsUrl &&
        id == other.id &&
        nodeId == other.nodeId &&
        gitPullUrl == other.gitPullUrl &&
        gitPushUrl == other.gitPushUrl &&
        htmlUrl == other.htmlUrl &&
        mapsEqual(files, other.files) &&
        public == other.public &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        description == other.description &&
        comments == other.comments &&
        commentsEnabled == other.commentsEnabled &&
        user == other.user &&
        commentsUrl == other.commentsUrl &&
        owner == other.owner &&
        truncated == other.truncated &&
        listsEqual(forks, other.forks) &&
        listsEqual(history, other.history);
  }
}
