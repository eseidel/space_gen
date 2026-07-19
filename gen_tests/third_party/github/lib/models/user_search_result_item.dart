import 'package:github/model_helpers.dart';
import 'package:github/models/search_result_text_matches_inner.dart';
import 'package:meta/meta.dart';

/// {@template user_search_result_item}
/// User Search Result Item
/// User Search Result Item
/// {@endtemplate}
@immutable
class UserSearchResultItem {
  /// {@macro user_search_result_item}
  const UserSearchResultItem({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.score,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.eventsUrl,
    required this.siteAdmin,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.bio,
    this.email,
    this.location,
    this.hireable,
    this.textMatches,
    this.blog,
    this.company,
    this.suspendedAt,
    this.userViewType,
  });

  /// Converts a `Map<String, dynamic>` to a [UserSearchResultItem].
  factory UserSearchResultItem.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UserSearchResultItem',
      json,
      () => UserSearchResultItem(
        login: json['login'] as String,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        avatarUrl: Uri.parse(json['avatar_url'] as String),
        gravatarId: checkedKey(json, 'gravatar_id') as String?,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        followersUrl: Uri.parse(json['followers_url'] as String),
        subscriptionsUrl: Uri.parse(json['subscriptions_url'] as String),
        organizationsUrl: Uri.parse(json['organizations_url'] as String),
        reposUrl: Uri.parse(json['repos_url'] as String),
        receivedEventsUrl: Uri.parse(json['received_events_url'] as String),
        type: json['type'] as String,
        score: (json['score'] as num).toDouble(),
        followingUrl: json['following_url'] as String,
        gistsUrl: json['gists_url'] as String,
        starredUrl: json['starred_url'] as String,
        eventsUrl: json['events_url'] as String,
        publicRepos: json['public_repos'] as int?,
        publicGists: json['public_gists'] as int?,
        followers: json['followers'] as int?,
        following: json['following'] as int?,
        createdAt: maybeParseDateTime(json['created_at'] as String?),
        updatedAt: maybeParseDateTime(json['updated_at'] as String?),
        name: json['name'] as String?,
        bio: json['bio'] as String?,
        email: json['email'] as String?,
        location: json['location'] as String?,
        siteAdmin: json['site_admin'] as bool,
        hireable: json['hireable'] as bool?,
        textMatches: (json['text_matches'] as List?)
            ?.map<SearchResultTextMatchesInner>(
              (e) => SearchResultTextMatchesInner.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
        blog: json['blog'] as String?,
        company: json['company'] as String?,
        suspendedAt: maybeParseDateTime(json['suspended_at'] as String?),
        userViewType: json['user_view_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserSearchResultItem? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UserSearchResultItem.fromJson(json);
  }

  final String login;
  final int id;
  final String nodeId;
  final Uri avatarUrl;
  final String? gravatarId;
  final Uri url;
  final Uri htmlUrl;
  final Uri followersUrl;
  final Uri subscriptionsUrl;
  final Uri organizationsUrl;
  final Uri reposUrl;
  final Uri receivedEventsUrl;
  final String type;
  final double score;
  final String followingUrl;
  final String gistsUrl;
  final String starredUrl;
  final String eventsUrl;
  final int? publicRepos;
  final int? publicGists;
  final int? followers;
  final int? following;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final String? bio;
  final String? email;
  final String? location;
  final bool siteAdmin;
  final bool? hireable;

  /// Search Result Text Matches
  final List<SearchResultTextMatchesInner>? textMatches;
  final String? blog;
  final String? company;
  final DateTime? suspendedAt;
  final String? userViewType;

  /// Converts a [UserSearchResultItem] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'avatar_url': avatarUrl.toString(),
      'gravatar_id': gravatarId,
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'followers_url': followersUrl.toString(),
      'subscriptions_url': subscriptionsUrl.toString(),
      'organizations_url': organizationsUrl.toString(),
      'repos_url': reposUrl.toString(),
      'received_events_url': receivedEventsUrl.toString(),
      'type': type,
      'score': score,
      'following_url': followingUrl,
      'gists_url': gistsUrl,
      'starred_url': starredUrl,
      'events_url': eventsUrl,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'name': name,
      'bio': bio,
      'email': email,
      'location': location,
      'site_admin': siteAdmin,
      'hireable': hireable,
      'text_matches': textMatches?.map((e) => e.toJson()).toList(),
      'blog': blog,
      'company': company,
      'suspended_at': suspendedAt?.toIso8601String(),
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
    subscriptionsUrl,
    organizationsUrl,
    reposUrl,
    receivedEventsUrl,
    type,
    score,
    followingUrl,
    gistsUrl,
    starredUrl,
    eventsUrl,
    publicRepos,
    publicGists,
    followers,
    following,
    createdAt,
    updatedAt,
    name,
    bio,
    email,
    location,
    siteAdmin,
    hireable,
    listHash(textMatches),
    blog,
    company,
    suspendedAt,
    userViewType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserSearchResultItem &&
        login == other.login &&
        id == other.id &&
        nodeId == other.nodeId &&
        avatarUrl == other.avatarUrl &&
        gravatarId == other.gravatarId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        followersUrl == other.followersUrl &&
        subscriptionsUrl == other.subscriptionsUrl &&
        organizationsUrl == other.organizationsUrl &&
        reposUrl == other.reposUrl &&
        receivedEventsUrl == other.receivedEventsUrl &&
        type == other.type &&
        score == other.score &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        starredUrl == other.starredUrl &&
        eventsUrl == other.eventsUrl &&
        publicRepos == other.publicRepos &&
        publicGists == other.publicGists &&
        followers == other.followers &&
        following == other.following &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        name == other.name &&
        bio == other.bio &&
        email == other.email &&
        location == other.location &&
        siteAdmin == other.siteAdmin &&
        hireable == other.hireable &&
        listsEqual(textMatches, other.textMatches) &&
        blog == other.blog &&
        company == other.company &&
        suspendedAt == other.suspendedAt &&
        userViewType == other.userViewType;
  }
}
