import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';
import 'package:uri/uri.dart';

@immutable
class Root {
  const Root({
    required this.currentUserUrl,
    required this.currentUserAuthorizationsHtmlUrl,
    required this.authorizationsUrl,
    required this.codeSearchUrl,
    required this.commitSearchUrl,
    required this.emailsUrl,
    required this.emojisUrl,
    required this.eventsUrl,
    required this.feedsUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.issueSearchUrl,
    required this.issuesUrl,
    required this.keysUrl,
    required this.labelSearchUrl,
    required this.notificationsUrl,
    required this.organizationUrl,
    required this.organizationRepositoriesUrl,
    required this.organizationTeamsUrl,
    required this.publicGistsUrl,
    required this.rateLimitUrl,
    required this.repositoryUrl,
    required this.repositorySearchUrl,
    required this.currentUserRepositoriesUrl,
    required this.starredUrl,
    required this.starredGistsUrl,
    required this.userUrl,
    required this.userOrganizationsUrl,
    required this.userRepositoriesUrl,
    required this.userSearchUrl,
    @deprecated this.hubUrl,
    this.topicSearchUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [Root].
  factory Root.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Root',
      json,
      () => Root(
        currentUserUrl: UriTemplate(json['current_user_url'] as String),
        currentUserAuthorizationsHtmlUrl: UriTemplate(
          json['current_user_authorizations_html_url'] as String,
        ),
        authorizationsUrl: UriTemplate(json['authorizations_url'] as String),
        codeSearchUrl: UriTemplate(json['code_search_url'] as String),
        commitSearchUrl: UriTemplate(json['commit_search_url'] as String),
        emailsUrl: UriTemplate(json['emails_url'] as String),
        emojisUrl: UriTemplate(json['emojis_url'] as String),
        eventsUrl: UriTemplate(json['events_url'] as String),
        feedsUrl: UriTemplate(json['feeds_url'] as String),
        followersUrl: UriTemplate(json['followers_url'] as String),
        followingUrl: UriTemplate(json['following_url'] as String),
        gistsUrl: UriTemplate(json['gists_url'] as String),
        hubUrl: maybeParseUriTemplate(json['hub_url'] as String?),
        issueSearchUrl: UriTemplate(json['issue_search_url'] as String),
        issuesUrl: UriTemplate(json['issues_url'] as String),
        keysUrl: UriTemplate(json['keys_url'] as String),
        labelSearchUrl: UriTemplate(json['label_search_url'] as String),
        notificationsUrl: UriTemplate(json['notifications_url'] as String),
        organizationUrl: UriTemplate(json['organization_url'] as String),
        organizationRepositoriesUrl: UriTemplate(
          json['organization_repositories_url'] as String,
        ),
        organizationTeamsUrl: UriTemplate(
          json['organization_teams_url'] as String,
        ),
        publicGistsUrl: UriTemplate(json['public_gists_url'] as String),
        rateLimitUrl: UriTemplate(json['rate_limit_url'] as String),
        repositoryUrl: UriTemplate(json['repository_url'] as String),
        repositorySearchUrl: UriTemplate(
          json['repository_search_url'] as String,
        ),
        currentUserRepositoriesUrl: UriTemplate(
          json['current_user_repositories_url'] as String,
        ),
        starredUrl: UriTemplate(json['starred_url'] as String),
        starredGistsUrl: UriTemplate(json['starred_gists_url'] as String),
        topicSearchUrl: maybeParseUriTemplate(
          json['topic_search_url'] as String?,
        ),
        userUrl: UriTemplate(json['user_url'] as String),
        userOrganizationsUrl: UriTemplate(
          json['user_organizations_url'] as String,
        ),
        userRepositoriesUrl: UriTemplate(
          json['user_repositories_url'] as String,
        ),
        userSearchUrl: UriTemplate(json['user_search_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Root? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Root.fromJson(json);
  }

  final UriTemplate currentUserUrl;
  final UriTemplate currentUserAuthorizationsHtmlUrl;
  final UriTemplate authorizationsUrl;
  final UriTemplate codeSearchUrl;
  final UriTemplate commitSearchUrl;
  final UriTemplate emailsUrl;
  final UriTemplate emojisUrl;
  final UriTemplate eventsUrl;
  final UriTemplate feedsUrl;
  final UriTemplate followersUrl;
  final UriTemplate followingUrl;
  final UriTemplate gistsUrl;
  @deprecated
  final UriTemplate? hubUrl;
  final UriTemplate issueSearchUrl;
  final UriTemplate issuesUrl;
  final UriTemplate keysUrl;
  final UriTemplate labelSearchUrl;
  final UriTemplate notificationsUrl;
  final UriTemplate organizationUrl;
  final UriTemplate organizationRepositoriesUrl;
  final UriTemplate organizationTeamsUrl;
  final UriTemplate publicGistsUrl;
  final UriTemplate rateLimitUrl;
  final UriTemplate repositoryUrl;
  final UriTemplate repositorySearchUrl;
  final UriTemplate currentUserRepositoriesUrl;
  final UriTemplate starredUrl;
  final UriTemplate starredGistsUrl;
  final UriTemplate? topicSearchUrl;
  final UriTemplate userUrl;
  final UriTemplate userOrganizationsUrl;
  final UriTemplate userRepositoriesUrl;
  final UriTemplate userSearchUrl;

  /// Converts a [Root] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'current_user_url': currentUserUrl.toString(),
      'current_user_authorizations_html_url': currentUserAuthorizationsHtmlUrl
          .toString(),
      'authorizations_url': authorizationsUrl.toString(),
      'code_search_url': codeSearchUrl.toString(),
      'commit_search_url': commitSearchUrl.toString(),
      'emails_url': emailsUrl.toString(),
      'emojis_url': emojisUrl.toString(),
      'events_url': eventsUrl.toString(),
      'feeds_url': feedsUrl.toString(),
      'followers_url': followersUrl.toString(),
      'following_url': followingUrl.toString(),
      'gists_url': gistsUrl.toString(),
      if (hubUrl != null) 'hub_url': hubUrl?.toString(),
      'issue_search_url': issueSearchUrl.toString(),
      'issues_url': issuesUrl.toString(),
      'keys_url': keysUrl.toString(),
      'label_search_url': labelSearchUrl.toString(),
      'notifications_url': notificationsUrl.toString(),
      'organization_url': organizationUrl.toString(),
      'organization_repositories_url': organizationRepositoriesUrl.toString(),
      'organization_teams_url': organizationTeamsUrl.toString(),
      'public_gists_url': publicGistsUrl.toString(),
      'rate_limit_url': rateLimitUrl.toString(),
      'repository_url': repositoryUrl.toString(),
      'repository_search_url': repositorySearchUrl.toString(),
      'current_user_repositories_url': currentUserRepositoriesUrl.toString(),
      'starred_url': starredUrl.toString(),
      'starred_gists_url': starredGistsUrl.toString(),
      if (topicSearchUrl != null)
        'topic_search_url': topicSearchUrl?.toString(),
      'user_url': userUrl.toString(),
      'user_organizations_url': userOrganizationsUrl.toString(),
      'user_repositories_url': userRepositoriesUrl.toString(),
      'user_search_url': userSearchUrl.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    currentUserUrl,
    currentUserAuthorizationsHtmlUrl,
    authorizationsUrl,
    codeSearchUrl,
    commitSearchUrl,
    emailsUrl,
    emojisUrl,
    eventsUrl,
    feedsUrl,
    followersUrl,
    followingUrl,
    gistsUrl,
    hubUrl,
    issueSearchUrl,
    issuesUrl,
    keysUrl,
    labelSearchUrl,
    notificationsUrl,
    organizationUrl,
    organizationRepositoriesUrl,
    organizationTeamsUrl,
    publicGistsUrl,
    rateLimitUrl,
    repositoryUrl,
    repositorySearchUrl,
    currentUserRepositoriesUrl,
    starredUrl,
    starredGistsUrl,
    topicSearchUrl,
    userUrl,
    userOrganizationsUrl,
    userRepositoriesUrl,
    userSearchUrl,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Root &&
        currentUserUrl == other.currentUserUrl &&
        currentUserAuthorizationsHtmlUrl ==
            other.currentUserAuthorizationsHtmlUrl &&
        authorizationsUrl == other.authorizationsUrl &&
        codeSearchUrl == other.codeSearchUrl &&
        commitSearchUrl == other.commitSearchUrl &&
        emailsUrl == other.emailsUrl &&
        emojisUrl == other.emojisUrl &&
        eventsUrl == other.eventsUrl &&
        feedsUrl == other.feedsUrl &&
        followersUrl == other.followersUrl &&
        followingUrl == other.followingUrl &&
        gistsUrl == other.gistsUrl &&
        hubUrl == other.hubUrl &&
        issueSearchUrl == other.issueSearchUrl &&
        issuesUrl == other.issuesUrl &&
        keysUrl == other.keysUrl &&
        labelSearchUrl == other.labelSearchUrl &&
        notificationsUrl == other.notificationsUrl &&
        organizationUrl == other.organizationUrl &&
        organizationRepositoriesUrl == other.organizationRepositoriesUrl &&
        organizationTeamsUrl == other.organizationTeamsUrl &&
        publicGistsUrl == other.publicGistsUrl &&
        rateLimitUrl == other.rateLimitUrl &&
        repositoryUrl == other.repositoryUrl &&
        repositorySearchUrl == other.repositorySearchUrl &&
        currentUserRepositoriesUrl == other.currentUserRepositoriesUrl &&
        starredUrl == other.starredUrl &&
        starredGistsUrl == other.starredGistsUrl &&
        topicSearchUrl == other.topicSearchUrl &&
        userUrl == other.userUrl &&
        userOrganizationsUrl == other.userOrganizationsUrl &&
        userRepositoriesUrl == other.userRepositoriesUrl &&
        userSearchUrl == other.userSearchUrl;
  }
}
