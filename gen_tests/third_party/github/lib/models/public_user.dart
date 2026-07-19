import 'package:github/model_helpers.dart';
import 'package:github/models/public_user_plan.dart';
import 'package:meta/meta.dart';

/// {@template public_user}
/// Public User
/// Public User
/// {@endtemplate}
@immutable
class PublicUser {
  /// {@macro public_user}
  const PublicUser({
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
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
    this.userViewType,
    this.notificationEmail,
    this.twitterUsername,
    this.plan,
    this.privateGists,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
    this.diskUsage,
    this.collaborators,
  });

  /// Converts a `Map<String, dynamic>` to a [PublicUser].
  factory PublicUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PublicUser',
      json,
      () => PublicUser(
        login: json['login'] as String,
        id: json['id'] as int,
        userViewType: json['user_view_type'] as String?,
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
        name: checkedKey(json, 'name') as String?,
        company: checkedKey(json, 'company') as String?,
        blog: checkedKey(json, 'blog') as String?,
        location: checkedKey(json, 'location') as String?,
        email: checkedKey(json, 'email') as String?,
        notificationEmail: json['notification_email'] as String?,
        hireable: checkedKey(json, 'hireable') as bool?,
        bio: checkedKey(json, 'bio') as String?,
        twitterUsername: json['twitter_username'] as String?,
        publicRepos: json['public_repos'] as int,
        publicGists: json['public_gists'] as int,
        followers: json['followers'] as int,
        following: json['following'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        plan: PublicUserPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
        privateGists: json['private_gists'] as int?,
        totalPrivateRepos: json['total_private_repos'] as int?,
        ownedPrivateRepos: json['owned_private_repos'] as int?,
        diskUsage: json['disk_usage'] as int?,
        collaborators: json['collaborators'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PublicUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PublicUser.fromJson(json);
  }

  final String login;
  final int id;
  final String? userViewType;
  final String nodeId;
  final Uri avatarUrl;
  final String? gravatarId;
  final Uri url;
  final Uri htmlUrl;
  final Uri followersUrl;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final Uri subscriptionsUrl;
  final Uri organizationsUrl;
  final Uri reposUrl;
  final String eventsUrl;
  final Uri receivedEventsUrl;
  final String type;
  final bool siteAdmin;
  final String? name;
  final String? company;
  final String? blog;
  final String? location;
  final String? email;
  final String? notificationEmail;
  final bool? hireable;
  final String? bio;
  final String? twitterUsername;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PublicUserPlan? plan;

  /// Example: `1`
  final int? privateGists;

  /// Example: `2`
  final int? totalPrivateRepos;

  /// Example: `2`
  final int? ownedPrivateRepos;

  /// Example: `1`
  final int? diskUsage;

  /// Example: `3`
  final int? collaborators;

  /// Converts a [PublicUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'user_view_type': userViewType,
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
      'name': name,
      'company': company,
      'blog': blog,
      'location': location,
      'email': email,
      'notification_email': notificationEmail,
      'hireable': hireable,
      'bio': bio,
      'twitter_username': twitterUsername,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'plan': plan?.toJson(),
      'private_gists': privateGists,
      'total_private_repos': totalPrivateRepos,
      'owned_private_repos': ownedPrivateRepos,
      'disk_usage': diskUsage,
      'collaborators': collaborators,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    login,
    id,
    userViewType,
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
    name,
    company,
    blog,
    location,
    email,
    notificationEmail,
    hireable,
    bio,
    twitterUsername,
    publicRepos,
    publicGists,
    followers,
    following,
    createdAt,
    updatedAt,
    plan,
    privateGists,
    totalPrivateRepos,
    ownedPrivateRepos,
    diskUsage,
    collaborators,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PublicUser &&
        login == other.login &&
        id == other.id &&
        userViewType == other.userViewType &&
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
        name == other.name &&
        company == other.company &&
        blog == other.blog &&
        location == other.location &&
        email == other.email &&
        notificationEmail == other.notificationEmail &&
        hireable == other.hireable &&
        bio == other.bio &&
        twitterUsername == other.twitterUsername &&
        publicRepos == other.publicRepos &&
        publicGists == other.publicGists &&
        followers == other.followers &&
        following == other.following &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        plan == other.plan &&
        privateGists == other.privateGists &&
        totalPrivateRepos == other.totalPrivateRepos &&
        ownedPrivateRepos == other.ownedPrivateRepos &&
        diskUsage == other.diskUsage &&
        collaborators == other.collaborators;
  }
}
