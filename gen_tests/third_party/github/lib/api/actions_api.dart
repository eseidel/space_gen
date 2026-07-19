// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/actions_add_custom_labels_to_self_hosted_runner_for_org_request.dart';
import 'package:github/messages/actions_add_custom_labels_to_self_hosted_runner_for_repo_request.dart';
import 'package:github/messages/actions_create_environment_variable_request.dart';
import 'package:github/messages/actions_create_hosted_runner_for_org_request.dart';
import 'package:github/messages/actions_create_or_update_environment_secret_request.dart';
import 'package:github/messages/actions_create_or_update_org_secret_request.dart';
import 'package:github/messages/actions_create_or_update_repo_secret_request.dart';
import 'package:github/messages/actions_create_org_variable_request.dart';
import 'package:github/messages/actions_create_repo_variable_request.dart';
import 'package:github/messages/actions_create_self_hosted_runner_group_for_org_request.dart';
import 'package:github/messages/actions_create_workflow_dispatch_request.dart';
import 'package:github/messages/actions_generate_runner_jitconfig_for_org_request.dart';
import 'package:github/messages/actions_generate_runner_jitconfig_for_repo_request.dart';
import 'package:github/messages/actions_get_actions_cache_usage_by_repo_for_org200_response.dart';
import 'package:github/messages/actions_get_hosted_runners_github_owned_images_for_org200_response.dart';
import 'package:github/messages/actions_get_hosted_runners_machine_specs_for_org200_response.dart';
import 'package:github/messages/actions_get_hosted_runners_partner_images_for_org200_response.dart';
import 'package:github/messages/actions_get_hosted_runners_platforms_for_org200_response.dart';
import 'package:github/messages/actions_list_artifacts_for_repo200_response.dart';
import 'package:github/messages/actions_list_environment_secrets200_response.dart';
import 'package:github/messages/actions_list_environment_variables200_response.dart';
import 'package:github/messages/actions_list_github_hosted_runners_in_group_for_org200_response.dart';
import 'package:github/messages/actions_list_hosted_runners_for_org200_response.dart';
import 'package:github/messages/actions_list_jobs_for_workflow_run200_response.dart';
import 'package:github/messages/actions_list_jobs_for_workflow_run_attempt200_response.dart';
import 'package:github/messages/actions_list_org_secrets200_response.dart';
import 'package:github/messages/actions_list_org_variables200_response.dart';
import 'package:github/messages/actions_list_repo_access_to_self_hosted_runner_group_in_org200_response.dart';
import 'package:github/messages/actions_list_repo_organization_secrets200_response.dart';
import 'package:github/messages/actions_list_repo_organization_variables200_response.dart';
import 'package:github/messages/actions_list_repo_secrets200_response.dart';
import 'package:github/messages/actions_list_repo_variables200_response.dart';
import 'package:github/messages/actions_list_repo_workflows200_response.dart';
import 'package:github/messages/actions_list_selected_repos_for_org_secret200_response.dart';
import 'package:github/messages/actions_list_selected_repos_for_org_variable200_response.dart';
import 'package:github/messages/actions_list_selected_repositories_enabled_github_actions_organization200_response.dart';
import 'package:github/messages/actions_list_self_hosted_runner_groups_for_org200_response.dart';
import 'package:github/messages/actions_list_self_hosted_runners_for_org200_response.dart';
import 'package:github/messages/actions_list_self_hosted_runners_for_repo200_response.dart';
import 'package:github/messages/actions_list_self_hosted_runners_in_group_for_org200_response.dart';
import 'package:github/messages/actions_list_workflow_run_artifacts200_response.dart';
import 'package:github/messages/actions_list_workflow_runs200_response.dart';
import 'package:github/messages/actions_list_workflow_runs_for_repo200_response.dart';
import 'package:github/messages/actions_re_run_job_for_workflow_run_request.dart';
import 'package:github/messages/actions_re_run_workflow_failed_jobs_request.dart';
import 'package:github/messages/actions_re_run_workflow_request.dart';
import 'package:github/messages/actions_review_custom_gates_for_run_request.dart';
import 'package:github/messages/actions_review_pending_deployments_for_run_request.dart';
import 'package:github/messages/actions_runner_jitconfig_response.dart';
import 'package:github/messages/actions_runner_labels_readonly_response.dart';
import 'package:github/messages/actions_runner_labels_response.dart';
import 'package:github/messages/actions_set_custom_labels_for_self_hosted_runner_for_org_request.dart';
import 'package:github/messages/actions_set_custom_labels_for_self_hosted_runner_for_repo_request.dart';
import 'package:github/messages/actions_set_custom_oidc_sub_claim_for_repo_request.dart';
import 'package:github/messages/actions_set_github_actions_permissions_organization_request.dart';
import 'package:github/messages/actions_set_github_actions_permissions_repository_request.dart';
import 'package:github/messages/actions_set_repo_access_to_self_hosted_runner_group_in_org_request.dart';
import 'package:github/messages/actions_set_selected_repos_for_org_secret_request.dart';
import 'package:github/messages/actions_set_selected_repos_for_org_variable_request.dart';
import 'package:github/messages/actions_set_selected_repositories_enabled_github_actions_organization_request.dart';
import 'package:github/messages/actions_set_self_hosted_runners_in_group_for_org_request.dart';
import 'package:github/messages/actions_update_environment_variable_request.dart';
import 'package:github/messages/actions_update_hosted_runner_for_org_request.dart';
import 'package:github/messages/actions_update_org_variable_request.dart';
import 'package:github/messages/actions_update_repo_variable_request.dart';
import 'package:github/messages/actions_update_self_hosted_runner_group_for_org_request.dart';
import 'package:github/models/actions_cache_list.dart';
import 'package:github/models/actions_cache_list_sort_param.dart';
import 'package:github/models/actions_cache_usage_by_repository.dart';
import 'package:github/models/actions_cache_usage_org_enterprise.dart';
import 'package:github/models/actions_get_default_workflow_permissions.dart';
import 'package:github/models/actions_hosted_runner.dart';
import 'package:github/models/actions_hosted_runner_limits.dart';
import 'package:github/models/actions_list_jobs_for_workflow_run_parameter3.dart';
import 'package:github/models/actions_organization_permissions.dart';
import 'package:github/models/actions_public_key.dart';
import 'package:github/models/actions_repository_permissions.dart';
import 'package:github/models/actions_secret.dart';
import 'package:github/models/actions_set_default_workflow_permissions.dart';
import 'package:github/models/actions_variable.dart';
import 'package:github/models/actions_workflow_access_to_repository.dart';
import 'package:github/models/artifact.dart';
import 'package:github/models/authentication_token.dart';
import 'package:github/models/deployment.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/environment_approvals.dart';
import 'package:github/models/job.dart';
import 'package:github/models/oidc_custom_sub_repo.dart';
import 'package:github/models/organization_actions_secret.dart';
import 'package:github/models/organization_actions_variable.dart';
import 'package:github/models/pending_deployment.dart';
import 'package:github/models/runner.dart';
import 'package:github/models/runner_application.dart';
import 'package:github/models/runner_groups_org.dart';
import 'package:github/models/selected_actions.dart';
import 'package:github/models/workflow.dart';
import 'package:github/models/workflow_id_param.dart';
import 'package:github/models/workflow_run.dart';
import 'package:github/models/workflow_run_status_param.dart';
import 'package:github/models/workflow_run_usage.dart';
import 'package:github/models/workflow_usage.dart';
import 'package:meta/meta.dart';

sealed class ActionsCreateOrUpdateOrgSecretResponse {
  const ActionsCreateOrUpdateOrgSecretResponse();
}

