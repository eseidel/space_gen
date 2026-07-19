import 'package:github/model_helpers.dart';
import 'package:github/models/private_user_plan.dart';
import 'package:meta/meta.dart';

/// {@template private_user}
/// Private User
/// Private User
/// {@endtemplate}
@immutable
class PrivateUser {
  /// {@macro private_user}
  const PrivateUser({
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
    required this.privateGists,
    required this.totalPrivateRepos,
    required this.ownedPrivateRepos,
    required this.diskUsage,
    required this.collaborators,
    required this.twoFactorAuthentication,
    this.userViewType,
    this.notificationEmail,
    this.twitterUsername,
    this.plan,
    this.businessPlus,
    this.ldapDn,
  });

  /// Converts a `Map<String, dynamic>` to a [PrivateUser].
  factory PrivateUser.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PrivateUser',
      json,
      () => PrivateUser(
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
        privateGists: json['private_gists'] as int,
        totalPrivateRepos: json['total_private_repos'] as int,
        ownedPrivateRepos: json['owned_private_repos'] as int,
        diskUsage: json['disk_usage'] as int,
        collaborators: json['collaborators'] as int,
        twoFactorAuthentication: json['two_factor_authentication'] as bool,
        plan: PrivateUserPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
        businessPlus: json['business_plus'] as bool?,
        ldapDn: json['ldap_dn'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PrivateUser? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PrivateUser.fromJson(json);
  }

  /// Example: `'octocat'`
  final String login;

  /// Example: `1`
  final int id;
  final String? userViewType;

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

  /// Example: `'monalisa octocat'`
  final String? name;

  /// Example: `'GitHub'`
  final String? company;

  /// Example: `'https://github.com/blog'`
  final String? blog;

  /// Example: `'San Francisco'`
  final String? location;

  /// Example: `'octocat@github.com'`
  final String? email;

  /// Example: `'octocat@github.com'`
  final String? notificationEmail;
  final bool? hireable;

  /// Example: `'There once was...'`
  final String? bio;

  /// Example: `'monalisa'`
  final String? twitterUsername;

  /// Example: `2`
  final int publicRepos;

  /// Example: `1`
  final int publicGists;

  /// Example: `20`
  final int followers;

  /// Example: `0`
  final int following;

  /// Example: `'2008-01-14T04:33:35Z'`
  final DateTime createdAt;

  /// Example: `'2008-01-14T04:33:35Z'`
  final DateTime updatedAt;

  /// Example: `81`
  final int privateGists;

  /// Example: `100`
  final int totalPrivateRepos;

  /// Example: `100`
  final int ownedPrivateRepos;

  /// Example: `10000`
  final int diskUsage;

  /// Example: `8`
  final int collaborators;

  /// Example: `true`
  final bool twoFactorAuthentication;
  final PrivateUserPlan? plan;
  final bool? businessPlus;
  final String? ldapDn;

  /// Converts a [PrivateUser] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'user_view_type': ?userViewType,
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
      'private_gists': privateGists,
      'total_private_repos': totalPrivateRepos,
      'owned_private_repos': ownedPrivateRepos,
      'disk_usage': diskUsage,
      'collaborators': collaborators,
      'two_factor_authentication': twoFactorAuthentication,
      'plan': ?plan?.toJson(),
      'business_plus': ?businessPlus,
      'ldap_dn': ?ldapDn,
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
    privateGists,
    totalPrivateRepos,
    ownedPrivateRepos,
    diskUsage,
    collaborators,
    twoFactorAuthentication,
    plan,
    businessPlus,
    ldapDn,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PrivateUser &&
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
        privateGists == other.privateGists &&
        totalPrivateRepos == other.totalPrivateRepos &&
        ownedPrivateRepos == other.ownedPrivateRepos &&
        diskUsage == other.diskUsage &&
        collaborators == other.collaborators &&
        twoFactorAuthentication == other.twoFactorAuthentication &&
        plan == other.plan &&
        businessPlus == other.businessPlus &&
        ldapDn == other.ldapDn;
  }
}
