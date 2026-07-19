import 'package:github/model_helpers.dart';
import 'package:github/models/team_organization_plan.dart';
import 'package:meta/meta.dart';

/// {@template team_organization}
/// Team Organization
/// Team Organization
/// {@endtemplate}
@immutable
class TeamOrganization {
  /// {@macro team_organization}
  const TeamOrganization({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.url,
    required this.reposUrl,
    required this.eventsUrl,
    required this.hooksUrl,
    required this.issuesUrl,
    required this.membersUrl,
    required this.publicMembersUrl,
    required this.avatarUrl,
    required this.description,
    required this.hasOrganizationProjects,
    required this.hasRepositoryProjects,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.htmlUrl,
    required this.createdAt,
    required this.type,
    required this.updatedAt,
    required this.archivedAt,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.email,
    this.twitterUsername,
    this.isVerified,
    this.totalPrivateRepos,
    this.ownedPrivateRepos,
    this.privateGists,
    this.diskUsage,
    this.collaborators,
    this.billingEmail,
    this.plan,
    this.defaultRepositoryPermission,
    this.membersCanCreateRepositories,
    this.twoFactorRequirementEnabled,
    this.membersAllowedRepositoryCreationType,
    this.membersCanCreatePublicRepositories,
    this.membersCanCreatePrivateRepositories,
    this.membersCanCreateInternalRepositories,
    this.membersCanCreatePages,
    this.membersCanCreatePublicPages,
    this.membersCanCreatePrivatePages,
    this.membersCanForkPrivateRepositories,
    this.webCommitSignoffRequired,
  });