@immutable
final class ActionsCreateOrUpdateOrgSecretResponse201
    extends ActionsCreateOrUpdateOrgSecretResponse {
  const ActionsCreateOrUpdateOrgSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrUpdateOrgSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class ActionsCreateOrUpdateOrgSecretResponse204
    extends ActionsCreateOrUpdateOrgSecretResponse {
  const ActionsCreateOrUpdateOrgSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ActionsCreateOrUpdateOrgSecretResponse204;
}

sealed class ActionsCreateOrUpdateRepoSecretResponse {
  const ActionsCreateOrUpdateRepoSecretResponse();
}

@immutable
final class ActionsCreateOrUpdateRepoSecretResponse201
    extends ActionsCreateOrUpdateRepoSecretResponse {
  const ActionsCreateOrUpdateRepoSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrUpdateRepoSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class ActionsCreateOrUpdateRepoSecretResponse204
    extends ActionsCreateOrUpdateRepoSecretResponse {
  const ActionsCreateOrUpdateRepoSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ActionsCreateOrUpdateRepoSecretResponse204;
}

sealed class ActionsCreateOrUpdateEnvironmentSecretResponse {
  const ActionsCreateOrUpdateEnvironmentSecretResponse();
}

@immutable
final class ActionsCreateOrUpdateEnvironmentSecretResponse201
    extends ActionsCreateOrUpdateEnvironmentSecretResponse {
  const ActionsCreateOrUpdateEnvironmentSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsCreateOrUpdateEnvironmentSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class ActionsCreateOrUpdateEnvironmentSecretResponse204
    extends ActionsCreateOrUpdateEnvironmentSecretResponse {
  const ActionsCreateOrUpdateEnvironmentSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ActionsCreateOrUpdateEnvironmentSecretResponse204;
}

/// Endpoints to manage GitHub Actions using the REST API.
class ActionsApi {
  ActionsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get GitHub Actions cache usage for an organization
  /// Gets the total GitHub Actions cache usage for an organization.
  /// The data fetched using this API is refreshed approximately every 5
  /// minutes, so values returned from this endpoint may take at least 5
  /// minutes to get updated.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `read:org`
  /// scope to use this endpoint.
  Future<ActionsCacheUsageOrgEnterprise> getActionsCacheUsageForOrg(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/cache/usage'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsCacheUsageOrgEnterprise.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories with GitHub Actions cache usage for an organization
  /// Lists repositories and their GitHub Actions cache usage for an
  /// organization.
  /// The data fetched using this API is refreshed approximately every 5
  /// minutes, so values returned from this endpoint may take at least 5
  /// minutes to get updated.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `read:org`
  /// scope to use this endpoint.
  Future<ActionsGetActionsCacheUsageByRepoForOrg200Response>
  getActionsCacheUsageByRepoForOrg(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/cache/usage-by-repository'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetActionsCacheUsageByRepoForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List GitHub-hosted runners for an organization
  /// Lists all GitHub-hosted runners configured in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `manage_runner:org` scope to use this endpoint.
  Future<ActionsListHostedRunnersForOrg200Response> listHostedRunnersForOrg(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListHostedRunnersForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a GitHub-hosted runner for an organization
  /// Creates a GitHub-hosted runner for an organization.
  /// OAuth tokens and personal access tokens (classic) need the
  /// `manage_runners:org` scope to use this endpoint.
  Future<ActionsHostedRunner> createHostedRunnerForOrg(
    String org,
    ActionsCreateHostedRunnerForOrgRequest
    actionsCreateHostedRunnerForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/hosted-runners'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsCreateHostedRunnerForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsHostedRunner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub-owned images for GitHub-hosted runners in an organization
  /// Get the list of GitHub-owned images available for GitHub-hosted runners
  /// for an organization.
  Future<ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response>
  getHostedRunnersGithubOwnedImagesForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/images/github-owned'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetHostedRunnersGithubOwnedImagesForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get partner images for GitHub-hosted runners in an organization
  /// Get the list of partner images available for GitHub-hosted runners for
  /// an organization.
  Future<ActionsGetHostedRunnersPartnerImagesForOrg200Response>
  getHostedRunnersPartnerImagesForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/images/partner'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetHostedRunnersPartnerImagesForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get limits on GitHub-hosted runners for an organization
  /// Get the GitHub-hosted runners limits for an organization.
  Future<ActionsHostedRunnerLimits> getHostedRunnersLimitsForOrg(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/limits'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsHostedRunnerLimits.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub-hosted runners machine specs for an organization
  /// Get the list of machine specs available for GitHub-hosted runners for an
  /// organization.
  Future<ActionsGetHostedRunnersMachineSpecsForOrg200Response>
  getHostedRunnersMachineSpecsForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/machine-sizes'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetHostedRunnersMachineSpecsForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get platforms for GitHub-hosted runners in an organization
  /// Get the list of platforms available for GitHub-hosted runners for an
  /// organization.
  Future<ActionsGetHostedRunnersPlatformsForOrg200Response>
  getHostedRunnersPlatformsForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/platforms'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetHostedRunnersPlatformsForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a GitHub-hosted runner for an organization
  /// Gets a GitHub-hosted runner configured in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `manage_runners:org` scope to use this endpoint.
  Future<ActionsHostedRunner> getHostedRunnerForOrg(
    String org,
    int hostedRunnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/hosted-runners/{hosted_runner_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hosted_runner_id}', '$hostedRunnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsHostedRunner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a GitHub-hosted runner for an organization
  /// Deletes a GitHub-hosted runner for an organization.
  Future<ActionsHostedRunner> deleteHostedRunnerForOrg(
    String org,
    int hostedRunnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/hosted-runners/{hosted_runner_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hosted_runner_id}', '$hostedRunnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsHostedRunner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a GitHub-hosted runner for an organization
  /// Updates a GitHub-hosted runner for an organization.
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `manage_runners:org` scope to use this endpoint.
  Future<ActionsHostedRunner> updateHostedRunnerForOrg(
    String org,
    int hostedRunnerId,
    ActionsUpdateHostedRunnerForOrgRequest
    actionsUpdateHostedRunnerForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/actions/hosted-runners/{hosted_runner_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hosted_runner_id}', '$hostedRunnerId'),
      body: actionsUpdateHostedRunnerForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsHostedRunner.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Actions permissions for an organization
  /// Gets the GitHub Actions permissions policy for repositories and allowed
  /// actions and reusable workflows in an organization.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<ActionsOrganizationPermissions>
  getGithubActionsPermissionsOrganization(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/permissions'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsOrganizationPermissions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set GitHub Actions permissions for an organization
  /// Sets the GitHub Actions permissions policy for repositories and allowed
  /// actions and reusable workflows in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setGithubActionsPermissionsOrganization(
    String org,
    ActionsSetGithubActionsPermissionsOrganizationRequest
    actionsSetGithubActionsPermissionsOrganizationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/permissions'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsSetGithubActionsPermissionsOrganizationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List selected repositories enabled for GitHub Actions in an organization
  /// Lists the selected repositories that are enabled for GitHub Actions in
  /// an organization. To use this endpoint, the organization permission
  /// policy for `enabled_repositories` must be configured to `selected`. For
  /// more information, see "[Set GitHub Actions permissions for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<
    ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response
  >
  listSelectedRepositoriesEnabledGithubActionsOrganization(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/permissions/repositories'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelectedRepositoriesEnabledGithubActionsOrganization200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set selected repositories enabled for GitHub Actions in an organization
  /// Replaces the list of selected repositories that are enabled for GitHub
  /// Actions in an organization. To use this endpoint, the organization
  /// permission policy for `enabled_repositories` must be configured to
  /// `selected`. For more information, see "[Set GitHub Actions permissions
  /// for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setSelectedRepositoriesEnabledGithubActionsOrganization(
    String org,
    ActionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest
    actionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/permissions/repositories'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body:
          actionsSetSelectedRepositoriesEnabledGithubActionsOrganizationRequest
              .toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Enable a selected repository for GitHub Actions in an organization
  /// Adds a repository to the list of selected repositories that are enabled
  /// for GitHub Actions in an organization. To use this endpoint, the
  /// organization permission policy for `enabled_repositories` must be must
  /// be configured to `selected`. For more information, see "[Set GitHub
  /// Actions permissions for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<void> enableSelectedRepositoryGithubActionsOrganization(
    String org,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/permissions/repositories/{repository_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Disable a selected repository for GitHub Actions in an organization
  /// Removes a repository from the list of selected repositories that are
  /// enabled for GitHub Actions in an organization. To use this endpoint, the
  /// organization permission policy for `enabled_repositories` must be
  /// configured to `selected`. For more information, see "[Set GitHub Actions
  /// permissions for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<void> disableSelectedRepositoryGithubActionsOrganization(
    String org,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/permissions/repositories/{repository_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get allowed actions and reusable workflows for an organization
  /// Gets the selected actions and reusable workflows that are allowed in an
  /// organization. To use this endpoint, the organization permission policy
  /// for `allowed_actions` must be configured to `selected`. For more
  /// information, see "[Set GitHub Actions permissions for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<SelectedActions> getAllowedActionsOrganization(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/permissions/selected-actions'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SelectedActions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set allowed actions and reusable workflows for an organization
  /// Sets the actions and reusable workflows that are allowed in an
  /// organization. To use this endpoint, the organization permission policy
  /// for `allowed_actions` must be configured to `selected`. For more
  /// information, see "[Set GitHub Actions permissions for an
  /// organization](#set-github-actions-permissions-for-an-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setAllowedActionsOrganization(
    String org, {
    SelectedActions? selectedActions,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/permissions/selected-actions'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: selectedActions?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get default workflow permissions for an organization
  /// Gets the default workflow permissions granted to the `GITHUB_TOKEN` when
  /// running workflows in an organization,
  /// as well as whether GitHub Actions can submit approving pull request
  /// reviews. For more information, see
  /// "[Setting the permissions of the GITHUB_TOKEN for your
  /// organization](https://docs.github.com/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#setting-the-permissions-of-the-github_token-for-your-organization)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<ActionsGetDefaultWorkflowPermissions>
  getGithubActionsDefaultWorkflowPermissionsOrganization(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/permissions/workflow'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetDefaultWorkflowPermissions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set default workflow permissions for an organization
  /// Sets the default workflow permissions granted to the `GITHUB_TOKEN` when
  /// running workflows in an organization, and sets if GitHub Actions
  /// can submit approving pull request reviews. For more information, see
  /// "[Setting the permissions of the GITHUB_TOKEN for your
  /// organization](https://docs.github.com/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#setting-the-permissions-of-the-github_token-for-your-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setGithubActionsDefaultWorkflowPermissionsOrganization(
    String org, {
    ActionsSetDefaultWorkflowPermissions? actionsSetDefaultWorkflowPermissions,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/permissions/workflow'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsSetDefaultWorkflowPermissions?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List self-hosted runner groups for an organization
  /// Lists all self-hosted runner groups configured in an organization and
  /// inherited from an enterprise.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<ActionsListSelfHostedRunnerGroupsForOrg200Response>
  listSelfHostedRunnerGroupsForOrg(
    String org, {
    int? perPage = 30,
    int? page = 1,
    String? visibleToRepository,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runner-groups'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (visibleToRepository != null)
          'visible_to_repository': [visibleToRepository],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelfHostedRunnerGroupsForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a self-hosted runner group for an organization
  /// Creates a new self-hosted runner group for an organization.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<RunnerGroupsOrg> createSelfHostedRunnerGroupForOrg(
    String org,
    ActionsCreateSelfHostedRunnerGroupForOrgRequest
    actionsCreateSelfHostedRunnerGroupForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/runner-groups'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsCreateSelfHostedRunnerGroupForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RunnerGroupsOrg.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a self-hosted runner group for an organization
  /// Gets a specific self-hosted runner group for an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<RunnerGroupsOrg> getSelfHostedRunnerGroupForOrg(
    String org,
    int runnerGroupId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RunnerGroupsOrg.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a self-hosted runner group from an organization
  /// Deletes a self-hosted runner group for an organization.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<void> deleteSelfHostedRunnerGroupFromOrg(
    String org,
    int runnerGroupId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a self-hosted runner group for an organization
  /// Updates the `name` and `visibility` of a self-hosted runner group in an
  /// organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<RunnerGroupsOrg> updateSelfHostedRunnerGroupForOrg(
    String org,
    int runnerGroupId,
    ActionsUpdateSelfHostedRunnerGroupForOrgRequest
    actionsUpdateSelfHostedRunnerGroupForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      body: actionsUpdateSelfHostedRunnerGroupForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RunnerGroupsOrg.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List GitHub-hosted runners in a group for an organization
  /// Lists the GitHub-hosted runners in an organization group.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<ActionsListGithubHostedRunnersInGroupForOrg200Response>
  listGithubHostedRunnersInGroupForOrg(
    String org,
    int runnerGroupId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}/hosted-runners'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListGithubHostedRunnersInGroupForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository access to a self-hosted runner group in an organization
  /// Lists the repositories with access to a self-hosted runner group
  /// configured in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response>
  listRepoAccessToSelfHostedRunnerGroupInOrg(
    String org,
    int runnerGroupId, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoAccessToSelfHostedRunnerGroupInOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set repository access for a self-hosted runner group in an organization
  /// Replaces the list of repositories that have access to a self-hosted
  /// runner group configured in an organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setRepoAccessToSelfHostedRunnerGroupInOrg(
    String org,
    int runnerGroupId,
    ActionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest
    actionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      body: actionsSetRepoAccessToSelfHostedRunnerGroupInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add repository access to a self-hosted runner group in an organization
  /// Adds a repository to the list of repositories that can access a
  /// self-hosted runner group. The runner group must have `visibility` set to
  /// `selected`. For more information, see "[Create a self-hosted runner
  /// group for an
  /// organization](#create-a-self-hosted-runner-group-for-an-organization)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<void> addRepoAccessToSelfHostedRunnerGroupInOrg(
    String org,
    int runnerGroupId,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{runner_group_id}', '$runnerGroupId')
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove repository access to a self-hosted runner group in an
  /// organization
  /// Removes a repository from the list of selected repositories that can
  /// access a self-hosted runner group. The runner group must have
  /// `visibility` set to `selected`. For more information, see "[Create a
  /// self-hosted runner group for an
  /// organization](#create-a-self-hosted-runner-group-for-an-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> removeRepoAccessToSelfHostedRunnerGroupInOrg(
    String org,
    int runnerGroupId,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{runner_group_id}', '$runnerGroupId')
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List self-hosted runners in a group for an organization
  /// Lists self-hosted runners that are in a specific organization group.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<ActionsListSelfHostedRunnersInGroupForOrg200Response>
  listSelfHostedRunnersInGroupForOrg(
    String org,
    int runnerGroupId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}/runners'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelfHostedRunnersInGroupForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set self-hosted runners in a group for an organization
  /// Replaces the list of self-hosted runners that are part of an
  /// organization runner group.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setSelfHostedRunnersInGroupForOrg(
    String org,
    int runnerGroupId,
    ActionsSetSelfHostedRunnersInGroupForOrgRequest
    actionsSetSelfHostedRunnersInGroupForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/runner-groups/{runner_group_id}/runners'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_group_id}', '$runnerGroupId'),
      body: actionsSetSelfHostedRunnersInGroupForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add a self-hosted runner to a group for an organization
  /// Adds a self-hosted runner to a runner group configured in an
  /// organization.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<void> addSelfHostedRunnerToGroupForOrg(
    String org,
    int runnerGroupId,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{runner_group_id}', '$runnerGroupId')
              .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a self-hosted runner from a group for an organization
  /// Removes a self-hosted runner from a group configured in an organization.
  /// The runner is then returned to the default group.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> removeSelfHostedRunnerFromGroupForOrg(
    String org,
    int runnerGroupId,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{runner_group_id}', '$runnerGroupId')
              .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List self-hosted runners for an organization
  /// Lists all self-hosted runners configured in an organization.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsListSelfHostedRunnersForOrg200Response>
  listSelfHostedRunnersForOrg(
    String org, {
    String? name,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runners'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (name != null) 'name': [name],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelfHostedRunnersForOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List runner applications for an organization
  /// Lists binaries for the runner application that you can download and run.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.  If the repository is private,
  /// the `repo` scope is also required.
  Future<List<RunnerApplication>> listRunnerApplicationsForOrg(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runners/downloads'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RunnerApplication>(
            (e) => RunnerApplication.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create configuration for a just-in-time runner for an organization
  /// Generates a configuration that can be passed to the runner application
  /// at startup.
  ///
  /// The authenticated user must have admin access to the organization.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<ActionsRunnerJitconfigResponse> generateRunnerJitconfigForOrg(
    String org,
    ActionsGenerateRunnerJitconfigForOrgRequest
    actionsGenerateRunnerJitconfigForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/runners/generate-jitconfig'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsGenerateRunnerJitconfigForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerJitconfigResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a registration token for an organization
  /// Returns a token that you can pass to the `config` script. The token
  /// expires after one hour.
  ///
  /// For example, you can replace `TOKEN` in the following example with the
  /// registration token provided by this endpoint to configure your
  /// self-hosted runner:
  ///
  /// ```
  /// ./config.sh --url https://github.com/octo-org --token TOKEN
  /// ```
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<AuthenticationToken> createRegistrationTokenForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/runners/registration-token'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AuthenticationToken.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a remove token for an organization
  /// Returns a token that you can pass to the `config` script to remove a
  /// self-hosted runner from an organization. The token expires after one
  /// hour.
  ///
  /// For example, you can replace `TOKEN` in the following example with the
  /// registration token provided by this endpoint to remove your self-hosted
  /// runner from an organization:
  ///
  /// ```
  /// ./config.sh remove --token TOKEN
  /// ```
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<AuthenticationToken> createRemoveTokenForOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/runners/remove-token'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AuthenticationToken.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a self-hosted runner for an organization
  /// Gets a specific self-hosted runner configured in an organization.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<Runner> getSelfHostedRunnerForOrg(String org, int runnerId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runners/{runner_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Runner.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a self-hosted runner from an organization
  /// Forces the removal of a self-hosted runner from an organization. You can
  /// use this endpoint to completely remove the runner when the machine you
  /// were using no longer exists.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<void> deleteSelfHostedRunnerFromOrg(String org, int runnerId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/runners/{runner_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List labels for a self-hosted runner for an organization
  /// Lists all labels for a self-hosted runner configured in an organization.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsRunnerLabelsResponse> listLabelsForSelfHostedRunnerForOrg(
    String org,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/runners/{runner_id}/labels'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add custom labels to a self-hosted runner for an organization
  /// Adds custom labels to a self-hosted runner configured in an
  /// organization.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<ActionsRunnerLabelsResponse> addCustomLabelsToSelfHostedRunnerForOrg(
    String org,
    int runnerId,
    ActionsAddCustomLabelsToSelfHostedRunnerForOrgRequest
    actionsAddCustomLabelsToSelfHostedRunnerForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/runners/{runner_id}/labels'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
      body: actionsAddCustomLabelsToSelfHostedRunnerForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set custom labels for a self-hosted runner for an organization
  /// Remove all previous custom labels and set the new custom labels for a
  /// specific
  /// self-hosted runner configured in an organization.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsRunnerLabelsResponse> setCustomLabelsForSelfHostedRunnerForOrg(
    String org,
    int runnerId,
    ActionsSetCustomLabelsForSelfHostedRunnerForOrgRequest
    actionsSetCustomLabelsForSelfHostedRunnerForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/runners/{runner_id}/labels'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
      body: actionsSetCustomLabelsForSelfHostedRunnerForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove all custom labels from a self-hosted runner for an organization
  /// Remove all custom labels from a self-hosted runner configured in an
  /// organization. Returns the remaining read-only labels from the runner.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsRunnerLabelsReadonlyResponse>
  removeAllCustomLabelsFromSelfHostedRunnerForOrg(
    String org,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/runners/{runner_id}/labels'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsReadonlyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove a custom label from a self-hosted runner for an organization
  /// Remove a custom label from a self-hosted runner configured
  /// in an organization. Returns the remaining labels from the runner.
  ///
  /// This endpoint returns a `404 Not Found` status if the custom label is
  /// not
  /// present on the runner.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsRunnerLabelsResponse>
  removeCustomLabelFromSelfHostedRunnerForOrg(
    String org,
    int runnerId,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/runners/{runner_id}/labels/{name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{runner_id}', '$runnerId')
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization secrets
  /// Lists all secrets available in an organization without revealing their
  /// encrypted values.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsListOrgSecrets200Response> listOrgSecrets(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/secrets'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListOrgSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization public key
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets.
  ///
  /// The authenticated user must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<ActionsPublicKey> getOrgPublicKey(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/secrets/public-key'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization secret
  /// Gets a single organization secret without revealing its encrypted value.
  ///
  /// The authenticated user must have collaborator access to a repository to
  /// create, update, or read secrets
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<OrganizationActionsSecret> getOrgSecret(
    String org,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationActionsSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update an organization secret
  /// Creates or updates an organization secret with an encrypted value.
  /// Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<ActionsCreateOrUpdateOrgSecretResponse> createOrUpdateOrgSecret(
    String org,
    String secretName,
    ActionsCreateOrUpdateOrgSecretRequest actionsCreateOrUpdateOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: actionsCreateOrUpdateOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ActionsCreateOrUpdateOrgSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const ActionsCreateOrUpdateOrgSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete an organization secret
  /// Deletes a secret in an organization using the secret name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<void> deleteOrgSecret(String org, String secretName) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List selected repositories for an organization secret
  /// Lists all repositories that have been selected when the `visibility`
  /// for repository access to a secret is set to `selected`.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsListSelectedReposForOrgSecret200Response>
  listSelectedReposForOrgSecret(
    String org,
    String secretName, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/secrets/{secret_name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelectedReposForOrgSecret200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set selected repositories for an organization secret
  /// Replaces all repositories for an organization secret when the
  /// `visibility`
  /// for repository access is set to `selected`. The visibility is set when
  /// you [Create
  /// or update an organization
  /// secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<void> setSelectedReposForOrgSecret(
    String org,
    String secretName,
    ActionsSetSelectedReposForOrgSecretRequest
    actionsSetSelectedReposForOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/secrets/{secret_name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: actionsSetSelectedReposForOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add selected repository to an organization secret
  /// Adds a repository to an organization secret when the `visibility` for
  /// repository access is set to `selected`. For more information about
  /// setting the visibility, see [Create or
  /// update an organization
  /// secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<void> addSelectedRepoToOrgSecret(
    String org,
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove selected repository from an organization secret
  /// Removes a repository from an organization secret when the `visibility`
  /// for repository access is set to `selected`. The visibility is set when
  /// you [Create
  /// or update an organization
  /// secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<void> removeSelectedRepoFromOrgSecret(
    String org,
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List organization variables
  /// Lists all organization variables.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsListOrgVariables200Response> listOrgVariables(
    String org, {
    int? perPage = 10,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/variables'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListOrgVariables200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization variable
  /// Creates an organization variable that you can reference in a GitHub
  /// Actions workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<EmptyObject> createOrgVariable(
    String org,
    ActionsCreateOrgVariableRequest actionsCreateOrgVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/actions/variables'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: actionsCreateOrgVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization variable
  /// Gets a specific variable in an organization.
  ///
  /// The authenticated user must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<OrganizationActionsVariable> getOrgVariable(
    String org,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/variables/{name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationActionsVariable.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an organization variable
  /// Deletes an organization variable using the variable name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<void> deleteOrgVariable(String org, String name) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/variables/{name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an organization variable
  /// Updates an organization variable that you can reference in a GitHub
  /// Actions workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<void> updateOrgVariable(
    String org,
    String name,
    ActionsUpdateOrgVariableRequest actionsUpdateOrgVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/actions/variables/{name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      body: actionsUpdateOrgVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List selected repositories for an organization variable
  /// Lists all repositories that can access an organization variable
  /// that is available to selected repositories.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<ActionsListSelectedReposForOrgVariable200Response>
  listSelectedReposForOrgVariable(
    String org,
    String name, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/actions/variables/{name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelectedReposForOrgVariable200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set selected repositories for an organization variable
  /// Replaces all repositories for an organization variable that is available
  /// to selected repositories. Organization variables that are available to
  /// selected
  /// repositories have their `visibility` field set to `selected`.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<void> setSelectedReposForOrgVariable(
    String org,
    String name,
    ActionsSetSelectedReposForOrgVariableRequest
    actionsSetSelectedReposForOrgVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/variables/{name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      body: actionsSetSelectedReposForOrgVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add selected repository to an organization variable
  /// Adds a repository to an organization variable that is available to
  /// selected repositories.
  /// Organization variables that are available to selected repositories have
  /// their `visibility` field set to `selected`.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint. If the repository is private, OAuth tokens
  /// and personal access tokens (classic) need the `repo` scope to use this
  /// endpoint.
  Future<void> addSelectedRepoToOrgVariable(
    String org,
    String name,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/actions/variables/{name}/repositories/{repository_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name))
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove selected repository from an organization variable
  /// Removes a repository from an organization variable that is
  /// available to selected repositories. Organization variables that are
  /// available to
  /// selected repositories have their `visibility` field set to `selected`.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint. If the repository is private,
  /// the `repo` scope is also required.
  Future<void> removeSelectedRepoFromOrgVariable(
    String org,
    String name,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/actions/variables/{name}/repositories/{repository_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{name}', Uri.encodeComponent(name))
          .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List artifacts for a repository
  /// Lists all artifacts for a repository.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ActionsListArtifactsForRepo200Response> listArtifactsForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
    String? name,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/artifacts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (name != null) 'name': [name],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListArtifactsForRepo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an artifact
  /// Gets a specific artifact for a workflow run.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<Artifact> getArtifact(
    String owner,
    String repo,
    int artifactId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/artifacts/{artifact_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{artifact_id}', '$artifactId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Artifact.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an artifact
  /// Deletes an artifact for a workflow run.
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteArtifact(String owner, String repo, int artifactId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/artifacts/{artifact_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{artifact_id}', '$artifactId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Download an artifact
  /// Gets a redirect URL to download an archive for a repository. This URL
  /// expires after 1 minute. Look for `Location:` in
  /// the response header to find the URL for the download. The
  /// `:archive_format` must be `zip`.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> downloadArtifact(
    String owner,
    String repo,
    int artifactId,
    String archiveFormat,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{artifact_id}', '$artifactId')
              .replaceAll(
                '{archive_format}',
                Uri.encodeComponent(archiveFormat),
              ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get GitHub Actions cache usage for a repository
  /// Gets GitHub Actions cache usage for a repository.
  /// The data fetched using this API is refreshed approximately every 5
  /// minutes, so values returned from this endpoint may take at least 5
  /// minutes to get updated.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<ActionsCacheUsageByRepository> getActionsCacheUsage(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/cache/usage'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsCacheUsageByRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List GitHub Actions caches for a repository
  /// Lists the GitHub Actions caches for a repository.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsCacheList> getActionsCacheList(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
    String? ref,
    String? key,
    ActionsCacheListSortParam? sort = ActionsCacheListSortParam.lastAccessedAt,
    DirectionParam? direction = DirectionParam.desc,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/caches'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (ref != null) 'ref': [ref],
        if (key != null) 'key': [key],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsCacheList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete GitHub Actions caches for a repository (using a cache key)
  /// Deletes one or more GitHub Actions caches for a repository, using a
  /// complete cache key. By default, all caches that match the provided key
  /// are deleted, but you can optionally provide a Git ref to restrict
  /// deletions to caches that match both the provided key and the Git ref.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsCacheList> deleteActionsCacheByKey(
    String owner,
    String repo,
    String key, {
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/caches'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        'key': [key],
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsCacheList.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a GitHub Actions cache for a repository (using a cache ID)
  /// Deletes a GitHub Actions cache for a repository, using a cache ID.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteActionsCacheById(
    String owner,
    String repo,
    int cacheId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/caches/{cache_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{cache_id}', '$cacheId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a job for a workflow run
  /// Gets a specific job in a workflow run.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<Job> getJobForWorkflowRun(String owner, String repo, int jobId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/jobs/{job_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{job_id}', '$jobId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Job.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Download job logs for a workflow run
  /// Gets a redirect URL to download a plain text file of logs for a workflow
  /// job. This link expires after 1 minute. Look
  /// for `Location:` in the response header to find the URL for the download.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<void> downloadJobLogsForWorkflowRun(
    String owner,
    String repo,
    int jobId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/jobs/{job_id}/logs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{job_id}', '$jobId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Re-run a job from a workflow run
  /// Re-run a job and its dependent jobs in a workflow run.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<EmptyObject> reRunJobForWorkflowRun(
    String owner,
    String repo,
    int jobId, {
    ActionsReRunJobForWorkflowRunRequest? actionsReRunJobForWorkflowRunRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/jobs/{job_id}/rerun'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{job_id}', '$jobId'),
      body: actionsReRunJobForWorkflowRunRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the customization template for an OIDC subject claim for a
  /// repository
  /// Gets the customization template for an OpenID Connect (OIDC) subject
  /// claim.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<OidcCustomSubRepo> getCustomOidcSubClaimForRepo(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/oidc/customization/sub'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OidcCustomSubRepo.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set the customization template for an OIDC subject claim for a
  /// repository
  /// Sets the customization template and `opt-in` or `opt-out` flag for an
  /// OpenID Connect (OIDC) subject claim for a repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<EmptyObject> setCustomOidcSubClaimForRepo(
    String owner,
    String repo,
    ActionsSetCustomOidcSubClaimForRepoRequest
    actionsSetCustomOidcSubClaimForRepoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/oidc/customization/sub'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsSetCustomOidcSubClaimForRepoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository organization secrets
  /// Lists all organization secrets shared with a repository without
  /// revealing their encrypted
  /// values.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListRepoOrganizationSecrets200Response>
  listRepoOrganizationSecrets(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/organization-secrets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoOrganizationSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository organization variables
  /// Lists all organization variables shared with a repository.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListRepoOrganizationVariables200Response>
  listRepoOrganizationVariables(
    String owner,
    String repo, {
    int? perPage = 10,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/organization-variables'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoOrganizationVariables200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Actions permissions for a repository
  /// Gets the GitHub Actions permissions policy for a repository, including
  /// whether GitHub Actions is enabled and the actions and reusable workflows
  /// allowed to run in the repository.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsRepositoryPermissions> getGithubActionsPermissionsRepository(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/permissions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRepositoryPermissions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set GitHub Actions permissions for a repository
  /// Sets the GitHub Actions permissions policy for enabling GitHub Actions
  /// and allowed actions and reusable workflows in the repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> setGithubActionsPermissionsRepository(
    String owner,
    String repo,
    ActionsSetGithubActionsPermissionsRepositoryRequest
    actionsSetGithubActionsPermissionsRepositoryRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/permissions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsSetGithubActionsPermissionsRepositoryRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get the level of access for workflows outside of the repository
  /// Gets the level of access that workflows outside of the repository have
  /// to actions and reusable workflows in the repository.
  /// This endpoint only applies to private repositories.
  /// For more information, see "[Allowing access to components in a private
  /// repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-access-to-components-in-a-private-repository)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsWorkflowAccessToRepository> getWorkflowAccessToRepository(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/permissions/access'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsWorkflowAccessToRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set the level of access for workflows outside of the repository
  /// Sets the level of access that workflows outside of the repository have
  /// to actions and reusable workflows in the repository.
  /// This endpoint only applies to private repositories.
  /// For more information, see "[Allowing access to components in a private
  /// repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-access-to-components-in-a-private-repository)".
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> setWorkflowAccessToRepository(
    String owner,
    String repo,
    ActionsWorkflowAccessToRepository actionsWorkflowAccessToRepository,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/permissions/access'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsWorkflowAccessToRepository.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get allowed actions and reusable workflows for a repository
  /// Gets the settings for selected actions and reusable workflows that are
  /// allowed in a repository. To use this endpoint, the repository policy for
  /// `allowed_actions` must be configured to `selected`. For more
  /// information, see "[Set GitHub Actions permissions for a
  /// repository](#set-github-actions-permissions-for-a-repository)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<SelectedActions> getAllowedActionsRepository(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/permissions/selected-actions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SelectedActions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set allowed actions and reusable workflows for a repository
  /// Sets the actions and reusable workflows that are allowed in a
  /// repository. To use this endpoint, the repository permission policy for
  /// `allowed_actions` must be configured to `selected`. For more
  /// information, see "[Set GitHub Actions permissions for a
  /// repository](#set-github-actions-permissions-for-a-repository)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> setAllowedActionsRepository(
    String owner,
    String repo, {
    SelectedActions? selectedActions,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/permissions/selected-actions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: selectedActions?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get default workflow permissions for a repository
  /// Gets the default workflow permissions granted to the `GITHUB_TOKEN` when
  /// running workflows in a repository,
  /// as well as if GitHub Actions can submit approving pull request reviews.
  /// For more information, see "[Setting the permissions of the GITHUB_TOKEN
  /// for your
  /// repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsGetDefaultWorkflowPermissions>
  getGithubActionsDefaultWorkflowPermissionsRepository(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/permissions/workflow'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsGetDefaultWorkflowPermissions.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set default workflow permissions for a repository
  /// Sets the default workflow permissions granted to the `GITHUB_TOKEN` when
  /// running workflows in a repository, and sets if GitHub Actions
  /// can submit approving pull request reviews.
  /// For more information, see "[Setting the permissions of the GITHUB_TOKEN
  /// for your
  /// repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> setGithubActionsDefaultWorkflowPermissionsRepository(
    String owner,
    String repo,
    ActionsSetDefaultWorkflowPermissions actionsSetDefaultWorkflowPermissions,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/permissions/workflow'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsSetDefaultWorkflowPermissions.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List self-hosted runners for a repository
  /// Lists all self-hosted runners configured in a repository.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListSelfHostedRunnersForRepo200Response>
  listSelfHostedRunnersForRepo(
    String owner,
    String repo, {
    String? name,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runners'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (name != null) 'name': [name],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListSelfHostedRunnersForRepo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List runner applications for a repository
  /// Lists binaries for the runner application that you can download and run.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<List<RunnerApplication>> listRunnerApplicationsForRepo(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runners/downloads'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RunnerApplication>(
            (e) => RunnerApplication.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create configuration for a just-in-time runner for a repository
  /// Generates a configuration that can be passed to the runner application
  /// at startup.
  ///
  /// The authenticated user must have admin access to the repository.
  ///
  /// OAuth tokens and personal access tokens (classic) need the`repo` scope
  /// to use this endpoint.
  Future<ActionsRunnerJitconfigResponse> generateRunnerJitconfigForRepo(
    String owner,
    String repo,
    ActionsGenerateRunnerJitconfigForRepoRequest
    actionsGenerateRunnerJitconfigForRepoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runners/generate-jitconfig'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsGenerateRunnerJitconfigForRepoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerJitconfigResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a registration token for a repository
  /// Returns a token that you can pass to the `config` script. The token
  /// expires after one hour.
  ///
  /// For example, you can replace `TOKEN` in the following example with the
  /// registration token provided by this endpoint to configure your
  /// self-hosted runner:
  ///
  /// ```
  /// ./config.sh --url https://github.com/octo-org --token TOKEN
  /// ```
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<AuthenticationToken> createRegistrationTokenForRepo(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runners/registration-token'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AuthenticationToken.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a remove token for a repository
  /// Returns a token that you can pass to the `config` script to remove a
  /// self-hosted runner from an repository. The token expires after one hour.
  ///
  /// For example, you can replace `TOKEN` in the following example with the
  /// registration token provided by this endpoint to remove your self-hosted
  /// runner from an organization:
  ///
  /// ```
  /// ./config.sh remove --token TOKEN
  /// ```
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<AuthenticationToken> createRemoveTokenForRepo(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runners/remove-token'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return AuthenticationToken.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a self-hosted runner for a repository
  /// Gets a specific self-hosted runner configured in a repository.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<Runner> getSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Runner.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a self-hosted runner from a repository
  /// Forces the removal of a self-hosted runner from a repository. You can
  /// use this endpoint to completely remove the runner when the machine you
  /// were using no longer exists.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteSelfHostedRunnerFromRepo(
    String owner,
    String repo,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List labels for a self-hosted runner for a repository
  /// Lists all labels for a self-hosted runner configured in a repository.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsRunnerLabelsResponse> listLabelsForSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add custom labels to a self-hosted runner for a repository
  /// Adds custom labels to a self-hosted runner configured in a repository.
  ///
  /// Authenticated users must have admin access to the organization to use
  /// this endpoint.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsRunnerLabelsResponse> addCustomLabelsToSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
    ActionsAddCustomLabelsToSelfHostedRunnerForRepoRequest
    actionsAddCustomLabelsToSelfHostedRunnerForRepoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
      body: actionsAddCustomLabelsToSelfHostedRunnerForRepoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set custom labels for a self-hosted runner for a repository
  /// Remove all previous custom labels and set the new custom labels for a
  /// specific
  /// self-hosted runner configured in a repository.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsRunnerLabelsResponse> setCustomLabelsForSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
    ActionsSetCustomLabelsForSelfHostedRunnerForRepoRequest
    actionsSetCustomLabelsForSelfHostedRunnerForRepoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
      body: actionsSetCustomLabelsForSelfHostedRunnerForRepoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove all custom labels from a self-hosted runner for a repository
  /// Remove all custom labels from a self-hosted runner configured in a
  /// repository. Returns the remaining read-only labels from the runner.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsRunnerLabelsReadonlyResponse>
  removeAllCustomLabelsFromSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsReadonlyResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove a custom label from a self-hosted runner for a repository
  /// Remove a custom label from a self-hosted runner configured
  /// in a repository. Returns the remaining labels from the runner.
  ///
  /// This endpoint returns a `404 Not Found` status if the custom label is
  /// not
  /// present on the runner.
  ///
  /// Authenticated users must have admin access to the repository to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsRunnerLabelsResponse>
  removeCustomLabelFromSelfHostedRunnerForRepo(
    String owner,
    String repo,
    int runnerId,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{runner_id}', '$runnerId')
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsRunnerLabelsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List workflow runs for a repository
  /// Lists all workflow runs for a repository. You can use parameters to
  /// narrow the list of results. For more information about using parameters,
  /// see
  /// [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  ///
  /// This endpoint will return up to 1,000 results for each search when using
  /// the following parameters: `actor`, `branch`, `check_suite_id`,
  /// `created`, `event`, `head_sha`, `status`.
  Future<ActionsListWorkflowRunsForRepo200Response> listWorkflowRunsForRepo(
    String owner,
    String repo, {
    String? actor,
    String? branch,
    String? event,
    WorkflowRunStatusParam? status,
    int? perPage = 30,
    int? page = 1,
    DateTime? created,
    bool? excludePullRequests = false,
    int? checkSuiteId,
    String? headSha,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (actor != null) 'actor': [actor],
        if (branch != null) 'branch': [branch],
        if (event != null) 'event': [event],
        if (status != null) 'status': [status.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (created != null) 'created': [created.toIso8601String()],
        if (excludePullRequests != null)
          'exclude_pull_requests': [excludePullRequests.toString()],
        if (checkSuiteId != null) 'check_suite_id': [checkSuiteId.toString()],
        if (headSha != null) 'head_sha': [headSha],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListWorkflowRunsForRepo200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a workflow run
  /// Gets a specific workflow run.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<WorkflowRun> getWorkflowRun(
    String owner,
    String repo,
    int runId, {
    bool? excludePullRequests = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      queryParameters: {
        if (excludePullRequests != null)
          'exclude_pull_requests': [excludePullRequests.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WorkflowRun.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a workflow run
  /// Deletes a specific workflow run.
  ///
  /// Anyone with write access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<void> deleteWorkflowRun(String owner, String repo, int runId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get the review history for a workflow run
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<List<EnvironmentApprovals>> getReviewsForRun(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/approvals'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<EnvironmentApprovals>(
            (e) => EnvironmentApprovals.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Approve a workflow run for a fork pull request
  /// Approves a workflow run for a pull request from a public fork of a first
  /// time contributor. For more information, see ["Approving workflow runs
  /// from public
  /// forks](https://docs.github.com/actions/managing-workflow-runs/approving-workflow-runs-from-public-forks)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<EmptyObject> approveWorkflowRun(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/approve'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List workflow run artifacts
  /// Lists artifacts for a workflow run.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ActionsListWorkflowRunArtifacts200Response> listWorkflowRunArtifacts(
    String owner,
    String repo,
    int runId, {
    int? perPage = 30,
    int? page = 1,
    String? name,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/artifacts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (name != null) 'name': [name],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListWorkflowRunArtifacts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a workflow run attempt
  /// Gets a specific workflow run attempt.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<WorkflowRun> getWorkflowRunAttempt(
    String owner,
    String repo,
    int runId,
    int attemptNumber, {
    bool? excludePullRequests = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{run_id}', '$runId')
              .replaceAll('{attempt_number}', '$attemptNumber'),
      queryParameters: {
        if (excludePullRequests != null)
          'exclude_pull_requests': [excludePullRequests.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WorkflowRun.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List jobs for a workflow run attempt
  /// Lists jobs for a specific workflow run attempt. You can use parameters
  /// to narrow the list of results. For more information
  /// about using parameters, see
  /// [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint  with a private repository.
  Future<ActionsListJobsForWorkflowRunAttempt200Response>
  listJobsForWorkflowRunAttempt(
    String owner,
    String repo,
    int runId,
    int attemptNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{run_id}', '$runId')
              .replaceAll('{attempt_number}', '$attemptNumber'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListJobsForWorkflowRunAttempt200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Download workflow run attempt logs
  /// Gets a redirect URL to download an archive of log files for a specific
  /// workflow run attempt. This link expires after
  /// 1 minute. Look for `Location:` in the response header to find the URL
  /// for the download.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<void> downloadWorkflowRunAttemptLogs(
    String owner,
    String repo,
    int runId,
    int attemptNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{run_id}', '$runId')
              .replaceAll('{attempt_number}', '$attemptNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Cancel a workflow run
  /// Cancels a workflow run using its `id`.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<EmptyObject> cancelWorkflowRun(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/cancel'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Review custom deployment protection rules for a workflow run
  /// Approve or reject custom deployment protection rules provided by a
  /// GitHub App for a workflow run. For more information, see "[Using
  /// environments for
  /// deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment)."
  ///
  /// > [!NOTE]
  /// > GitHub Apps can only review their own custom deployment protection
  /// rules. To approve or reject pending deployments that are waiting for
  /// review from a specific person or team, see [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments`](/rest/actions/workflow-runs#review-pending-deployments-for-a-workflow-run).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<void> reviewCustomGatesForRun(
    String owner,
    String repo,
    int runId,
    ActionsReviewCustomGatesForRunRequest actionsReviewCustomGatesForRunRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{run_id}', '$runId'),
      body: actionsReviewCustomGatesForRunRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Force cancel a workflow run
  /// Cancels a workflow run and bypasses conditions that would otherwise
  /// cause a workflow execution to continue, such as an `always()` condition
  /// on a job.
  /// You should only use this endpoint to cancel a workflow run when the
  /// workflow run is not responding to [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/cancel`](/rest/actions/workflow-runs#cancel-a-workflow-run).
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<EmptyObject> forceCancelWorkflowRun(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List jobs for a workflow run
  /// Lists jobs for a workflow run. You can use parameters to narrow the list
  /// of results. For more information
  /// about using parameters, see
  /// [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ActionsListJobsForWorkflowRun200Response> listJobsForWorkflowRun(
    String owner,
    String repo,
    int runId, {
    ActionsListJobsForWorkflowRunParameter3? filter =
        ActionsListJobsForWorkflowRunParameter3.latest,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/jobs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      queryParameters: {
        if (filter != null) 'filter': [filter.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListJobsForWorkflowRun200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Download workflow run logs
  /// Gets a redirect URL to download an archive of log files for a workflow
  /// run. This link expires after 1 minute. Look for
  /// `Location:` in the response header to find the URL for the download.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<void> downloadWorkflowRunLogs(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/logs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete workflow run logs
  /// Deletes all logs for a workflow run.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteWorkflowRunLogs(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/logs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get pending deployments for a workflow run
  /// Get all deployment environments for a workflow run that are waiting for
  /// protection rules to pass.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<List<PendingDeployment>> getPendingDeploymentsForRun(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PendingDeployment>(
            (e) => PendingDeployment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Review pending deployments for a workflow run
  /// Approve or reject pending deployments that are waiting on approval by a
  /// required reviewer.
  ///
  /// Required reviewers with read access to the repository contents and
  /// deployments can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<List<Deployment>> reviewPendingDeploymentsForRun(
    String owner,
    String repo,
    int runId,
    ActionsReviewPendingDeploymentsForRunRequest
    actionsReviewPendingDeploymentsForRunRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      body: actionsReviewPendingDeploymentsForRunRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Deployment>(
            (e) => Deployment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Re-run a workflow
  /// Re-runs your workflow run using its `id`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<EmptyObject> reRunWorkflow(
    String owner,
    String repo,
    int runId, {
    ActionsReRunWorkflowRequest? actionsReRunWorkflowRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/rerun'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      body: actionsReRunWorkflowRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Re-run failed jobs from a workflow run
  /// Re-run all of the failed jobs and their dependent jobs in a workflow run
  /// using the `id` of the workflow run.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<EmptyObject> reRunWorkflowFailedJobs(
    String owner,
    String repo,
    int runId, {
    ActionsReRunWorkflowFailedJobsRequest?
    actionsReRunWorkflowFailedJobsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
      body: actionsReRunWorkflowFailedJobsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get workflow run usage
  /// > [!WARNING]
  /// > This endpoint is in the process of closing down. Refer to "[Actions
  /// Get workflow usage and Get workflow run usage endpoints closing
  /// down](https://github.blog/changelog/2025-02-02-actions-get-workflow-usage-and-get-workflow-run-usage-endpoints-closing-down/)"
  /// for more information.
  ///
  /// Gets the number of billable minutes and total run time for a specific
  /// workflow run. Billable minutes only apply to workflows in private
  /// repositories that use GitHub-hosted runners. Usage is listed for each
  /// GitHub-hosted runner operating system in milliseconds. Any job re-runs
  /// are also included in the usage. The usage does not include the
  /// multiplier for macOS and Windows runners and is not rounded up to the
  /// nearest whole minute. For more information, see "[Managing billing for
  /// GitHub
  /// Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<WorkflowRunUsage> getWorkflowRunUsage(
    String owner,
    String repo,
    int runId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/runs/{run_id}/timing'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{run_id}', '$runId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WorkflowRunUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository secrets
  /// Lists all secrets available in a repository without revealing their
  /// encrypted
  /// values.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListRepoSecrets200Response> listRepoSecrets(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/secrets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository public key
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<ActionsPublicKey> getRepoPublicKey(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/secrets/public-key'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository secret
  /// Gets a single repository secret without revealing its encrypted value.
  ///
  /// The authenticated user must have collaborator access to the repository
  /// to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsSecret> getRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update a repository secret
  /// Creates or updates a repository secret with an encrypted value. Encrypt
  /// your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsCreateOrUpdateRepoSecretResponse> createOrUpdateRepoSecret(
    String owner,
    String repo,
    String secretName,
    ActionsCreateOrUpdateRepoSecretRequest
    actionsCreateOrUpdateRepoSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: actionsCreateOrUpdateRepoSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ActionsCreateOrUpdateRepoSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const ActionsCreateOrUpdateRepoSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete a repository secret
  /// Deletes a secret in a repository using the secret name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository variables
  /// Lists all repository variables.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListRepoVariables200Response> listRepoVariables(
    String owner,
    String repo, {
    int? perPage = 10,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/variables'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoVariables200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository variable
  /// Creates a repository variable that you can reference in a GitHub Actions
  /// workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<EmptyObject> createRepoVariable(
    String owner,
    String repo,
    ActionsCreateRepoVariableRequest actionsCreateRepoVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/variables'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: actionsCreateRepoVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository variable
  /// Gets a specific variable in a repository.
  ///
  /// The authenticated user must have collaborator access to the repository
  /// to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsVariable> getRepoVariable(
    String owner,
    String repo,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/variables/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsVariable.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository variable
  /// Deletes a repository variable using the variable name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteRepoVariable(
    String owner,
    String repo,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/actions/variables/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a repository variable
  /// Updates a repository variable that you can reference in a GitHub Actions
  /// workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> updateRepoVariable(
    String owner,
    String repo,
    String name,
    ActionsUpdateRepoVariableRequest actionsUpdateRepoVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/actions/variables/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      body: actionsUpdateRepoVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository workflows
  /// Lists the workflows in a repository.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ActionsListRepoWorkflows200Response> listRepoWorkflows(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/workflows'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListRepoWorkflows200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a workflow
  /// Gets a specific workflow. You can replace `workflow_id` with the
  /// workflow
  /// file name. For example, you could use `main.yaml`.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<Workflow> getWorkflow(
    String owner,
    String repo,
    WorkflowIdParam workflowId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Workflow.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Disable a workflow
  /// Disables a workflow and sets the `state` of the workflow to
  /// `disabled_manually`. You can replace `workflow_id` with the workflow
  /// file name. For example, you could use `main.yaml`.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> disableWorkflow(
    String owner,
    String repo,
    WorkflowIdParam workflowId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Create a workflow dispatch event
  /// You can use this endpoint to manually trigger a GitHub Actions workflow
  /// run. You can replace `workflow_id` with the workflow file name. For
  /// example, you could use `main.yaml`.
  ///
  /// You must configure your GitHub Actions workflow to run when the
  /// [`workflow_dispatch`
  /// webhook](/developers/webhooks-and-events/webhook-events-and-payloads#workflow_dispatch)
  /// event occurs. The `inputs` are configured in the workflow file. For more
  /// information about how to configure the `workflow_dispatch` event in the
  /// workflow file, see "[Events that trigger
  /// workflows](/actions/reference/events-that-trigger-workflows#workflow_dispatch)."
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> createWorkflowDispatch(
    String owner,
    String repo,
    WorkflowIdParam workflowId,
    ActionsCreateWorkflowDispatchRequest actionsCreateWorkflowDispatchRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
      body: actionsCreateWorkflowDispatchRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Enable a workflow
  /// Enables a workflow and sets the `state` of the workflow to `active`. You
  /// can replace `workflow_id` with the workflow file name. For example, you
  /// could use `main.yaml`.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> enableWorkflow(
    String owner,
    String repo,
    WorkflowIdParam workflowId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List workflow runs for a workflow
  /// List all workflow runs for a workflow. You can replace `workflow_id`
  /// with the workflow file name. For example, you could use `main.yaml`. You
  /// can use parameters to narrow the list of results. For more information
  /// about using parameters, see
  /// [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).
  ///
  /// Anyone with read access to the repository can use this endpoint
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  ///
  /// This endpoint will return up to 1,000 results for each search when using
  /// the following parameters: `actor`, `branch`, `check_suite_id`,
  /// `created`, `event`, `head_sha`, `status`.
  Future<ActionsListWorkflowRuns200Response> listWorkflowRuns(
    String owner,
    String repo,
    WorkflowIdParam workflowId, {
    String? actor,
    String? branch,
    String? event,
    WorkflowRunStatusParam? status,
    int? perPage = 30,
    int? page = 1,
    DateTime? created,
    bool? excludePullRequests = false,
    int? checkSuiteId,
    String? headSha,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
      queryParameters: {
        if (actor != null) 'actor': [actor],
        if (branch != null) 'branch': [branch],
        if (event != null) 'event': [event],
        if (status != null) 'status': [status.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (created != null) 'created': [created.toIso8601String()],
        if (excludePullRequests != null)
          'exclude_pull_requests': [excludePullRequests.toString()],
        if (checkSuiteId != null) 'check_suite_id': [checkSuiteId.toString()],
        if (headSha != null) 'head_sha': [headSha],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListWorkflowRuns200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get workflow usage
  /// > [!WARNING]
  /// > This endpoint is in the process of closing down. Refer to "[Actions
  /// Get workflow usage and Get workflow run usage endpoints closing
  /// down](https://github.blog/changelog/2025-02-02-actions-get-workflow-usage-and-get-workflow-run-usage-endpoints-closing-down/)"
  /// for more information.
  ///
  /// Gets the number of billable minutes used by a specific workflow during
  /// the current billing cycle. Billable minutes only apply to workflows in
  /// private repositories that use GitHub-hosted runners. Usage is listed for
  /// each GitHub-hosted runner operating system in milliseconds. Any job
  /// re-runs are also included in the usage. The usage does not include the
  /// multiplier for macOS and Windows runners and is not rounded up to the
  /// nearest whole minute. For more information, see "[Managing billing for
  /// GitHub
  /// Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
  ///
  /// You can replace `workflow_id` with the workflow file name. For example,
  /// you could use `main.yaml`.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<WorkflowUsage> getWorkflowUsage(
    String owner,
    String repo,
    WorkflowIdParam workflowId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{workflow_id}',
            Uri.encodeComponent('${workflowId.toJson()}'),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WorkflowUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List environment secrets
  /// Lists all secrets available in an environment without revealing their
  /// encrypted values.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListEnvironmentSecrets200Response> listEnvironmentSecrets(
    String owner,
    String repo,
    String environmentName, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/environments/{environment_name}/secrets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{environment_name}',
            Uri.encodeComponent(environmentName),
          ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListEnvironmentSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an environment public key
  /// Get the public key for an environment, which you need to encrypt
  /// environment
  /// secrets. You need to encrypt a secret before you can create or update
  /// secrets.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// If the repository is private, OAuth tokens and personal access tokens
  /// (classic) need the `repo` scope to use this endpoint.
  Future<ActionsPublicKey> getEnvironmentPublicKey(
    String owner,
    String repo,
    String environmentName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an environment secret
  /// Gets a single environment secret without revealing its encrypted value.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsSecret> getEnvironmentSecret(
    String owner,
    String repo,
    String environmentName,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update an environment secret
  /// Creates or updates an environment secret with an encrypted value.
  /// Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsCreateOrUpdateEnvironmentSecretResponse>
  createOrUpdateEnvironmentSecret(
    String owner,
    String repo,
    String environmentName,
    String secretName,
    ActionsCreateOrUpdateEnvironmentSecretRequest
    actionsCreateOrUpdateEnvironmentSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: actionsCreateOrUpdateEnvironmentSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ActionsCreateOrUpdateEnvironmentSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const ActionsCreateOrUpdateEnvironmentSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete an environment secret
  /// Deletes a secret in an environment using the secret name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteEnvironmentSecret(
    String owner,
    String repo,
    String environmentName,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List environment variables
  /// Lists all environment variables.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ActionsListEnvironmentVariables200Response> listEnvironmentVariables(
    String owner,
    String repo,
    String environmentName, {
    int? perPage = 10,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/environments/{environment_name}/variables'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{environment_name}',
            Uri.encodeComponent(environmentName),
          ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsListEnvironmentVariables200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an environment variable
  /// Create an environment variable that you can reference in a GitHub
  /// Actions workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<EmptyObject> createEnvironmentVariable(
    String owner,
    String repo,
    String environmentName,
    ActionsCreateEnvironmentVariableRequest
    actionsCreateEnvironmentVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/environments/{environment_name}/variables'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{environment_name}',
            Uri.encodeComponent(environmentName),
          ),
      body: actionsCreateEnvironmentVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an environment variable
  /// Gets a specific variable in an environment.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<ActionsVariable> getEnvironmentVariable(
    String owner,
    String repo,
    String environmentName,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsVariable.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an environment variable
  /// Deletes an environment variable using the variable name.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `repo` scope
  /// to use this endpoint.
  Future<void> deleteEnvironmentVariable(
    String owner,
    String repo,
    String name,
    String environmentName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{name}', Uri.encodeComponent(name))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an environment variable
  /// Updates an environment variable that you can reference in a GitHub
  /// Actions workflow.
  ///
  /// Authenticated users must have collaborator access to a repository to
  /// create, update, or read variables.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> updateEnvironmentVariable(
    String owner,
    String repo,
    String name,
    String environmentName,
    ActionsUpdateEnvironmentVariableRequest
    actionsUpdateEnvironmentVariableRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{name}', Uri.encodeComponent(name))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              ),
      body: actionsUpdateEnvironmentVariableRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
