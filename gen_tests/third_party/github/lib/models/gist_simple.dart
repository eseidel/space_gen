import 'package:github/model_helpers.dart';
import 'package:github/models/gist_history.dart';
import 'package:github/models/gist_simple_files.dart';
import 'package:github/models/gist_simple_fork_of.dart';
import 'package:github/models/gist_simple_forks_inner.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template gist_simple}
/// Gist Simple
/// Gist Simple
/// {@endtemplate}
@immutable
class GistSimple {
  /// {@macro gist_simple}
  const GistSimple({
    @deprecated this.forks,
    @deprecated this.history,
    this.forkOf,
    this.url,
    this.forksUrl,
    this.commitsUrl,
    this.id,
    this.nodeId,
    this.gitPullUrl,
    this.gitPushUrl,
    this.htmlUrl,
    this.files,
    this.public,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.comments,
    this.commentsEnabled,
    this.user,
    this.commentsUrl,
    this.owner,
    this.truncated,
  });

  /// Converts a `Map<String, dynamic>` to a [GistSimple].
  factory GistSimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GistSimple',
      json,
      () => GistSimple(
        forks: (json['forks'] as List?)
            ?.map<GistSimpleForksInner>(
              (e) => GistSimpleForksInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        history: (json['history'] as List?)
            ?.map<GistHistory>(
              (e) => GistHistory.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        forkOf: GistSimpleForkOf.maybeFromJson(
          json['fork_of'] as Map<String, dynamic>?,
        ),
        url: json['url'] as String?,
        forksUrl: json['forks_url'] as String?,
        commitsUrl: json['commits_url'] as String?,
        id: json['id'] as String?,
        nodeId: json['node_id'] as String?,
        gitPullUrl: json['git_pull_url'] as String?,
        gitPushUrl: json['git_push_url'] as String?,
        htmlUrl: json['html_url'] as String?,
        files: (json['files'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(
            key,
            GistSimpleFiles.fromJson(value as Map<String, dynamic>),
          ),
        ),
        public: json['public'] as bool?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        description: json['description'] as String?,
        comments: json['comments'] as int?,
        commentsEnabled: json['comments_enabled'] as bool?,
        user: json['user'] as String?,
        commentsUrl: json['comments_url'] as String?,
        owner: SimpleUser.maybeFromJson(json['owner'] as Map<String, dynamic>?),
        truncated: json['truncated'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GistSimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GistSimple.fromJson(json);
  }

  @deprecated
  final List<GistSimpleForksInner>? forks;
  @deprecated
  final List<GistHistory>? history;

  /// Gist
  /// Gist
  final GistSimpleForkOf? forkOf;
  final String? url;
  final String? forksUrl;
  final String? commitsUrl;
  final String? id;
  final String? nodeId;
  final String? gitPullUrl;
  final String? gitPushUrl;
  final String? htmlUrl;
  final Map<String, GistSimpleFiles>? files;
  final bool? public;
  final String? createdAt;
  final String? updatedAt;
  final String? description;
  final int? comments;
  final bool? commentsEnabled;
  final String? user;
  final String? commentsUrl;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? owner;
  final bool? truncated;

  /// Converts a [GistSimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'forks': forks?.map((e) => e.toJson()).toList(),
      'history': history?.map((e) => e.toJson()).toList(),
      'fork_of': forkOf?.toJson(),
      if (url != null) 'url': url,
      if (forksUrl != null) 'forks_url': forksUrl,
      if (commitsUrl != null) 'commits_url': commitsUrl,
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (gitPullUrl != null) 'git_pull_url': gitPullUrl,
      if (gitPushUrl != null) 'git_push_url': gitPushUrl,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (files != null)
        'files': files?.map((key, value) => MapEntry(key, value.toJson())),
      if (public != null) 'public': public,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      'description': description,
      if (comments != null) 'comments': comments,
      if (commentsEnabled != null) 'comments_enabled': commentsEnabled,
      'user': user,
      if (commentsUrl != null) 'comments_url': commentsUrl,
      if (owner != null) 'owner': owner?.toJson(),
      if (truncated != null) 'truncated': truncated,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    listHash(forks),
    listHash(history),
    forkOf,
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
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GistSimple &&
        listsEqual(forks, other.forks) &&
        listsEqual(history, other.history) &&
        forkOf == other.forkOf &&
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
        truncated == other.truncated;
  }
}
