import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template contributor}
/// Contributor
/// Contributor
/// {@endtemplate}
@immutable
class Contributor {
  /// {@macro contributor}
  const Contributor({
    required this.type,
    required this.contributions,
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.siteAdmin,
    this.email,
    this.name,
    this.userViewType,
  });

  /// Converts a `Map<String, dynamic>` to a [Contributor].
  factory Contributor.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Contributor',
      json,
      () => Contributor(
        login: json['login'] as String?,
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        avatarUrl: maybeParseUri(json['avatar_url'] as String?),
        gravatarId: json['gravatar_id'] as String?,
        url: maybeParseUri(json['url'] as String?),
        htmlUrl: maybeParseUri(json['html_url'] as String?),
        followersUrl: maybeParseUri(json['followers_url'] as String?),
        followingUrl: json['following_url'] as String?,
        gistsUrl: json['gists_url'] as String?,
        starredUrl: json['starred_url'] as String?,
        subscriptionsUrl: maybeParseUri(json['subscriptions_url'] as String?),
        organizationsUrl: maybeParseUri(json['organizations_url'] as String?),
        reposUrl: maybeParseUri(json['repos_url'] as String?),
        eventsUrl: json['events_url'] as String?,
        receivedEventsUrl: maybeParseUri(
          json['received_events_url'] as String?,
        ),
        type: json['type'] as String,
        siteAdmin: json['site_admin'] as bool?,
        contributions: json['contributions'] as int,
        email: json['email'] as String?,
        name: json['name'] as String?,
        userViewType: json['user_view_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Contributor? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Contributor.fromJson(json);
  }

  final String? login;
  final int? id;
  final String? nodeId;
  final Uri? avatarUrl;
  final String? gravatarId;
  final Uri? url;
  final Uri? htmlUrl;
  final Uri? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final Uri? subscriptionsUrl;
  final Uri? organizationsUrl;
  final Uri? reposUrl;
  final String? eventsUrl;
  final Uri? receivedEventsUrl;
  final String type;
  final bool? siteAdmin;
  final int contributions;
  final String? email;
  final String? name;
  final String? userViewType;

  /// Converts a [Contributor] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl?.toString(),
      'gravatar_id': gravatarId,
      'url': url?.toString(),
      'html_url': htmlUrl?.toString(),
      'followers_url': followersUrl?.toString(),
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl?.toString(),
      'organizations_url': organizationsUrl?.toString(),
      'repos_url': reposUrl?.toString(),
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl?.toString(),
      'type': type,
      'site_admin': siteAdmin,
      'contributions': contributions,
      'email': email,
      'name': name,
      'user_view_type': userViewType,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    login,
    id,
    nodeId,
    avatarUrl,
    gravatarId,
    url,
    htmlUrl,
    followersUrl,
    followingUrl,
    gistsUrl,
    starredUrl,
    subscriptionsUrl,
    organizationsUrl,
    reposUrl,
    eventsUrl,
    receivedEventsUrl,
    type,
    siteAdmin,
    contributions,
    email,
    name,
    userViewType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Contributor &&
        login == other.login &&
        id == other.id &&
        nodeId == other.nodeId &&
        avatarUrl == other.avatarUrl &&
        gravatarId == other.gravatarId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        followersUrl == other.followersUrl &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        starredUrl == other.starredUrl &&
        subscriptionsUrl == other.subscriptionsUrl &&
        organizationsUrl == other.organizationsUrl &&
        reposUrl == other.reposUrl &&
        eventsUrl == other.eventsUrl &&
        receivedEventsUrl == other.receivedEventsUrl &&
        type == other.type &&
        siteAdmin == other.siteAdmin &&
        contributions == other.contributions &&
        email == other.email &&
        name == other.name &&
        userViewType == other.userViewType;
  }
}
