import 'package:github/model_helpers.dart';
import 'package:github/models/organization_full_plan.dart';
import 'package:meta/meta.dart';

/// {@template organization_full}
/// Organization Full
/// Organization Full
/// {@endtemplate}
@immutable
class OrganizationFull {
  /// {@macro organization_full}
  const OrganizationFull({
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
    required this.type,
    required this.createdAt,
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
    this.defaultRepositoryBranch,
    this.membersCanCreateRepositories,
    this.twoFactorRequirementEnabled,
    this.membersAllowedRepositoryCreationType,
    this.membersCanCreatePublicRepositories,
    this.membersCanCreatePrivateRepositories,
    this.membersCanCreateInternalRepositories,
    this.membersCanCreatePages,
    this.membersCanCreatePublicPages,
    this.membersCanCreatePrivatePages,
    this.membersCanDeleteRepositories,
    this.membersCanChangeRepoVisibility,
    this.membersCanInviteOutsideCollaborators,
    this.membersCanDeleteIssues,
    this.displayCommenterFullNameSettingEnabled,
    this.readersCanCreateDiscussions,
    this.membersCanCreateTeams,
    this.membersCanViewDependencyInsights,
    this.membersCanForkPrivateRepositories,
    this.webCommitSignoffRequired,
    @deprecated this.advancedSecurityEnabledForNewRepositories,
    @deprecated this.dependabotAlertsEnabledForNewRepositories,
    @deprecated this.dependabotSecurityUpdatesEnabledForNewRepositories,
    @deprecated this.dependencyGraphEnabledForNewRepositories,
    @deprecated this.secretScanningEnabledForNewRepositories,
    @deprecated this.secretScanningPushProtectionEnabledForNewRepositories,
    this.secretScanningPushProtectionCustomLinkEnabled,
    this.secretScanningPushProtectionCustomLink,
    this.deployKeysEnabledForRepositories,
  });

