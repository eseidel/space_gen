import 'package:github/model_helpers.dart';
import 'package:github/models/app_permissions_actions.dart';
import 'package:github/models/app_permissions_administration.dart';
import 'package:github/models/app_permissions_checks.dart';
import 'package:github/models/app_permissions_codespaces.dart';
import 'package:github/models/app_permissions_contents.dart';
import 'package:github/models/app_permissions_dependabot_secrets.dart';
import 'package:github/models/app_permissions_deployments.dart';
import 'package:github/models/app_permissions_email_addresses.dart';
import 'package:github/models/app_permissions_environments.dart';
import 'package:github/models/app_permissions_followers.dart';
import 'package:github/models/app_permissions_git_ssh_keys.dart';
import 'package:github/models/app_permissions_gpg_keys.dart';
import 'package:github/models/app_permissions_interaction_limits.dart';
import 'package:github/models/app_permissions_issues.dart';
import 'package:github/models/app_permissions_members.dart';
import 'package:github/models/app_permissions_metadata.dart';
import 'package:github/models/app_permissions_organization_administration.dart';
import 'package:github/models/app_permissions_organization_announcement_banners.dart';
import 'package:github/models/app_permissions_organization_copilot_seat_management.dart';
import 'package:github/models/app_permissions_organization_custom_org_roles.dart';
import 'package:github/models/app_permissions_organization_custom_properties.dart';
import 'package:github/models/app_permissions_organization_custom_roles.dart';
import 'package:github/models/app_permissions_organization_events.dart';
import 'package:github/models/app_permissions_organization_hooks.dart';
import 'package:github/models/app_permissions_organization_packages.dart';
import 'package:github/models/app_permissions_organization_personal_access_token_requests.dart';
import 'package:github/models/app_permissions_organization_personal_access_tokens.dart';
import 'package:github/models/app_permissions_organization_plan.dart';
import 'package:github/models/app_permissions_organization_projects.dart';
import 'package:github/models/app_permissions_organization_secrets.dart';
import 'package:github/models/app_permissions_organization_self_hosted_runners.dart';
import 'package:github/models/app_permissions_organization_user_blocking.dart';
import 'package:github/models/app_permissions_packages.dart';
import 'package:github/models/app_permissions_pages.dart';
import 'package:github/models/app_permissions_profile.dart';
import 'package:github/models/app_permissions_pull_requests.dart';
import 'package:github/models/app_permissions_repository_custom_properties.dart';
import 'package:github/models/app_permissions_repository_hooks.dart';
import 'package:github/models/app_permissions_repository_projects.dart';
import 'package:github/models/app_permissions_secret_scanning_alerts.dart';
import 'package:github/models/app_permissions_secrets.dart';
import 'package:github/models/app_permissions_security_events.dart';
import 'package:github/models/app_permissions_single_file.dart';
import 'package:github/models/app_permissions_starring.dart';
import 'package:github/models/app_permissions_statuses.dart';
import 'package:github/models/app_permissions_team_discussions.dart';
import 'package:github/models/app_permissions_vulnerability_alerts.dart';
import 'package:github/models/app_permissions_workflows.dart';
import 'package:meta/meta.dart';

/// {@template app_permissions}
/// App Permissions
/// The permissions granted to the user access token.
/// {@endtemplate}
/// Example:
/// ```json
/// {
///   "contents": "read",
///   "issues": "read",
///   "deployments": "write",
///   "single_file": "read"
/// }
/// ```
@immutable
class AppPermissions {
  /// {@macro app_permissions}
  const AppPermissions({
    this.actions,
    this.administration,
    this.checks,
    this.codespaces,
    this.contents,
    this.dependabotSecrets,
    this.deployments,
    this.environments,
    this.issues,
    this.metadata,
    this.packages,
    this.pages,
    this.pullRequests,
    this.repositoryCustomProperties,
    this.repositoryHooks,
    this.repositoryProjects,
    this.secretScanningAlerts,
    this.secrets,
    this.securityEvents,
    this.singleFile,
    this.statuses,
    this.vulnerabilityAlerts,
    this.workflows,
    this.members,
    this.organizationAdministration,
    this.organizationCustomRoles,
    this.organizationCustomOrgRoles,
    this.organizationCustomProperties,
    this.organizationCopilotSeatManagement,
    this.organizationAnnouncementBanners,
    this.organizationEvents,
    this.organizationHooks,
    this.organizationPersonalAccessTokens,
    this.organizationPersonalAccessTokenRequests,
    this.organizationPlan,
    this.organizationProjects,
    this.organizationPackages,
    this.organizationSecrets,
    this.organizationSelfHostedRunners,
    this.organizationUserBlocking,
    this.teamDiscussions,
    this.emailAddresses,
    this.followers,
    this.gitSshKeys,
    this.gpgKeys,
    this.interactionLimits,
    this.profile,
    this.starring,
  });