  /// Converts a `Map<String, dynamic>` to a [TeamOrganization].
  factory TeamOrganization.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TeamOrganization',
      json,
      () => TeamOrganization(
        login: json['login'] as String,
        id: json['id'] as int,
        nodeId: json['node_id'] as String,
        url: Uri.parse(json['url'] as String),
        reposUrl: Uri.parse(json['repos_url'] as String),
        eventsUrl: Uri.parse(json['events_url'] as String),
        hooksUrl: json['hooks_url'] as String,
        issuesUrl: json['issues_url'] as String,
        membersUrl: json['members_url'] as String,
        publicMembersUrl: json['public_members_url'] as String,
        avatarUrl: json['avatar_url'] as String,
        description: checkedKey(json, 'description') as String?,
        name: json['name'] as String?,
        company: json['company'] as String?,
        blog: maybeParseUri(json['blog'] as String?),
        location: json['location'] as String?,
        email: json['email'] as String?,
        twitterUsername: json['twitter_username'] as String?,
        isVerified: json['is_verified'] as bool?,
        hasOrganizationProjects: json['has_organization_projects'] as bool,
        hasRepositoryProjects: json['has_repository_projects'] as bool,
        publicRepos: json['public_repos'] as int,
        publicGists: json['public_gists'] as int,
        followers: json['followers'] as int,
        following: json['following'] as int,
        htmlUrl: Uri.parse(json['html_url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        type: json['type'] as String,
        totalPrivateRepos: json['total_private_repos'] as int?,
        ownedPrivateRepos: json['owned_private_repos'] as int?,
        privateGists: json['private_gists'] as int?,
        diskUsage: json['disk_usage'] as int?,
        collaborators: json['collaborators'] as int?,
        billingEmail: json['billing_email'] as String?,
        plan: TeamOrganizationPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
        defaultRepositoryPermission:
            json['default_repository_permission'] as String?,
        membersCanCreateRepositories:
            json['members_can_create_repositories'] as bool?,
        twoFactorRequirementEnabled:
            json['two_factor_requirement_enabled'] as bool?,
        membersAllowedRepositoryCreationType:
            json['members_allowed_repository_creation_type'] as String?,
        membersCanCreatePublicRepositories:
            json['members_can_create_public_repositories'] as bool?,
        membersCanCreatePrivateRepositories:
            json['members_can_create_private_repositories'] as bool?,
        membersCanCreateInternalRepositories:
            json['members_can_create_internal_repositories'] as bool?,
        membersCanCreatePages: json['members_can_create_pages'] as bool?,
        membersCanCreatePublicPages:
            json['members_can_create_public_pages'] as bool?,
        membersCanCreatePrivatePages:
            json['members_can_create_private_pages'] as bool?,
        membersCanForkPrivateRepositories:
            json['members_can_fork_private_repositories'] as bool?,
        webCommitSignoffRequired: json['web_commit_signoff_required'] as bool?,
        updatedAt: DateTime.parse(json['updated_at'] as String),
        archivedAt: maybeParseDateTime(
          checkedKey(json, 'archived_at') as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TeamOrganization? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TeamOrganization.fromJson(json);
  }

  /// Example: `'github'`
  final String login;

  /// Example: `1`
  final int id;

  /// Example: `'MDEyOk9yZ2FuaXphdGlvbjE='`
  final String nodeId;

  /// Example: `'https://api.github.com/orgs/github'`
  final Uri url;

  /// Example: `'https://api.github.com/orgs/github/repos'`
  final Uri reposUrl;

  /// Example: `'https://api.github.com/orgs/github/events'`
  final Uri eventsUrl;

  /// Example: `'https://api.github.com/orgs/github/hooks'`
  final String hooksUrl;

  /// Example: `'https://api.github.com/orgs/github/issues'`
  final String issuesUrl;

  /// Example: `'https://api.github.com/orgs/github/members{/member}'`
  final String membersUrl;

  /// Example: `'https://api.github.com/orgs/github/public_members{/member}'`
  final String publicMembersUrl;

  /// Example: `'https://github.com/images/error/octocat_happy.gif'`
  final String avatarUrl;

  /// Example: `'A great organization'`
  final String? description;

  /// Example: `'github'`
  final String? name;

  /// Example: `'GitHub'`
  final String? company;

  /// Example: `'https://github.com/blog'`
  final Uri? blog;

  /// Example: `'San Francisco'`
  final String? location;

  /// Example: `'octocat@github.com'`
  final String? email;

  /// Example: `'github'`
  final String? twitterUsername;

  /// Example: `true`
  final bool? isVerified;

  /// Example: `true`
  final bool hasOrganizationProjects;

  /// Example: `true`
  final bool hasRepositoryProjects;

  /// Example: `2`
  final int publicRepos;

  /// Example: `1`
  final int publicGists;

  /// Example: `20`
  final int followers;

  /// Example: `0`
  final int following;

  /// Example: `'https://github.com/octocat'`
  final Uri htmlUrl;

  /// Example: `'2008-01-14T04:33:35Z'`
  final DateTime createdAt;

  /// Example: `'Organization'`
  final String type;

  /// Example: `100`
  final int? totalPrivateRepos;

  /// Example: `100`
  final int? ownedPrivateRepos;

  /// Example: `81`
  final int? privateGists;

  /// Example: `10000`
  final int? diskUsage;

  /// Example: `8`
  final int? collaborators;

  /// Example: `'org@example.com'`
  final String? billingEmail;
  final TeamOrganizationPlan? plan;
  final String? defaultRepositoryPermission;

  /// Example: `true`
  final bool? membersCanCreateRepositories;

  /// Example: `true`
  final bool? twoFactorRequirementEnabled;

  /// Example: `'all'`
  final String? membersAllowedRepositoryCreationType;

  /// Example: `true`
  final bool? membersCanCreatePublicRepositories;

  /// Example: `true`
  final bool? membersCanCreatePrivateRepositories;

  /// Example: `true`
  final bool? membersCanCreateInternalRepositories;

  /// Example: `true`
  final bool? membersCanCreatePages;

  /// Example: `true`
  final bool? membersCanCreatePublicPages;

  /// Example: `true`
  final bool? membersCanCreatePrivatePages;

  /// Example: `false`
  final bool? membersCanForkPrivateRepositories;

  /// Example: `false`
  final bool? webCommitSignoffRequired;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  /// Converts a [TeamOrganization] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'id': id,
      'node_id': nodeId,
      'url': url.toString(),
      'repos_url': reposUrl.toString(),
      'events_url': eventsUrl.toString(),
      'hooks_url': hooksUrl,
      'issues_url': issuesUrl,
      'members_url': membersUrl,
      'public_members_url': publicMembersUrl,
      'avatar_url': avatarUrl,
      'description': description,
      if (name != null) 'name': name,
      if (company != null) 'company': company,
      if (blog != null) 'blog': blog?.toString(),
      if (location != null) 'location': location,
      if (email != null) 'email': email,
      'twitter_username': twitterUsername,
      if (isVerified != null) 'is_verified': isVerified,
      'has_organization_projects': hasOrganizationProjects,
      'has_repository_projects': hasRepositoryProjects,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'html_url': htmlUrl.toString(),
      'created_at': createdAt.toIso8601String(),
      'type': type,
      if (totalPrivateRepos != null) 'total_private_repos': totalPrivateRepos,
      if (ownedPrivateRepos != null) 'owned_private_repos': ownedPrivateRepos,
      'private_gists': privateGists,
      'disk_usage': diskUsage,
      'collaborators': collaborators,
      'billing_email': billingEmail,
      if (plan != null) 'plan': plan?.toJson(),
      'default_repository_permission': defaultRepositoryPermission,
      'members_can_create_repositories': membersCanCreateRepositories,
      'two_factor_requirement_enabled': twoFactorRequirementEnabled,
      if (membersAllowedRepositoryCreationType != null)
        'members_allowed_repository_creation_type':
            membersAllowedRepositoryCreationType,
      if (membersCanCreatePublicRepositories != null)
        'members_can_create_public_repositories':
            membersCanCreatePublicRepositories,
      if (membersCanCreatePrivateRepositories != null)
        'members_can_create_private_repositories':
            membersCanCreatePrivateRepositories,
      if (membersCanCreateInternalRepositories != null)
        'members_can_create_internal_repositories':
            membersCanCreateInternalRepositories,
      if (membersCanCreatePages != null)
        'members_can_create_pages': membersCanCreatePages,
      if (membersCanCreatePublicPages != null)
        'members_can_create_public_pages': membersCanCreatePublicPages,
      if (membersCanCreatePrivatePages != null)
        'members_can_create_private_pages': membersCanCreatePrivatePages,
      'members_can_fork_private_repositories':
          membersCanForkPrivateRepositories,
      if (webCommitSignoffRequired != null)
        'web_commit_signoff_required': webCommitSignoffRequired,
      'updated_at': updatedAt.toIso8601String(),
      'archived_at': archivedAt?.toIso8601String(),
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
    name,
    company,
    blog,
    location,
    email,
    twitterUsername,
    isVerified,
    hasOrganizationProjects,
    hasRepositoryProjects,
    publicRepos,
    publicGists,
    followers,
    following,
    htmlUrl,
    createdAt,
    type,
    totalPrivateRepos,
    ownedPrivateRepos,
    privateGists,
    diskUsage,
    collaborators,
    billingEmail,
    plan,
    defaultRepositoryPermission,
    membersCanCreateRepositories,
    twoFactorRequirementEnabled,
    membersAllowedRepositoryCreationType,
    membersCanCreatePublicRepositories,
    membersCanCreatePrivateRepositories,
    membersCanCreateInternalRepositories,
    membersCanCreatePages,
    membersCanCreatePublicPages,
    membersCanCreatePrivatePages,
    membersCanForkPrivateRepositories,
    webCommitSignoffRequired,
    updatedAt,
    archivedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamOrganization &&
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
        name == other.name &&
        company == other.company &&
        blog == other.blog &&
        location == other.location &&
        email == other.email &&
        twitterUsername == other.twitterUsername &&
        isVerified == other.isVerified &&
        hasOrganizationProjects == other.hasOrganizationProjects &&
        hasRepositoryProjects == other.hasRepositoryProjects &&
        publicRepos == other.publicRepos &&
        publicGists == other.publicGists &&
        followers == other.followers &&
        following == other.following &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        type == other.type &&
        totalPrivateRepos == other.totalPrivateRepos &&
        ownedPrivateRepos == other.ownedPrivateRepos &&
        privateGists == other.privateGists &&
        diskUsage == other.diskUsage &&
        collaborators == other.collaborators &&
        billingEmail == other.billingEmail &&
        plan == other.plan &&
        defaultRepositoryPermission == other.defaultRepositoryPermission &&
        membersCanCreateRepositories == other.membersCanCreateRepositories &&
        twoFactorRequirementEnabled == other.twoFactorRequirementEnabled &&
        membersAllowedRepositoryCreationType ==
            other.membersAllowedRepositoryCreationType &&
        membersCanCreatePublicRepositories ==
            other.membersCanCreatePublicRepositories &&
        membersCanCreatePrivateRepositories ==
            other.membersCanCreatePrivateRepositories &&
        membersCanCreateInternalRepositories ==
            other.membersCanCreateInternalRepositories &&
        membersCanCreatePages == other.membersCanCreatePages &&
        membersCanCreatePublicPages == other.membersCanCreatePublicPages &&
        membersCanCreatePrivatePages == other.membersCanCreatePrivatePages &&
        membersCanForkPrivateRepositories ==
            other.membersCanForkPrivateRepositories &&
        webCommitSignoffRequired == other.webCommitSignoffRequired &&
        updatedAt == other.updatedAt &&
        archivedAt == other.archivedAt;
  }
}
