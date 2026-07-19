// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchRestrictionPolicyAppsInnerOwner {
  const BranchRestrictionPolicyAppsInnerOwner({
    this.login,
    this.id,
    this.nodeId,
    this.url,
    this.reposUrl,
    this.eventsUrl,
    this.hooksUrl,
    this.issuesUrl,
    this.membersUrl,
    this.publicMembersUrl,
    this.avatarUrl,
    this.description,
    this.gravatarId,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.userViewType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchRestrictionPolicyAppsInnerOwner].
  factory BranchRestrictionPolicyAppsInnerOwner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchRestrictionPolicyAppsInnerOwner',
      json,
      () => BranchRestrictionPolicyAppsInnerOwner(
        login: json['login'] as String?,
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        url: json['url'] as String?,
        reposUrl: json['repos_url'] as String?,
        eventsUrl: json['events_url'] as String?,
        hooksUrl: json['hooks_url'] as String?,
        issuesUrl: json['issues_url'] as String?,
        membersUrl: json['members_url'] as String?,
        publicMembersUrl: json['public_members_url'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        description: json['description'] as String?,
        gravatarId: json['gravatar_id'] as String?,
        htmlUrl: json['html_url'] as String?,
        followersUrl: json['followers_url'] as String?,
        followingUrl: json['following_url'] as String?,
        gistsUrl: json['gists_url'] as String?,
        starredUrl: json['starred_url'] as String?,
        subscriptionsUrl: json['subscriptions_url'] as String?,
        organizationsUrl: json['organizations_url'] as String?,
        receivedEventsUrl: json['received_events_url'] as String?,
        type: json['type'] as String?,
        siteAdmin: json['site_admin'] as bool?,
        userViewType: json['user_view_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicyAppsInnerOwner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicyAppsInnerOwner.fromJson(json);
  }

  final String? login;
  final int? id;
  final String? nodeId;
  final String? url;
  final String? reposUrl;
  final String? eventsUrl;
  final String? hooksUrl;
  final String? issuesUrl;
  final String? membersUrl;
  final String? publicMembersUrl;
  final String? avatarUrl;
  final String? description;

  /// Example: `'""'`
  final String? gravatarId;

  /// Example: `'"https://github.com/testorg-ea8ec76d71c3af4b"'`
  final String? htmlUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/followers"'`
  final String? followersUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/following{/other_user}"'`
  final String? followingUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/gists{/gist_id}"'`
  final String? gistsUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/starred{/owner}{/repo}"'`
  final String? starredUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/subscriptions"'`
  final String? subscriptionsUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/orgs"'`
  final String? organizationsUrl;

  /// Example:
  /// `'"https://api.github.com/users/testorg-ea8ec76d71c3af4b/received_events"'`
  final String? receivedEventsUrl;

  /// Example: `'"Organization"'`
  final String? type;

  /// Example: `false`
  final bool? siteAdmin;

  /// Example: `'public'`
  final String? userViewType;

  /// Converts a [BranchRestrictionPolicyAppsInnerOwner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'url': url,
      'repos_url': reposUrl,
      'events_url': eventsUrl,
      'hooks_url': hooksUrl,
      'issues_url': issuesUrl,
      'members_url': membersUrl,
      'public_members_url': publicMembersUrl,
      'avatar_url': avatarUrl,
      'description': description,
      'gravatar_id': gravatarId,
      'html_url': htmlUrl,
      'followers_url': followersUrl,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'subscriptions_url': subscriptionsUrl,
      'organizations_url': organizationsUrl,
      'received_events_url': receivedEventsUrl,
      'type': type,
      'site_admin': siteAdmin,
      'user_view_type': userViewType,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    login,
    id,
    nodeId,
    url,
    reposUrl,
    eventsUrl,
    hooksUrl,
    issuesUrl,
    membersUrl,
    publicMembersUrl,
    avatarUrl,
    description,
    gravatarId,
    htmlUrl,
    followersUrl,
    followingUrl,
    gistsUrl,
    starredUrl,
    subscriptionsUrl,
    organizationsUrl,
    receivedEventsUrl,
    type,
    siteAdmin,
    userViewType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicyAppsInnerOwner &&
        login == other.login &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        reposUrl == other.reposUrl &&
        eventsUrl == other.eventsUrl &&
        hooksUrl == other.hooksUrl &&
        issuesUrl == other.issuesUrl &&
        membersUrl == other.membersUrl &&
        publicMembersUrl == other.publicMembersUrl &&
        avatarUrl == other.avatarUrl &&
        description == other.description &&
        gravatarId == other.gravatarId &&
        htmlUrl == other.htmlUrl &&
        followersUrl == other.followersUrl &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        starredUrl == other.starredUrl &&
        subscriptionsUrl == other.subscriptionsUrl &&
        organizationsUrl == other.organizationsUrl &&
        receivedEventsUrl == other.receivedEventsUrl &&
        type == other.type &&
        siteAdmin == other.siteAdmin &&
        userViewType == other.userViewType;
  }
}