  /// Converts a `Map<String, dynamic>` to an [AppPermissions].
  factory AppPermissions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppPermissions',
      json,
      () => AppPermissions(
        actions: AppPermissionsActions.maybeFromJson(
          json['actions'] as String?,
        ),
        administration: AppPermissionsAdministration.maybeFromJson(
          json['administration'] as String?,
        ),
        checks: AppPermissionsChecks.maybeFromJson(json['checks'] as String?),
        codespaces: AppPermissionsCodespaces.maybeFromJson(
          json['codespaces'] as String?,
        ),
        contents: AppPermissionsContents.maybeFromJson(
          json['contents'] as String?,
        ),
        dependabotSecrets: AppPermissionsDependabotSecrets.maybeFromJson(
          json['dependabot_secrets'] as String?,
        ),
        deployments: AppPermissionsDeployments.maybeFromJson(
          json['deployments'] as String?,
        ),
        environments: AppPermissionsEnvironments.maybeFromJson(
          json['environments'] as String?,
        ),
        issues: AppPermissionsIssues.maybeFromJson(json['issues'] as String?),
        metadata: AppPermissionsMetadata.maybeFromJson(
          json['metadata'] as String?,
        ),
        packages: AppPermissionsPackages.maybeFromJson(
          json['packages'] as String?,
        ),
        pages: AppPermissionsPages.maybeFromJson(json['pages'] as String?),
        pullRequests: AppPermissionsPullRequests.maybeFromJson(
          json['pull_requests'] as String?,
        ),
        repositoryCustomProperties:
            AppPermissionsRepositoryCustomProperties.maybeFromJson(
              json['repository_custom_properties'] as String?,
            ),
        repositoryHooks: AppPermissionsRepositoryHooks.maybeFromJson(
          json['repository_hooks'] as String?,
        ),
        repositoryProjects: AppPermissionsRepositoryProjects.maybeFromJson(
          json['repository_projects'] as String?,
        ),
        secretScanningAlerts: AppPermissionsSecretScanningAlerts.maybeFromJson(
          json['secret_scanning_alerts'] as String?,
        ),
        secrets: AppPermissionsSecrets.maybeFromJson(
          json['secrets'] as String?,
        ),
        securityEvents: AppPermissionsSecurityEvents.maybeFromJson(
          json['security_events'] as String?,
        ),
        singleFile: AppPermissionsSingleFile.maybeFromJson(
          json['single_file'] as String?,
        ),
        statuses: AppPermissionsStatuses.maybeFromJson(
          json['statuses'] as String?,
        ),
        vulnerabilityAlerts: AppPermissionsVulnerabilityAlerts.maybeFromJson(
          json['vulnerability_alerts'] as String?,
        ),
        workflows: AppPermissionsWorkflows.maybeFromJson(
          json['workflows'] as String?,
        ),
        members: AppPermissionsMembers.maybeFromJson(
          json['members'] as String?,
        ),
        organizationAdministration:
            AppPermissionsOrganizationAdministration.maybeFromJson(
              json['organization_administration'] as String?,
            ),
        organizationCustomRoles:
            AppPermissionsOrganizationCustomRoles.maybeFromJson(
              json['organization_custom_roles'] as String?,
            ),
        organizationCustomOrgRoles:
            AppPermissionsOrganizationCustomOrgRoles.maybeFromJson(
              json['organization_custom_org_roles'] as String?,
            ),
        organizationCustomProperties:
            AppPermissionsOrganizationCustomProperties.maybeFromJson(
              json['organization_custom_properties'] as String?,
            ),
        organizationCopilotSeatManagement:
            AppPermissionsOrganizationCopilotSeatManagement.maybeFromJson(
              json['organization_copilot_seat_management'] as String?,
            ),
        organizationAnnouncementBanners:
            AppPermissionsOrganizationAnnouncementBanners.maybeFromJson(
              json['organization_announcement_banners'] as String?,
            ),
        organizationEvents: AppPermissionsOrganizationEvents.maybeFromJson(
          json['organization_events'] as String?,
        ),
        organizationHooks: AppPermissionsOrganizationHooks.maybeFromJson(
          json['organization_hooks'] as String?,
        ),
        organizationPersonalAccessTokens:
            AppPermissionsOrganizationPersonalAccessTokens.maybeFromJson(
              json['organization_personal_access_tokens'] as String?,
            ),
        organizationPersonalAccessTokenRequests:
            AppPermissionsOrganizationPersonalAccessTokenRequests.maybeFromJson(
              json['organization_personal_access_token_requests'] as String?,
            ),
        organizationPlan: AppPermissionsOrganizationPlan.maybeFromJson(
          json['organization_plan'] as String?,
        ),
        organizationProjects: AppPermissionsOrganizationProjects.maybeFromJson(
          json['organization_projects'] as String?,
        ),
        organizationPackages: AppPermissionsOrganizationPackages.maybeFromJson(
          json['organization_packages'] as String?,
        ),
        organizationSecrets: AppPermissionsOrganizationSecrets.maybeFromJson(
          json['organization_secrets'] as String?,
        ),
        organizationSelfHostedRunners:
            AppPermissionsOrganizationSelfHostedRunners.maybeFromJson(
              json['organization_self_hosted_runners'] as String?,
            ),
        organizationUserBlocking:
            AppPermissionsOrganizationUserBlocking.maybeFromJson(
              json['organization_user_blocking'] as String?,
            ),
        teamDiscussions: AppPermissionsTeamDiscussions.maybeFromJson(
          json['team_discussions'] as String?,
        ),
        emailAddresses: AppPermissionsEmailAddresses.maybeFromJson(
          json['email_addresses'] as String?,
        ),
        followers: AppPermissionsFollowers.maybeFromJson(
          json['followers'] as String?,
        ),
        gitSshKeys: AppPermissionsGitSshKeys.maybeFromJson(
          json['git_ssh_keys'] as String?,
        ),
        gpgKeys: AppPermissionsGpgKeys.maybeFromJson(
          json['gpg_keys'] as String?,
        ),
        interactionLimits: AppPermissionsInteractionLimits.maybeFromJson(
          json['interaction_limits'] as String?,
        ),
        profile: AppPermissionsProfile.maybeFromJson(
          json['profile'] as String?,
        ),
        starring: AppPermissionsStarring.maybeFromJson(
          json['starring'] as String?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppPermissions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AppPermissions.fromJson(json);
  }

  /// The level of permission to grant the access token for GitHub Actions
  /// workflows, workflow runs, and artifacts.
  final AppPermissionsActions? actions;

  /// The level of permission to grant the access token for repository
  /// creation, deletion, settings, teams, and collaborators creation.
  final AppPermissionsAdministration? administration;

  /// The level of permission to grant the access token for checks on code.
  final AppPermissionsChecks? checks;

  /// The level of permission to grant the access token to create, edit,
  /// delete, and list Codespaces.
  final AppPermissionsCodespaces? codespaces;

  /// The level of permission to grant the access token for repository
  /// contents, commits, branches, downloads, releases, and merges.
  final AppPermissionsContents? contents;

  /// The level of permission to grant the access token to manage Dependabot
  /// secrets.
  final AppPermissionsDependabotSecrets? dependabotSecrets;

  /// The level of permission to grant the access token for deployments and
  /// deployment statuses.
  final AppPermissionsDeployments? deployments;

  /// The level of permission to grant the access token for managing
  /// repository environments.
  final AppPermissionsEnvironments? environments;

  /// The level of permission to grant the access token for issues and related
  /// comments, assignees, labels, and milestones.
  final AppPermissionsIssues? issues;

  /// The level of permission to grant the access token to search
  /// repositories, list collaborators, and access repository metadata.
  final AppPermissionsMetadata? metadata;

  /// The level of permission to grant the access token for packages published
  /// to GitHub Packages.
  final AppPermissionsPackages? packages;

  /// The level of permission to grant the access token to retrieve Pages
  /// statuses, configuration, and builds, as well as create new builds.
  final AppPermissionsPages? pages;

  /// The level of permission to grant the access token for pull requests and
  /// related comments, assignees, labels, milestones, and merges.
  final AppPermissionsPullRequests? pullRequests;

  /// The level of permission to grant the access token to view and edit
  /// custom properties for a repository, when allowed by the property.
  final AppPermissionsRepositoryCustomProperties? repositoryCustomProperties;

  /// The level of permission to grant the access token to manage the
  /// post-receive hooks for a repository.
  final AppPermissionsRepositoryHooks? repositoryHooks;

  /// The level of permission to grant the access token to manage repository
  /// projects, columns, and cards.
  final AppPermissionsRepositoryProjects? repositoryProjects;

  /// The level of permission to grant the access token to view and manage
  /// secret scanning alerts.
  final AppPermissionsSecretScanningAlerts? secretScanningAlerts;

  /// The level of permission to grant the access token to manage repository
  /// secrets.
  final AppPermissionsSecrets? secrets;

  /// The level of permission to grant the access token to view and manage
  /// security events like code scanning alerts.
  final AppPermissionsSecurityEvents? securityEvents;

  /// The level of permission to grant the access token to manage just a
  /// single file.
  final AppPermissionsSingleFile? singleFile;

  /// The level of permission to grant the access token for commit statuses.
  final AppPermissionsStatuses? statuses;

  /// The level of permission to grant the access token to manage Dependabot
  /// alerts.
  final AppPermissionsVulnerabilityAlerts? vulnerabilityAlerts;

  /// The level of permission to grant the access token to update GitHub
  /// Actions workflow files.
  final AppPermissionsWorkflows? workflows;

  /// The level of permission to grant the access token for organization teams
  /// and members.
  final AppPermissionsMembers? members;

  /// The level of permission to grant the access token to manage access to an
  /// organization.
  final AppPermissionsOrganizationAdministration? organizationAdministration;

  /// The level of permission to grant the access token for custom repository
  /// roles management.
  final AppPermissionsOrganizationCustomRoles? organizationCustomRoles;

  /// The level of permission to grant the access token for custom
  /// organization roles management.
  final AppPermissionsOrganizationCustomOrgRoles? organizationCustomOrgRoles;

  /// The level of permission to grant the access token for custom property
  /// management.
  final AppPermissionsOrganizationCustomProperties?
  organizationCustomProperties;

  /// The level of permission to grant the access token for managing access to
  /// GitHub Copilot for members of an organization with a Copilot Business
  /// subscription. This property is in public preview and is subject to
  /// change.
  final AppPermissionsOrganizationCopilotSeatManagement?
  organizationCopilotSeatManagement;

  /// The level of permission to grant the access token to view and manage
  /// announcement banners for an organization.
  final AppPermissionsOrganizationAnnouncementBanners?
  organizationAnnouncementBanners;

  /// The level of permission to grant the access token to view events
  /// triggered by an activity in an organization.
  final AppPermissionsOrganizationEvents? organizationEvents;

  /// The level of permission to grant the access token to manage the
  /// post-receive hooks for an organization.
  final AppPermissionsOrganizationHooks? organizationHooks;

  /// The level of permission to grant the access token for viewing and
  /// managing fine-grained personal access token requests to an organization.
  final AppPermissionsOrganizationPersonalAccessTokens?
  organizationPersonalAccessTokens;

  /// The level of permission to grant the access token for viewing and
  /// managing fine-grained personal access tokens that have been approved by
  /// an organization.
  final AppPermissionsOrganizationPersonalAccessTokenRequests?
  organizationPersonalAccessTokenRequests;

  /// The level of permission to grant the access token for viewing an
  /// organization's plan.
  final AppPermissionsOrganizationPlan? organizationPlan;

  /// The level of permission to grant the access token to manage organization
  /// projects and projects public preview (where available).
  final AppPermissionsOrganizationProjects? organizationProjects;

  /// The level of permission to grant the access token for organization
  /// packages published to GitHub Packages.
  final AppPermissionsOrganizationPackages? organizationPackages;

  /// The level of permission to grant the access token to manage organization
  /// secrets.
  final AppPermissionsOrganizationSecrets? organizationSecrets;

  /// The level of permission to grant the access token to view and manage
  /// GitHub Actions self-hosted runners available to an organization.
  final AppPermissionsOrganizationSelfHostedRunners?
  organizationSelfHostedRunners;

  /// The level of permission to grant the access token to view and manage
  /// users blocked by the organization.
  final AppPermissionsOrganizationUserBlocking? organizationUserBlocking;

  /// The level of permission to grant the access token to manage team
  /// discussions and related comments.
  final AppPermissionsTeamDiscussions? teamDiscussions;

  /// The level of permission to grant the access token to manage the email
  /// addresses belonging to a user.
  final AppPermissionsEmailAddresses? emailAddresses;

  /// The level of permission to grant the access token to manage the
  /// followers belonging to a user.
  final AppPermissionsFollowers? followers;

  /// The level of permission to grant the access token to manage git SSH
  /// keys.
  final AppPermissionsGitSshKeys? gitSshKeys;

  /// The level of permission to grant the access token to view and manage GPG
  /// keys belonging to a user.
  final AppPermissionsGpgKeys? gpgKeys;

  /// The level of permission to grant the access token to view and manage
  /// interaction limits on a repository.
  final AppPermissionsInteractionLimits? interactionLimits;

  /// The level of permission to grant the access token to manage the profile
  /// settings belonging to a user.
  final AppPermissionsProfile? profile;

  /// The level of permission to grant the access token to list and manage
  /// repositories a user is starring.
  final AppPermissionsStarring? starring;

  /// Converts an [AppPermissions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'actions': actions?.toJson(),
      'administration': administration?.toJson(),
      'checks': checks?.toJson(),
      'codespaces': codespaces?.toJson(),
      'contents': contents?.toJson(),
      'dependabot_secrets': dependabotSecrets?.toJson(),
      'deployments': deployments?.toJson(),
      'environments': environments?.toJson(),
      'issues': issues?.toJson(),
      'metadata': metadata?.toJson(),
      'packages': packages?.toJson(),
      'pages': pages?.toJson(),
      'pull_requests': pullRequests?.toJson(),
      'repository_custom_properties': repositoryCustomProperties?.toJson(),
      'repository_hooks': repositoryHooks?.toJson(),
      'repository_projects': repositoryProjects?.toJson(),
      'secret_scanning_alerts': secretScanningAlerts?.toJson(),
      'secrets': secrets?.toJson(),
      'security_events': securityEvents?.toJson(),
      'single_file': singleFile?.toJson(),
      'statuses': statuses?.toJson(),
      'vulnerability_alerts': vulnerabilityAlerts?.toJson(),
      'workflows': workflows?.toJson(),
      'members': members?.toJson(),
      'organization_administration': organizationAdministration?.toJson(),
      'organization_custom_roles': organizationCustomRoles?.toJson(),
      'organization_custom_org_roles': organizationCustomOrgRoles?.toJson(),
      'organization_custom_properties': organizationCustomProperties?.toJson(),
      'organization_copilot_seat_management': organizationCopilotSeatManagement
          ?.toJson(),
      'organization_announcement_banners': organizationAnnouncementBanners
          ?.toJson(),
      'organization_events': organizationEvents?.toJson(),
      'organization_hooks': organizationHooks?.toJson(),
      'organization_personal_access_tokens': organizationPersonalAccessTokens
          ?.toJson(),
      'organization_personal_access_token_requests':
          organizationPersonalAccessTokenRequests?.toJson(),
      'organization_plan': organizationPlan?.toJson(),
      'organization_projects': organizationProjects?.toJson(),
      'organization_packages': organizationPackages?.toJson(),
      'organization_secrets': organizationSecrets?.toJson(),
      'organization_self_hosted_runners': organizationSelfHostedRunners
          ?.toJson(),
      'organization_user_blocking': organizationUserBlocking?.toJson(),
      'team_discussions': teamDiscussions?.toJson(),
      'email_addresses': emailAddresses?.toJson(),
      'followers': followers?.toJson(),
      'git_ssh_keys': gitSshKeys?.toJson(),
      'gpg_keys': gpgKeys?.toJson(),
      'interaction_limits': interactionLimits?.toJson(),
      'profile': profile?.toJson(),
      'starring': starring?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    actions,
    administration,
    checks,
    codespaces,
    contents,
    dependabotSecrets,
    deployments,
    environments,
    issues,
    metadata,
    packages,
    pages,
    pullRequests,
    repositoryCustomProperties,
    repositoryHooks,
    repositoryProjects,
    secretScanningAlerts,
    secrets,
    securityEvents,
    singleFile,
    statuses,
    vulnerabilityAlerts,
    workflows,
    members,
    organizationAdministration,
    organizationCustomRoles,
    organizationCustomOrgRoles,
    organizationCustomProperties,
    organizationCopilotSeatManagement,
    organizationAnnouncementBanners,
    organizationEvents,
    organizationHooks,
    organizationPersonalAccessTokens,
    organizationPersonalAccessTokenRequests,
    organizationPlan,
    organizationProjects,
    organizationPackages,
    organizationSecrets,
    organizationSelfHostedRunners,
    organizationUserBlocking,
    teamDiscussions,
    emailAddresses,
    followers,
    gitSshKeys,
    gpgKeys,
    interactionLimits,
    profile,
    starring,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppPermissions &&
        actions == other.actions &&
        administration == other.administration &&
        checks == other.checks &&
        codespaces == other.codespaces &&
        contents == other.contents &&
        dependabotSecrets == other.dependabotSecrets &&
        deployments == other.deployments &&
        environments == other.environments &&
        issues == other.issues &&
        metadata == other.metadata &&
        packages == other.packages &&
        pages == other.pages &&
        pullRequests == other.pullRequests &&
        repositoryCustomProperties == other.repositoryCustomProperties &&
        repositoryHooks == other.repositoryHooks &&
        repositoryProjects == other.repositoryProjects &&
        secretScanningAlerts == other.secretScanningAlerts &&
        secrets == other.secrets &&
        securityEvents == other.securityEvents &&
        singleFile == other.singleFile &&
        statuses == other.statuses &&
        vulnerabilityAlerts == other.vulnerabilityAlerts &&
        workflows == other.workflows &&
        members == other.members &&
        organizationAdministration == other.organizationAdministration &&
        organizationCustomRoles == other.organizationCustomRoles &&
        organizationCustomOrgRoles == other.organizationCustomOrgRoles &&
        organizationCustomProperties == other.organizationCustomProperties &&
        organizationCopilotSeatManagement ==
            other.organizationCopilotSeatManagement &&
        organizationAnnouncementBanners ==
            other.organizationAnnouncementBanners &&
        organizationEvents == other.organizationEvents &&
        organizationHooks == other.organizationHooks &&
        organizationPersonalAccessTokens ==
            other.organizationPersonalAccessTokens &&
        organizationPersonalAccessTokenRequests ==
            other.organizationPersonalAccessTokenRequests &&
        organizationPlan == other.organizationPlan &&
        organizationProjects == other.organizationProjects &&
        organizationPackages == other.organizationPackages &&
        organizationSecrets == other.organizationSecrets &&
        organizationSelfHostedRunners == other.organizationSelfHostedRunners &&
        organizationUserBlocking == other.organizationUserBlocking &&
        teamDiscussions == other.teamDiscussions &&
        emailAddresses == other.emailAddresses &&
        followers == other.followers &&
        gitSshKeys == other.gitSshKeys &&
        gpgKeys == other.gpgKeys &&
        interactionLimits == other.interactionLimits &&
        profile == other.profile &&
        starring == other.starring;
  }
}
