// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_update_request_default_repository_permission.dart';
import 'package:github/models/orgs_update_request_members_allowed_repository_creation_type.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsUpdateRequest {
  const OrgsUpdateRequest({
    this.billingEmail,
    this.company,
    this.email,
    this.twitterUsername,
    this.location,
    this.name,
    this.description,
    this.hasOrganizationProjects,
    this.hasRepositoryProjects,
    this.defaultRepositoryPermission =
        OrgsUpdateRequestDefaultRepositoryPermission.read,
    this.membersCanCreateRepositories = true,
    this.membersCanCreateInternalRepositories,
    this.membersCanCreatePrivateRepositories,
    this.membersCanCreatePublicRepositories,
    this.membersAllowedRepositoryCreationType,
    this.membersCanCreatePages = true,
    this.membersCanCreatePublicPages = true,
    this.membersCanCreatePrivatePages = true,
    this.membersCanForkPrivateRepositories = false,
    this.webCommitSignoffRequired = false,
    this.blog,
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

  /// Converts a `Map<String, dynamic>` to an [OrgsUpdateRequest].
  factory OrgsUpdateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgsUpdateRequest',
      json,
      () => OrgsUpdateRequest(
        billingEmail: json['billing_email'] as String?,
        company: json['company'] as String?,
        email: json['email'] as String?,
        twitterUsername: json['twitter_username'] as String?,
        location: json['location'] as String?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        hasOrganizationProjects: json['has_organization_projects'] as bool?,
        hasRepositoryProjects: json['has_repository_projects'] as bool?,
        defaultRepositoryPermission:
            OrgsUpdateRequestDefaultRepositoryPermission.maybeFromJson(
              json['default_repository_permission'] as String?,
            ) ??
            OrgsUpdateRequestDefaultRepositoryPermission.read,
        membersCanCreateRepositories:
            (json['members_can_create_repositories'] as bool?) ?? true,
        membersCanCreateInternalRepositories:
            json['members_can_create_internal_repositories'] as bool?,
        membersCanCreatePrivateRepositories:
            json['members_can_create_private_repositories'] as bool?,
        membersCanCreatePublicRepositories:
            json['members_can_create_public_repositories'] as bool?,
        membersAllowedRepositoryCreationType:
            OrgsUpdateRequestMembersAllowedRepositoryCreationType.maybeFromJson(
              json['members_allowed_repository_creation_type'] as String?,
            ),
        membersCanCreatePages:
            (json['members_can_create_pages'] as bool?) ?? true,
        membersCanCreatePublicPages:
            (json['members_can_create_public_pages'] as bool?) ?? true,
        membersCanCreatePrivatePages:
            (json['members_can_create_private_pages'] as bool?) ?? true,
        membersCanForkPrivateRepositories:
            (json['members_can_fork_private_repositories'] as bool?) ?? false,
        webCommitSignoffRequired:
            (json['web_commit_signoff_required'] as bool?) ?? false,
        blog: json['blog'] as String?,
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
        deployKeysEnabledForRepositories:
            json['deploy_keys_enabled_for_repositories'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsUpdateRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgsUpdateRequest.fromJson(json);
  }

  /// Billing email address. This address is not publicized.
  final String? billingEmail;

  /// The company name.
  final String? company;

  /// The publicly visible email address.
  final String? email;

  /// The Twitter username of the company.
  final String? twitterUsername;

  /// The location.
  final String? location;

  /// The shorthand name of the company.
  final String? name;

  /// The description of the company. The maximum size is 160 characters.
  final String? description;

  /// Whether an organization can use organization projects.
  final bool? hasOrganizationProjects;

  /// Whether repositories that belong to the organization can use repository
  /// projects.
  final bool? hasRepositoryProjects;

  /// Default permission level members have for organization repositories.
  final OrgsUpdateRequestDefaultRepositoryPermission?
  defaultRepositoryPermission;

  /// Whether of non-admin organization members can create repositories.
  /// **Note:** A parameter can override this parameter. See
  /// `members_allowed_repository_creation_type` in this table for details.
  final bool? membersCanCreateRepositories;

  /// Whether organization members can create internal repositories, which are
  /// visible to all enterprise members. You can only allow members to create
  /// internal repositories if your organization is associated with an
  /// enterprise account using GitHub Enterprise Cloud or GitHub Enterprise
  /// Server 2.20+. For more information, see "[Restricting repository
  /// creation in your
  /// organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)"
  /// in the GitHub Help documentation.
  final bool? membersCanCreateInternalRepositories;

  /// Whether organization members can create private repositories, which are
  /// visible to organization members with permission. For more information,
  /// see "[Restricting repository creation in your
  /// organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)"
  /// in the GitHub Help documentation.
  final bool? membersCanCreatePrivateRepositories;

  /// Whether organization members can create public repositories, which are
  /// visible to anyone. For more information, see "[Restricting repository
  /// creation in your
  /// organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/restricting-repository-creation-in-your-organization)"
  /// in the GitHub Help documentation.
  final bool? membersCanCreatePublicRepositories;

  /// Specifies which types of repositories non-admin organization members can
  /// create. `private` is only available to repositories that are part of an
  /// organization on GitHub Enterprise Cloud.
  /// **Note:** This parameter is closing down and will be removed in the
  /// future. Its return value ignores internal repositories. Using this
  /// parameter overrides values set in `members_can_create_repositories`. See
  /// the parameter deprecation notice in the operation description for
  /// details.
  final OrgsUpdateRequestMembersAllowedRepositoryCreationType?
  membersAllowedRepositoryCreationType;

  /// Whether organization members can create GitHub Pages sites. Existing
  /// published sites will not be impacted.
  final bool? membersCanCreatePages;

  /// Whether organization members can create public GitHub Pages sites.
  /// Existing published sites will not be impacted.
  final bool? membersCanCreatePublicPages;

  /// Whether organization members can create private GitHub Pages sites.
  /// Existing published sites will not be impacted.
  final bool? membersCanCreatePrivatePages;

  /// Whether organization members can fork private organization repositories.
  final bool? membersCanForkPrivateRepositories;

  /// Whether contributors to organization repositories are required to sign
  /// off on commits they make through GitHub's web interface.
  final bool? webCommitSignoffRequired;

  /// Example: `'"http://github.blog"'`
  final String? blog;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether GitHub Advanced Security is automatically enabled for new
  /// repositories and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? advancedSecurityEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether Dependabot alerts are automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? dependabotAlertsEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether Dependabot security updates are automatically enabled for new
  /// repositories and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? dependabotSecurityUpdatesEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether dependency graph is automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? dependencyGraphEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether secret scanning is automatically enabled for new repositories
  /// and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? secretScanningEnabledForNewRepositories;

  /// **Endpoint closing down notice.** Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead.
  ///
  /// Whether secret scanning push protection is automatically enabled for new
  /// repositories and repositories transferred to this organization.
  ///
  /// To use this parameter, you must have admin permissions for the
  /// repository or be an owner or security manager for the organization that
  /// owns the repository. For more information, see "[Managing security
  /// managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// You can check which security and analysis features are currently enabled
  /// by using a `GET /orgs/{org}` request.
  @deprecated
  final bool? secretScanningPushProtectionEnabledForNewRepositories;

  /// Whether a custom link is shown to contributors who are blocked from
  /// pushing a secret by push protection.
  final bool? secretScanningPushProtectionCustomLinkEnabled;

  /// If `secret_scanning_push_protection_custom_link_enabled` is true, the
  /// URL that will be displayed to contributors who are blocked from pushing
  /// a secret.
  final String? secretScanningPushProtectionCustomLink;

  /// Controls whether or not deploy keys may be added and used for
  /// repositories in the organization.
  final bool? deployKeysEnabledForRepositories;

  /// Converts an [OrgsUpdateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'billing_email': billingEmail,
      'company': company,
      'email': email,
      'twitter_username': twitterUsername,
      'location': location,
      'name': name,
      'description': description,
      'has_organization_projects': hasOrganizationProjects,
      'has_repository_projects': hasRepositoryProjects,
      'default_repository_permission': defaultRepositoryPermission?.toJson(),
      'members_can_create_repositories': membersCanCreateRepositories,
      'members_can_create_internal_repositories':
          membersCanCreateInternalRepositories,
      'members_can_create_private_repositories':
          membersCanCreatePrivateRepositories,
      'members_can_create_public_repositories':
          membersCanCreatePublicRepositories,
      'members_allowed_repository_creation_type':
          membersAllowedRepositoryCreationType?.toJson(),
      'members_can_create_pages': membersCanCreatePages,
      'members_can_create_public_pages': membersCanCreatePublicPages,
      'members_can_create_private_pages': membersCanCreatePrivatePages,
      'members_can_fork_private_repositories':
          membersCanForkPrivateRepositories,
      'web_commit_signoff_required': webCommitSignoffRequired,
      'blog': blog,
      'advanced_security_enabled_for_new_repositories':
          advancedSecurityEnabledForNewRepositories,
      'dependabot_alerts_enabled_for_new_repositories':
          dependabotAlertsEnabledForNewRepositories,
      'dependabot_security_updates_enabled_for_new_repositories':
          dependabotSecurityUpdatesEnabledForNewRepositories,
      'dependency_graph_enabled_for_new_repositories':
          dependencyGraphEnabledForNewRepositories,
      'secret_scanning_enabled_for_new_repositories':
          secretScanningEnabledForNewRepositories,
      'secret_scanning_push_protection_enabled_for_new_repositories':
          secretScanningPushProtectionEnabledForNewRepositories,
      'secret_scanning_push_protection_custom_link_enabled':
          secretScanningPushProtectionCustomLinkEnabled,
      'secret_scanning_push_protection_custom_link':
          secretScanningPushProtectionCustomLink,
      'deploy_keys_enabled_for_repositories': deployKeysEnabledForRepositories,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    billingEmail,
    company,
    email,
    twitterUsername,
    location,
    name,
    description,
    hasOrganizationProjects,
    hasRepositoryProjects,
    defaultRepositoryPermission,
    membersCanCreateRepositories,
    membersCanCreateInternalRepositories,
    membersCanCreatePrivateRepositories,
    membersCanCreatePublicRepositories,
    membersAllowedRepositoryCreationType,
    membersCanCreatePages,
    membersCanCreatePublicPages,
    membersCanCreatePrivatePages,
    membersCanForkPrivateRepositories,
    webCommitSignoffRequired,
    blog,
    advancedSecurityEnabledForNewRepositories,
    dependabotAlertsEnabledForNewRepositories,
    dependabotSecurityUpdatesEnabledForNewRepositories,
    dependencyGraphEnabledForNewRepositories,
    secretScanningEnabledForNewRepositories,
    secretScanningPushProtectionEnabledForNewRepositories,
    secretScanningPushProtectionCustomLinkEnabled,
    secretScanningPushProtectionCustomLink,
    deployKeysEnabledForRepositories,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsUpdateRequest &&
        billingEmail == other.billingEmail &&
        company == other.company &&
        email == other.email &&
        twitterUsername == other.twitterUsername &&
        location == other.location &&
        name == other.name &&
        description == other.description &&
        hasOrganizationProjects == other.hasOrganizationProjects &&
        hasRepositoryProjects == other.hasRepositoryProjects &&
        defaultRepositoryPermission == other.defaultRepositoryPermission &&
        membersCanCreateRepositories == other.membersCanCreateRepositories &&
        membersCanCreateInternalRepositories ==
            other.membersCanCreateInternalRepositories &&
        membersCanCreatePrivateRepositories ==
            other.membersCanCreatePrivateRepositories &&
        membersCanCreatePublicRepositories ==
            other.membersCanCreatePublicRepositories &&
        membersAllowedRepositoryCreationType ==
            other.membersAllowedRepositoryCreationType &&
        membersCanCreatePages == other.membersCanCreatePages &&
        membersCanCreatePublicPages == other.membersCanCreatePublicPages &&
        membersCanCreatePrivatePages == other.membersCanCreatePrivatePages &&
        membersCanForkPrivateRepositories ==
            other.membersCanForkPrivateRepositories &&
        webCommitSignoffRequired == other.webCommitSignoffRequired &&
        blog == other.blog &&
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
        deployKeysEnabledForRepositories ==
            other.deployKeysEnabledForRepositories;
  }
}
