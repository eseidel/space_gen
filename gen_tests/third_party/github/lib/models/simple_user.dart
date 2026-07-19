import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template simple_user}
/// Simple User
/// A GitHub user.
/// {@endtemplate}
@immutable
class SimpleUser {
  /// {@macro simple_user}
  const SimpleUser({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    this.name,
    this.email,
    this.starredAt,
    this.userViewType,
  });

  /// Converts a `Map<String, dynamic>` to a [SimpleUser].
  factory SimpleUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SimpleUser',
      json,
      () => SimpleUser(
        name: json['name'] as String?,
        email: json['email'] as String?,
        login: json['login'] as String,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        avatarUrl: Uri.parse(json['avatar_url'] as String),
        gravatarId: checkedKey(json, 'gravatar_id') as String?,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        followersUrl: Uri.parse(json['followers_url'] as String),
        followingUrl: json['following_url'] as String,
        gistsUrl: json['gists_url'] as String,
        starredUrl: json['starred_url'] as String,
        subscriptionsUrl: Uri.parse(json['subscriptions_url'] as String),
        organizationsUrl: Uri.parse(json['organizations_url'] as String),
        reposUrl: Uri.parse(json['repos_url'] as String),
        eventsUrl: json['events_url'] as String,
        receivedEventsUrl: Uri.parse(json['received_events_url'] as String),
        type: json['type'] as String,
        siteAdmin: json['site_admin'] as bool,
        starredAt: json['starred_at'] as String?,
        userViewType: json['user_view_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SimpleUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SimpleUser.fromJson(json);
  }

  final String? name;
  final String? email;

  /// Example: `'octocat'`
  final String login;

  /// Example: `1`
  final int id;

  /// Example: `'MDQ6VXNlcjE='`
  final String nodeId;

  /// Example: `'https://github.com/images/error/octocat_happy.gif'`
  final Uri avatarUrl;

  /// Example: `'41d064eb2195891e12d0413f63227ea7'`
  final String? gravatarId;

  /// Example: `'https://api.github.com/users/octocat'`
  final Uri url;

  /// Example: `'https://github.com/octocat'`
  final Uri htmlUrl;

  /// Example: `'https://api.github.com/users/octocat/followers'`
  final Uri followersUrl;

  /// Example: `'https://api.github.com/users/octocat/following{/other_user}'`
  final String followingUrl;

  /// Example: `'https://api.github.com/users/octocat/gists{/gist_id}'`
  final String gistsUrl;

  /// Example: `'https://api.github.com/users/octocat/starred{/owner}{/repo}'`
  final String starredUrl;

  /// Example: `'https://api.github.com/users/octocat/subscriptions'`
  final Uri subscriptionsUrl;

  /// Example: `'https://api.github.com/users/octocat/orgs'`
  final Uri organizationsUrl;

  /// Example: `'https://api.github.com/users/octocat/repos'`
  final Uri reposUrl;

  /// Example: `'https://api.github.com/users/octocat/events{/privacy}'`
  final String eventsUrl;

  /// Example: `'https://api.github.com/users/octocat/received_events'`
  final Uri receivedEventsUrl;

  /// Example: `'User'`
  final String type;
  final bool siteAdmin;

  /// Example: `'"2020-07-09T00:17:55Z"'`
  final String? starredAt;

  /// Example: `'public'`
  final String? userViewType;

  /// Converts a [SimpleUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl.toString(),
      'gravatar_id': gravatarId,
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'followers_url': followersUrl.toString(),
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl.toString(),
      'organizations_url': organizationsUrl.toString(),
      'repos_url': reposUrl.toString(),
      'events_url': eventsUrl,
      'received_events_url': receivedEventsUrl.toString(),
      'type': type,
      'site_admin': siteAdmin,
      'starred_at': ?starredAt,
      'user_view_type': ?userViewType,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    email,
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
    starredAt,
    userViewType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SimpleUser &&
        name == other.name &&
        email == other.email &&
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
        starredAt == other.starredAt &&
        userViewType == other.userViewType;
  }
}
