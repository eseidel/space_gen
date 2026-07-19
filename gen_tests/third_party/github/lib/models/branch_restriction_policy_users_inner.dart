import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchRestrictionPolicyUsersInner {
  const BranchRestrictionPolicyUsersInner({
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
    this.type,
    this.siteAdmin,
    this.userViewType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchRestrictionPolicyUsersInner].
  factory BranchRestrictionPolicyUsersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchRestrictionPolicyUsersInner',
      json,
      () => BranchRestrictionPolicyUsersInner(
        login: json['login'] as String?,
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        gravatarId: json['gravatar_id'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        followersUrl: json['followers_url'] as String?,
        followingUrl: json['following_url'] as String?,
        gistsUrl: json['gists_url'] as String?,
        starredUrl: json['starred_url'] as String?,
        subscriptionsUrl: json['subscriptions_url'] as String?,
        organizationsUrl: json['organizations_url'] as String?,
        reposUrl: json['repos_url'] as String?,
        eventsUrl: json['events_url'] as String?,
        receivedEventsUrl: json['received_events_url'] as String?,
        type: json['type'] as String?,
        siteAdmin: json['site_admin'] as bool?,
        userViewType: json['user_view_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicyUsersInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicyUsersInner.fromJson(json);
  }

  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;
  final String? userViewType;

  /// Converts a [BranchRestrictionPolicyUsersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (login != null) 'login': login,
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
      if (gravatarId != null) 'gravatar_id': gravatarId,
      if (url != null) 'url': url,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (followersUrl != null) 'followers_url': followersUrl,
      if (followingUrl != null) 'following_url': followingUrl,
      if (gistsUrl != null) 'gists_url': gistsUrl,
      if (starredUrl != null) 'starred_url': starredUrl,
      if (subscriptionsUrl != null) 'subscriptions_url': subscriptionsUrl,
      if (organizationsUrl != null) 'organizations_url': organizationsUrl,
      if (reposUrl != null) 'repos_url': reposUrl,
      if (eventsUrl != null) 'events_url': eventsUrl,
      if (receivedEventsUrl != null) 'received_events_url': receivedEventsUrl,
      if (type != null) 'type': type,
      if (siteAdmin != null) 'site_admin': siteAdmin,
      if (userViewType != null) 'user_view_type': userViewType,
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
    userViewType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicyUsersInner &&
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
        userViewType == other.userViewType;
  }
}