  /// Converts a `Map<String, dynamic>` to an [OrganizationFull].
  factory OrganizationFull.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrganizationFull',
      json,
      () => OrganizationFull(
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
        type: json['type'] as String,
        totalPrivateRepos: json['total_private_repos'] as int?,
        ownedPrivateRepos: json['owned_private_repos'] as int?,
        privateGists: json['private_gists'] as int?,
        diskUsage: json['disk_usage'] as int?,
        collaborators: json['collaborators'] as int?,
        billingEmail: json['billing_email'] as String?,
        plan: OrganizationFullPlan.maybeFromJson(
          json['plan'] as Map<String, dynamic>?,
        ),
        defaultRepositoryPermission:
            json['default_repository_permission'] as String?,
        defaultRepositoryBranch: json['default_repository_branch'] as String?,
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
        membersCanDeleteRepositories:
            json['members_can_delete_repositories'] as bool?,
        membersCanChangeRepoVisibility:
            json['members_can_change_repo_visibility'] as bool?,
        membersCanInviteOutsideCollaborators:
            json['members_can_invite_outside_collaborators'] as bool?,
        membersCanDeleteIssues: json['members_can_delete_issues'] as bool?,
        displayCommenterFullNameSettingEnabled:
            json['display_commenter_full_name_setting_enabled'] as bool?,
        readersCanCreateDiscussions:
            json['readers_can_create_discussions'] as bool?,
        membersCanCreateTeams: json['members_can_create_teams'] as bool?,
        membersCanViewDependencyInsights:
            json['members_can_view_dependency_insights'] as bool?,
        membersCanForkPrivateRepositories:
            json['members_can_fork_private_repositories'] as bool?,
        webCommitSignoffRequired: json['web_commit_signoff_required'] as bool?,
        advancedSecurityEnabledForNewRepositories:
            json['advanced_security_enabled_for_new_repositories'] as bool?,
        dependabotAlertsEnabledForNewRepositories:
            json['dependabot_alerts_enabled_for_new_repositories'] as bool?,
        dependabotSecurityUpdatesEnabledForNewRepositories:
            json['dependabot_security_updates_enabled_for_new_repositories']
                as bool?,
        dependencyGraphEnabledForNewRepositories:
            json['dependency_graph_enabled_for_new_repositories'] as bool?,
        secretScanningEnabledForNewRepositories:
            json['secret_scanning_enabled_for_new_repositories'] as bool?,
        secretScanningPushProtectionEnabledForNewRepositories:
            json['secret_scanning_push_protection_enabled_for_new_repositories']
                as bool?,
        secretScanningPushProtectionCustomLinkEnabled:
            json['secret_scanning_push_protection_custom_link_enabled']
                as bool?,
        secretScanningPushProtectionCustomLink:
            json['secret_scanning_push_protection_custom_link'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        archivedAt: maybeParseDateTime(
          checkedKey(json, 'archived_at') as String?,
        ),
        deployKeysEnabledForRepositories:
            json['deploy_keys_enabled_for_repositories'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrganizationFull? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrganizationFull.fromJson(json);
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

  /// The number of collaborators on private repositories.
  ///
  /// This field may be null if the number of private repositories is over
  /// 50,000.
  /// Example: `8`
  final int? collaborators;

  /// Example: `'org@example.com'`
  final String? billingEmail;
  final OrganizationFullPlan? plan;
  final String? defaultRepositoryPermission;

  /// The default branch for repositories created in this organization.
  /// Example: `'main'`
  final String? defaultRepositoryBranch;

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

  /// Example: `true`
  final bool? membersCanDeleteRepositories;

  /// Example: `true`
  final bool? membersCanChangeRepoVisibility;

  /// Example: `true`
  final bool? membersCanInviteOutsideCollaborators;

  /// Example: `true`
  final bool? membersCanDeleteIssues;

  /// Example: `true`
  final bool? displayCommenterFullNameSettingEnabled;

  /// Example: `true`
  final bool? readersCanCreateDiscussions;

  /// Example: `true`
  final bool? membersCanCreateTeams;

  /// Example: `true`
  final bool? membersCanViewDependencyInsights;

  /// Example: `false`
  final bool? membersCanForkPrivateRepositories;

  /// Example: `false`
  final bool? webCommitSignoffRequired;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether GitHub Advanced Security is enabled for new repositories and
  /// repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? advancedSecurityEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether Dependabot alerts are automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? dependabotAlertsEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether Dependabot security updates are automatically enabled for new
  /// repositories and repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? dependabotSecurityUpdatesEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether dependency graph is automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? dependencyGraphEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether secret scanning is automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? secretScanningEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether secret scanning push protection is automatically enabled for new
  /// repositories and repositories transferred to this organization.
  ///
  /// This field is only visible to organization owners or members of a team
  /// with the security manager role.
  /// Example: `false`
  @deprecated
  final bool? secretScanningPushProtectionEnabledForNewRepositories;

  /// Whether a custom link is shown to contributors who are blocked from
  /// pushing a secret by push protection.
  /// Example: `false`
  final bool? secretScanningPushProtectionCustomLinkEnabled;

  /// An optional URL string to display to contributors who are blocked from
  /// pushing a secret.
  /// Example: `'https://github.com/test-org/test-repo/blob/main/README.md'`
  final String? secretScanningPushProtectionCustomLink;

  /// Example: `'2008-01-14T04:33:35Z'`
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  /// Controls whether or not deploy keys may be added and used for
  /// repositories in the organization.
  /// Example: `false`
  final bool? deployKeysEnabledForRepositories;

  /// Converts an [OrganizationFull] to a `Map<String, dynamic>`.
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
      'name': ?name,
      'company': ?company,
      'blog': ?blog?.toString(),
      'location': ?location,
      'email': ?email,
      'twitter_username': twitterUsername,
      'is_verified': ?isVerified,
      'has_organization_projects': hasOrganizationProjects,
      'has_repository_projects': hasRepositoryProjects,
      'public_repos': publicRepos,
      'public_gists': publicGists,
      'followers': followers,
      'following': following,
      'html_url': htmlUrl.toString(),
      'type': type,
      'total_private_repos': ?totalPrivateRepos,
      'owned_private_repos': ?ownedPrivateRepos,
      'private_gists': privateGists,
      'disk_usage': diskUsage,
      'collaborators': collaborators,
      'billing_email': billingEmail,
      'plan': ?plan?.toJson(),
      'default_repository_permission': defaultRepositoryPermission,
      'default_repository_branch': defaultRepositoryBranch,
      'members_can_create_repositories': membersCanCreateRepositories,
      'two_factor_requirement_enabled': twoFactorRequirementEnabled,
      'members_allowed_repository_creation_type':
          ?membersAllowedRepositoryCreationType,
      'members_can_create_public_repositories':
          ?membersCanCreatePublicRepositories,
      'members_can_create_private_repositories':
          ?membersCanCreatePrivateRepositories,
      'members_can_create_internal_repositories':
          ?membersCanCreateInternalRepositories,
      'members_can_create_pages': ?membersCanCreatePages,
      'members_can_create_public_pages': ?membersCanCreatePublicPages,
      'members_can_create_private_pages': ?membersCanCreatePrivatePages,
      'members_can_delete_repositories': ?membersCanDeleteRepositories,
      'members_can_change_repo_visibility': ?membersCanChangeRepoVisibility,
      'members_can_invite_outside_collaborators':
          ?membersCanInviteOutsideCollaborators,
      'members_can_delete_issues': ?membersCanDeleteIssues,
      'display_commenter_full_name_setting_enabled':
          ?displayCommenterFullNameSettingEnabled,
      'readers_can_create_discussions': ?readersCanCreateDiscussions,
      'members_can_create_teams': ?membersCanCreateTeams,
      'members_can_view_dependency_insights': ?membersCanViewDependencyInsights,
      'members_can_fork_private_repositories':
          membersCanForkPrivateRepositories,
      'web_commit_signoff_required': ?webCommitSignoffRequired,
      'advanced_security_enabled_for_new_repositories':
          ?advancedSecurityEnabledForNewRepositories,
      'dependabot_alerts_enabled_for_new_repositories':
          ?dependabotAlertsEnabledForNewRepositories,
      'dependabot_security_updates_enabled_for_new_repositories':
          ?dependabotSecurityUpdatesEnabledForNewRepositories,
      'dependency_graph_enabled_for_new_repositories':
          ?dependencyGraphEnabledForNewRepositories,
      'secret_scanning_enabled_for_new_repositories':
          ?secretScanningEnabledForNewRepositories,
      'secret_scanning_push_protection_enabled_for_new_repositories':
          ?secretScanningPushProtectionEnabledForNewRepositories,
      'secret_scanning_push_protection_custom_link_enabled':
          ?secretScanningPushProtectionCustomLinkEnabled,
      'secret_scanning_push_protection_custom_link':
          secretScanningPushProtectionCustomLink,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'archived_at': archivedAt?.toIso8601String(),
      'deploy_keys_enabled_for_repositories': ?deployKeysEnabledForRepositories,
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
    type,
    totalPrivateRepos,
    ownedPrivateRepos,
    privateGists,
    diskUsage,
    collaborators,
    billingEmail,
    plan,
    defaultRepositoryPermission,
    defaultRepositoryBranch,
    membersCanCreateRepositories,
    twoFactorRequirementEnabled,
    membersAllowedRepositoryCreationType,
    membersCanCreatePublicRepositories,
    membersCanCreatePrivateRepositories,
    membersCanCreateInternalRepositories,
    membersCanCreatePages,
    membersCanCreatePublicPages,
    membersCanCreatePrivatePages,
    membersCanDeleteRepositories,
    membersCanChangeRepoVisibility,
    membersCanInviteOutsideCollaborators,
    membersCanDeleteIssues,
    displayCommenterFullNameSettingEnabled,
    readersCanCreateDiscussions,
    membersCanCreateTeams,
    membersCanViewDependencyInsights,
    membersCanForkPrivateRepositories,
    webCommitSignoffRequired,
    advancedSecurityEnabledForNewRepositories,
    dependabotAlertsEnabledForNewRepositories,
    dependabotSecurityUpdatesEnabledForNewRepositories,
    dependencyGraphEnabledForNewRepositories,
    secretScanningEnabledForNewRepositories,
    secretScanningPushProtectionEnabledForNewRepositories,
    secretScanningPushProtectionCustomLinkEnabled,
    secretScanningPushProtectionCustomLink,
    createdAt,
    updatedAt,
    archivedAt,
    deployKeysEnabledForRepositories,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrganizationFull &&
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
        type == other.type &&
        totalPrivateRepos == other.totalPrivateRepos &&
        ownedPrivateRepos == other.ownedPrivateRepos &&
        privateGists == other.privateGists &&
        diskUsage == other.diskUsage &&
        collaborators == other.collaborators &&
        billingEmail == other.billingEmail &&
        plan == other.plan &&
        defaultRepositoryPermission == other.defaultRepositoryPermission &&
        defaultRepositoryBranch == other.defaultRepositoryBranch &&
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
        membersCanDeleteRepositories == other.membersCanDeleteRepositories &&
        membersCanChangeRepoVisibility ==
            other.membersCanChangeRepoVisibility &&
        membersCanInviteOutsideCollaborators ==
            other.membersCanInviteOutsideCollaborators &&
        membersCanDeleteIssues == other.membersCanDeleteIssues &&
        displayCommenterFullNameSettingEnabled ==
            other.displayCommenterFullNameSettingEnabled &&
        readersCanCreateDiscussions == other.readersCanCreateDiscussions &&
        membersCanCreateTeams == other.membersCanCreateTeams &&
        membersCanViewDependencyInsights ==
            other.membersCanViewDependencyInsights &&
        membersCanForkPrivateRepositories ==
            other.membersCanForkPrivateRepositories &&
        webCommitSignoffRequired == other.webCommitSignoffRequired &&
        advancedSecurityEnabledForNewRepositories ==
            other.advancedSecurityEnabledForNewRepositories &&
        dependabotAlertsEnabledForNewRepositories ==
            other.dependabotAlertsEnabledForNewRepositories &&
        dependabotSecurityUpdatesEnabledForNewRepositories ==
            other.dependabotSecurityUpdatesEnabledForNewRepositories &&
        dependencyGraphEnabledForNewRepositories ==
            other.dependencyGraphEnabledForNewRepositories &&
        secretScanningEnabledForNewRepositories ==
            other.secretScanningEnabledForNewRepositories &&
        secretScanningPushProtectionEnabledForNewRepositories ==
            other.secretScanningPushProtectionEnabledForNewRepositories &&
        secretScanningPushProtectionCustomLinkEnabled ==
            other.secretScanningPushProtectionCustomLinkEnabled &&
        secretScanningPushProtectionCustomLink ==
            other.secretScanningPushProtectionCustomLink &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        archivedAt == other.archivedAt &&
        deployKeysEnabledForRepositories ==
            other.deployKeysEnabledForRepositories;
  }
}
