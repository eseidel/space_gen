// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/repos_add_app_access_restrictions_request.dart';
import 'package:github/messages/repos_add_collaborator_request.dart';
import 'package:github/messages/repos_add_status_check_contexts_request.dart';
import 'package:github/messages/repos_add_team_access_restrictions_request.dart';
import 'package:github/messages/repos_add_user_access_restrictions_request.dart';
import 'package:github/messages/repos_check_private_vulnerability_reporting200_response.dart';
import 'package:github/messages/repos_create_attestation201_response.dart';
import 'package:github/messages/repos_create_attestation_request.dart';
import 'package:github/messages/repos_create_autolink_request.dart';
import 'package:github/messages/repos_create_commit_comment_request.dart';
import 'package:github/messages/repos_create_commit_status_request.dart';
import 'package:github/messages/repos_create_deploy_key_request.dart';
import 'package:github/messages/repos_create_deployment202_response.dart';
import 'package:github/messages/repos_create_deployment_protection_rule_request.dart';
import 'package:github/messages/repos_create_deployment_request.dart';
import 'package:github/messages/repos_create_deployment_status_request.dart';
import 'package:github/messages/repos_create_dispatch_event_request.dart';
import 'package:github/messages/repos_create_for_authenticated_user_request.dart';
import 'package:github/messages/repos_create_fork_request.dart';
import 'package:github/messages/repos_create_in_org_request.dart';
import 'package:github/messages/repos_create_or_update_custom_properties_values_request.dart';
import 'package:github/messages/repos_create_or_update_environment_request.dart';
import 'package:github/messages/repos_create_or_update_file_contents_request.dart';
import 'package:github/messages/repos_create_org_ruleset_request.dart';
import 'package:github/messages/repos_create_pages_deployment_request.dart';
import 'package:github/messages/repos_create_pages_site_request.dart';
import 'package:github/messages/repos_create_release_request.dart';
import 'package:github/messages/repos_create_repo_ruleset_request.dart';
import 'package:github/messages/repos_create_tag_protection_request.dart';
import 'package:github/messages/repos_create_using_template_request.dart';
import 'package:github/messages/repos_create_webhook_request.dart';
import 'package:github/messages/repos_delete_file_request.dart';
import 'package:github/messages/repos_generate_release_notes_request.dart';
import 'package:github/messages/repos_get_all_deployment_protection_rules200_response.dart';
import 'package:github/messages/repos_get_all_environments200_response.dart';
import 'package:github/messages/repos_get_content200_response.dart';
import 'package:github/messages/repos_list_attestations200_response.dart';
import 'package:github/messages/repos_list_custom_deployment_rule_integrations200_response.dart';
import 'package:github/messages/repos_list_deployment_branch_policies200_response.dart';
import 'package:github/messages/repos_merge_request.dart';
import 'package:github/messages/repos_merge_upstream_request.dart';
import 'package:github/messages/repos_remove_app_access_restrictions_request.dart';
import 'package:github/messages/repos_remove_status_check_contexts_request.dart';
import 'package:github/messages/repos_remove_team_access_restrictions_request.dart';
import 'package:github/messages/repos_remove_user_access_restrictions_request.dart';
import 'package:github/messages/repos_rename_branch_request.dart';
import 'package:github/messages/repos_replace_all_topics_request.dart';
import 'package:github/messages/repos_set_app_access_restrictions_request.dart';
import 'package:github/messages/repos_set_status_check_contexts_request.dart';
import 'package:github/messages/repos_set_team_access_restrictions_request.dart';
import 'package:github/messages/repos_set_user_access_restrictions_request.dart';
import 'package:github/messages/repos_transfer_request.dart';
import 'package:github/messages/repos_update_branch_protection_request.dart';
import 'package:github/messages/repos_update_commit_comment_request.dart';
import 'package:github/messages/repos_update_information_about_pages_site_request.dart';
import 'package:github/messages/repos_update_invitation_request.dart';
import 'package:github/messages/repos_update_org_ruleset_request.dart';
import 'package:github/messages/repos_update_pull_request_review_protection_request.dart';
import 'package:github/messages/repos_update_release_asset_request.dart';
import 'package:github/messages/repos_update_release_request.dart';
import 'package:github/messages/repos_update_repo_ruleset_request.dart';
import 'package:github/messages/repos_update_request.dart';
import 'package:github/messages/repos_update_status_check_protection_request.dart';
import 'package:github/messages/repos_update_webhook_config_for_repo_request.dart';
import 'package:github/messages/repos_update_webhook_request.dart';
import 'package:github/models/activity.dart';
import 'package:github/models/autolink.dart';
import 'package:github/models/branch_protection.dart';
import 'package:github/models/branch_restriction_policy.dart';
import 'package:github/models/branch_short.dart';
import 'package:github/models/branch_with_protection.dart';
import 'package:github/models/check_automated_security_fixes.dart';
import 'package:github/models/clone_traffic.dart';
import 'package:github/models/codeowners_errors.dart';
import 'package:github/models/collaborator.dart';
import 'package:github/models/combined_commit_status.dart';
import 'package:github/models/commit.dart';
import 'package:github/models/commit_activity.dart';
import 'package:github/models/commit_comment.dart';
import 'package:github/models/commit_comparison.dart';
import 'package:github/models/community_profile.dart';
import 'package:github/models/content_file.dart';
import 'package:github/models/content_traffic.dart';
import 'package:github/models/contributor.dart';
import 'package:github/models/contributor_activity.dart';
import 'package:github/models/custom_property_value.dart';
import 'package:github/models/deploy_key.dart';
import 'package:github/models/deployment.dart';
import 'package:github/models/deployment_branch_policy.dart';
import 'package:github/models/deployment_branch_policy_name_pattern.dart';
import 'package:github/models/deployment_branch_policy_name_pattern_with_type.dart';
import 'package:github/models/deployment_protection_rule.dart';
import 'package:github/models/deployment_status.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/environment.dart';
import 'package:github/models/file_commit.dart';
import 'package:github/models/full_repository.dart';
import 'package:github/models/hook.dart';
import 'package:github/models/hook_delivery.dart';
import 'package:github/models/hook_delivery_item.dart';
import 'package:github/models/integration.dart';
import 'package:github/models/merged_upstream.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/page.dart';
import 'package:github/models/page_build.dart';
import 'package:github/models/page_build_status.dart';
import 'package:github/models/page_deployment.dart';
import 'package:github/models/pages_deployment_id_param.dart';
import 'package:github/models/pages_deployment_status.dart';
import 'package:github/models/pages_health_check.dart';
import 'package:github/models/participation_stats.dart';
import 'package:github/models/per_param.dart';
import 'package:github/models/protected_branch.dart';
import 'package:github/models/protected_branch_admin_enforced.dart';
import 'package:github/models/protected_branch_pull_request_review.dart';
import 'package:github/models/pull_request_simple.dart';
import 'package:github/models/referrer_traffic.dart';
import 'package:github/models/release.dart';
import 'package:github/models/release_asset.dart';
import 'package:github/models/release_notes_content.dart';
import 'package:github/models/repos_list_activities_parameter8.dart';
import 'package:github/models/repos_list_activities_parameter9.dart';
import 'package:github/models/repos_list_collaborators_parameter2.dart';
import 'package:github/models/repos_list_collaborators_parameter3.dart';
import 'package:github/models/repos_list_for_authenticated_user_parameter0.dart';
import 'package:github/models/repos_list_for_authenticated_user_parameter2.dart';
import 'package:github/models/repos_list_for_authenticated_user_parameter3.dart';
import 'package:github/models/repos_list_for_authenticated_user_parameter4.dart';
import 'package:github/models/repos_list_for_org_parameter1.dart';
import 'package:github/models/repos_list_for_org_parameter2.dart';
import 'package:github/models/repos_list_for_org_parameter3.dart';
import 'package:github/models/repos_list_for_user_parameter1.dart';
import 'package:github/models/repos_list_for_user_parameter2.dart';
import 'package:github/models/repos_list_for_user_parameter3.dart';
import 'package:github/models/repos_list_forks_parameter2.dart';
import 'package:github/models/repository.dart';
import 'package:github/models/repository_collaborator_permission.dart';
import 'package:github/models/repository_invitation.dart';
import 'package:github/models/repository_rule_detailed.dart';
import 'package:github/models/repository_ruleset.dart';
import 'package:github/models/rule_suite.dart';
import 'package:github/models/rule_suite_result_param.dart';
import 'package:github/models/rule_suites_inner.dart';
import 'package:github/models/ruleset_version.dart';
import 'package:github/models/ruleset_version_with_state.dart';
import 'package:github/models/short_branch.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/status.dart';
import 'package:github/models/status_check_policy.dart';
import 'package:github/models/tag.dart';
import 'package:github/models/tag_protection.dart';
import 'package:github/models/team.dart';
import 'package:github/models/time_period_param.dart';
import 'package:github/models/topic.dart';
import 'package:github/models/view_traffic.dart';
import 'package:github/models/webhook_config.dart';
import 'package:meta/meta.dart';

sealed class ReposAddCollaboratorResponse {
  const ReposAddCollaboratorResponse();
}

@immutable
final class ReposAddCollaboratorResponse201
    extends ReposAddCollaboratorResponse {
  const ReposAddCollaboratorResponse201(this.value);

  final RepositoryInvitation value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposAddCollaboratorResponse201 && value == other.value;
  }
}

@immutable
final class ReposAddCollaboratorResponse204
    extends ReposAddCollaboratorResponse {
  const ReposAddCollaboratorResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is ReposAddCollaboratorResponse204;
}

sealed class ReposListContributorsResponse {
  const ReposListContributorsResponse();
}

@immutable
final class ReposListContributorsResponse200
    extends ReposListContributorsResponse {
  const ReposListContributorsResponse200(this.value);

  final List<Contributor> value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposListContributorsResponse200 && value == other.value;
  }
}

@immutable
final class ReposListContributorsResponse204
    extends ReposListContributorsResponse {
  const ReposListContributorsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is ReposListContributorsResponse204;
}

sealed class ReposCreateDeploymentResponse {
  const ReposCreateDeploymentResponse();
}

@immutable
final class ReposCreateDeploymentResponse201
    extends ReposCreateDeploymentResponse {
  const ReposCreateDeploymentResponse201(this.value);

  final Deployment value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentResponse201 && value == other.value;
  }
}

@immutable
final class ReposCreateDeploymentResponse202
    extends ReposCreateDeploymentResponse {
  const ReposCreateDeploymentResponse202(this.value);

  final ReposCreateDeployment202Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateDeploymentResponse202 && value == other.value;
  }
}

sealed class ReposMergeResponse {
  const ReposMergeResponse();
}

@immutable
final class ReposMergeResponse201 extends ReposMergeResponse {
  const ReposMergeResponse201(this.value);

  final Commit value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposMergeResponse201 && value == other.value;
  }
}

@immutable
final class ReposMergeResponse204 extends ReposMergeResponse {
  const ReposMergeResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is ReposMergeResponse204;
}

sealed class ReposGetPagesHealthCheckResponse {
  const ReposGetPagesHealthCheckResponse();
}

@immutable
final class ReposGetPagesHealthCheckResponse200
    extends ReposGetPagesHealthCheckResponse {
  const ReposGetPagesHealthCheckResponse200(this.value);

  final PagesHealthCheck value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetPagesHealthCheckResponse200 && value == other.value;
  }
}

@immutable
final class ReposGetPagesHealthCheckResponse202
    extends ReposGetPagesHealthCheckResponse {
  const ReposGetPagesHealthCheckResponse202(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetPagesHealthCheckResponse202 && value == other.value;
  }
}

sealed class ReposGetCodeFrequencyStatsResponse {
  const ReposGetCodeFrequencyStatsResponse();
}

@immutable
final class ReposGetCodeFrequencyStatsResponse200
    extends ReposGetCodeFrequencyStatsResponse {
  const ReposGetCodeFrequencyStatsResponse200(this.value);

  final List<List<int>> value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetCodeFrequencyStatsResponse200 &&
        value == other.value;
  }
}

@immutable
final class ReposGetCodeFrequencyStatsResponse202
    extends ReposGetCodeFrequencyStatsResponse {
  const ReposGetCodeFrequencyStatsResponse202(this.value);

  final dynamic value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetCodeFrequencyStatsResponse202 &&
        value == other.value;
  }
}

@immutable
final class ReposGetCodeFrequencyStatsResponse204
    extends ReposGetCodeFrequencyStatsResponse {
  const ReposGetCodeFrequencyStatsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ReposGetCodeFrequencyStatsResponse204;
}

sealed class ReposGetCommitActivityStatsResponse {
  const ReposGetCommitActivityStatsResponse();
}

@immutable
final class ReposGetCommitActivityStatsResponse200
    extends ReposGetCommitActivityStatsResponse {
  const ReposGetCommitActivityStatsResponse200(this.value);

  final List<CommitActivity> value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetCommitActivityStatsResponse200 &&
        value == other.value;
  }
}

@immutable
final class ReposGetCommitActivityStatsResponse202
    extends ReposGetCommitActivityStatsResponse {
  const ReposGetCommitActivityStatsResponse202(this.value);

  final dynamic value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetCommitActivityStatsResponse202 &&
        value == other.value;
  }
}

@immutable
final class ReposGetCommitActivityStatsResponse204
    extends ReposGetCommitActivityStatsResponse {
  const ReposGetCommitActivityStatsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ReposGetCommitActivityStatsResponse204;
}

sealed class ReposGetContributorsStatsResponse {
  const ReposGetContributorsStatsResponse();
}

@immutable
final class ReposGetContributorsStatsResponse200
    extends ReposGetContributorsStatsResponse {
  const ReposGetContributorsStatsResponse200(this.value);

  final List<ContributorActivity> value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetContributorsStatsResponse200 &&
        value == other.value;
  }
}

@immutable
final class ReposGetContributorsStatsResponse202
    extends ReposGetContributorsStatsResponse {
  const ReposGetContributorsStatsResponse202(this.value);

  final dynamic value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetContributorsStatsResponse202 &&
        value == other.value;
  }
}

@immutable
final class ReposGetContributorsStatsResponse204
    extends ReposGetContributorsStatsResponse {
  const ReposGetContributorsStatsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is ReposGetContributorsStatsResponse204;
}

sealed class ReposGetPunchCardStatsResponse {
  const ReposGetPunchCardStatsResponse();
}

@immutable
final class ReposGetPunchCardStatsResponse200
    extends ReposGetPunchCardStatsResponse {
  const ReposGetPunchCardStatsResponse200(this.value);

  final List<List<int>> value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposGetPunchCardStatsResponse200 && value == other.value;
  }
}

@immutable
final class ReposGetPunchCardStatsResponse204
    extends ReposGetPunchCardStatsResponse {
  const ReposGetPunchCardStatsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is ReposGetPunchCardStatsResponse204;
}

/// Interact with GitHub Repos.
class ReposApi {
  ReposApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List organization repositories
  /// Lists repositories for the specified organization.
  ///
  /// > [!NOTE]
  /// > In order to see the `security_and_analysis` block for a repository you
  /// must have admin permissions for the repository or be an owner or
  /// security manager for the organization that owns the repository. For more
  /// information, see "[Managing security managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  Future<List<MinimalRepository>> listForOrg(
    String org, {
    ReposListForOrgParameter1? type = ReposListForOrgParameter1.all,
    ReposListForOrgParameter2? sort = ReposListForOrgParameter2.created,
    ReposListForOrgParameter3? direction,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/repos'.replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (type != null) 'type': [type.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization repository
  /// Creates a new repository in the specified organization. The
  /// authenticated user must be a member of the organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `public_repo` or `repo` scope to create a public repository, and `repo`
  /// scope to create a private repository.
  Future<FullRepository> createInOrg(
    String org,
    ReposCreateInOrgRequest reposCreateInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/repos'.replaceAll('{org}', Uri.encodeComponent(org)),
      body: reposCreateInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all organization repository rulesets
  /// Get all the repository rulesets for an organization.
  Future<List<RepositoryRuleset>> getOrgRulesets(
    String org, {
    int? perPage = 30,
    int? page = 1,
    String? targets,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (targets != null) 'targets': [targets],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryRuleset>(
            (e) => RepositoryRuleset.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization repository ruleset
  /// Create a repository ruleset for an organization.
  Future<RepositoryRuleset> createOrgRuleset(
    String org,
    ReposCreateOrgRulesetRequest reposCreateOrgRulesetRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/rulesets'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: reposCreateOrgRulesetRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization rule suites
  /// Lists suites of rule evaluations at the organization level.
  /// For more information, see "[Managing rulesets for repositories in your
  /// organization](https://docs.github.com/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization#viewing-insights-for-rulesets)."
  Future<List<RuleSuitesInner>> getOrgRuleSuites(
    String org, {
    String? ref,
    String? repositoryName,
    TimePeriodParam? timePeriod = TimePeriodParam.day,
    String? actorName,
    RuleSuiteResultParam? ruleSuiteResult = RuleSuiteResultParam.all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets/rule-suites'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (ref != null) 'ref': [ref],
        if (repositoryName != null) 'repository_name': [repositoryName],
        if (timePeriod != null) 'time_period': [timePeriod.toJson()],
        if (actorName != null) 'actor_name': [actorName],
        if (ruleSuiteResult != null)
          'rule_suite_result': [ruleSuiteResult.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RuleSuitesInner>(
            (e) => RuleSuitesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization rule suite
  /// Gets information about a suite of rule evaluations from within an
  /// organization.
  /// For more information, see "[Managing rulesets for repositories in your
  /// organization](https://docs.github.com/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization#viewing-insights-for-rulesets)."
  Future<RuleSuite> getOrgRuleSuite(String org, int ruleSuiteId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets/rule-suites/{rule_suite_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{rule_suite_id}', '$ruleSuiteId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RuleSuite.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization repository ruleset
  /// Get a repository ruleset for an organization.
  ///
  /// **Note:** To prevent leaking sensitive information, the `bypass_actors`
  /// property is only returned if the user
  /// making the API request has write access to the ruleset.
  Future<RepositoryRuleset> getOrgRuleset(String org, int rulesetId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets/{ruleset_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{ruleset_id}', '$rulesetId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update an organization repository ruleset
  /// Update a ruleset for an organization.
  Future<RepositoryRuleset> updateOrgRuleset(
    String org,
    int rulesetId, {
    ReposUpdateOrgRulesetRequest? reposUpdateOrgRulesetRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/rulesets/{ruleset_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{ruleset_id}', '$rulesetId'),
      body: reposUpdateOrgRulesetRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an organization repository ruleset
  /// Delete a ruleset for an organization.
  Future<void> deleteOrgRuleset(String org, int rulesetId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/rulesets/{ruleset_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{ruleset_id}', '$rulesetId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a repository
  /// The `parent` and `source` objects are present when the repository is a
  /// fork. `parent` is the repository this repository was forked from,
  /// `source` is the ultimate source for the network.
  ///
  /// > [!NOTE]
  /// > In order to see the `security_and_analysis` block for a repository you
  /// must have admin permissions for the repository or be an owner or
  /// security manager for the organization that owns the repository. For more
  /// information, see "[Managing security managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  Future<FullRepository> get(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository
  /// Deleting a repository requires admin access.
  ///
  /// If an organization owner has configured the organization to prevent
  /// members from deleting organization-owned
  /// repositories, you will get a `403 Forbidden` response.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `delete_repo` scope to use this endpoint.
  Future<void> delete(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a repository
  /// **Note**: To edit a repository's topics, use the [Replace all repository
  /// topics](https://docs.github.com/rest/repos/repos#replace-all-repository-topics)
  /// endpoint.
  Future<FullRepository> update(
    String owner,
    String repo, {
    ReposUpdateRequest? reposUpdateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposUpdateRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository activities
  /// Lists a detailed history of changes to a repository, such as pushes,
  /// merges, force pushes, and branch changes, and associates these changes
  /// with commits and users.
  ///
  /// For more information about viewing repository activity,
  /// see "[Viewing activity and data for your
  /// repository](https://docs.github.com/repositories/viewing-activity-and-data-for-your-repository)."
  Future<List<Activity>> listActivities(
    String owner,
    String repo, {
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    String? before,
    String? after,
    String? ref,
    String? actor,
    ReposListActivitiesParameter8? timePeriod,
    ReposListActivitiesParameter9? activityType,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/activity'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (ref != null) 'ref': [ref],
        if (actor != null) 'actor': [actor],
        if (timePeriod != null) 'time_period': [timePeriod.toJson()],
        if (activityType != null) 'activity_type': [activityType.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Activity>((e) => Activity.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an attestation
  /// Store an artifact attestation and associate it with a repository.
  ///
  /// The authenticated user must have write permission to the repository and,
  /// if using a fine-grained access token, the `attestations:write`
  /// permission is required.
  ///
  /// Artifact attestations are meant to be created using the [attest
  /// action](https://github.com/actions/attest). For more information, see
  /// our guide on [using artifact attestations to establish a build's
  /// provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds).
  Future<ReposCreateAttestation201Response> createAttestation(
    String owner,
    String repo,
    ReposCreateAttestationRequest reposCreateAttestationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/attestations'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateAttestationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposCreateAttestation201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List attestations
  /// List a collection of artifact attestations with a given subject digest
  /// that are associated with a repository.
  ///
  /// The authenticated user making the request must have read access to the
  /// repository. In addition, when using a fine-grained access token the
  /// `attestations:read` permission is required.
  ///
  /// **Please note:** in order to offer meaningful security benefits, an
  /// attestation's signature and timestamps **must** be cryptographically
  /// verified, and the identity of the attestation signer **must** be
  /// validated. Attestations can be verified using the [GitHub CLI
  /// `attestation verify`
  /// command](https://cli.github.com/manual/gh_attestation_verify). For more
  /// information, see [our guide on how to use artifact attestations to
  /// establish a build's
  /// provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds).
  Future<ReposListAttestations200Response> listAttestations(
    String owner,
    String repo,
    String subjectDigest, {
    int? perPage = 30,
    String? before,
    String? after,
    String? predicateType,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/attestations/{subject_digest}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{subject_digest}', Uri.encodeComponent(subjectDigest)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (predicateType != null) 'predicate_type': [predicateType],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposListAttestations200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all autolinks of a repository
  /// Gets all autolinks that are configured for a repository.
  ///
  /// Information about autolinks are only available to repository
  /// administrators.
  Future<List<Autolink>> listAutolinks(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/autolinks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Autolink>((e) => Autolink.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an autolink reference for a repository
  /// Users with admin access to the repository can create an autolink.
  Future<Autolink> createAutolink(
    String owner,
    String repo,
    ReposCreateAutolinkRequest reposCreateAutolinkRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/autolinks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateAutolinkRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Autolink.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an autolink reference of a repository
  /// This returns a single autolink reference by ID that was configured for
  /// the given repository.
  ///
  /// Information about autolinks are only available to repository
  /// administrators.
  Future<Autolink> getAutolink(
    String owner,
    String repo,
    int autolinkId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/autolinks/{autolink_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{autolink_id}', '$autolinkId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Autolink.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an autolink reference from a repository
  /// This deletes a single autolink reference by ID that was configured for
  /// the given repository.
  ///
  /// Information about autolinks are only available to repository
  /// administrators.
  Future<void> deleteAutolink(String owner, String repo, int autolinkId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/autolinks/{autolink_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{autolink_id}', '$autolinkId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Check if Dependabot security updates are enabled for a repository
  /// Shows whether Dependabot security updates are enabled, disabled or
  /// paused for a repository. The authenticated user must have admin read
  /// access to the repository. For more information, see "[Configuring
  /// Dependabot security
  /// updates](https://docs.github.com/articles/configuring-automated-security-fixes)".
  Future<CheckAutomatedSecurityFixes> checkAutomatedSecurityFixes(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/automated-security-fixes'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckAutomatedSecurityFixes.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Enable Dependabot security updates
  /// Enables Dependabot security updates for a repository. The authenticated
  /// user must have admin access to the repository. For more information, see
  /// "[Configuring Dependabot security
  /// updates](https://docs.github.com/articles/configuring-automated-security-fixes)".
  Future<void> enableAutomatedSecurityFixes(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/automated-security-fixes'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Disable Dependabot security updates
  /// Disables Dependabot security updates for a repository. The authenticated
  /// user must have admin access to the repository. For more information, see
  /// "[Configuring Dependabot security
  /// updates](https://docs.github.com/articles/configuring-automated-security-fixes)".
  Future<void> disableAutomatedSecurityFixes(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/automated-security-fixes'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List branches
  ///
  Future<List<ShortBranch>> listBranches(
    String owner,
    String repo, {
    bool? protected,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/branches'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (protected != null) 'protected': [protected.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ShortBranch>(
            (e) => ShortBranch.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a branch
  ///
  Future<BranchWithProtection> getBranch(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/branches/{branch}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BranchWithProtection.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<BranchProtection> getBranchProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BranchProtection.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Protecting a branch requires admin or owner permissions to the
  /// repository.
  ///
  /// > [!NOTE]
  /// > Passing new arrays of `users` and `teams` replaces their previous
  /// values.
  ///
  /// > [!NOTE]
  /// > The list of users, apps, and teams in total is limited to 100 items.
  Future<ProtectedBranch> updateBranchProtection(
    String owner,
    String repo,
    String branch,
    ReposUpdateBranchProtectionRequest reposUpdateBranchProtectionRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposUpdateBranchProtectionRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranch.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<void> deleteBranchProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get admin branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<ProtectedBranchAdminEnforced> getAdminBranchProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchAdminEnforced.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set admin branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Adding admin enforcement requires admin or owner permissions to the
  /// repository and branch protection to be enabled.
  Future<ProtectedBranchAdminEnforced> setAdminBranchProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchAdminEnforced.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete admin branch protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Removing admin enforcement requires admin or owner permissions to the
  /// repository and branch protection to be enabled.
  Future<void> deleteAdminBranchProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get pull request review protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<ProtectedBranchPullRequestReview> getPullRequestReviewProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchPullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete pull request review protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<void> deletePullRequestReviewProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update pull request review protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Updating pull request review enforcement requires admin or owner
  /// permissions to the repository and branch protection to be enabled.
  ///
  /// > [!NOTE]
  /// > Passing new arrays of `users` and `teams` replaces their previous
  /// values.
  Future<ProtectedBranchPullRequestReview> updatePullRequestReviewProtection(
    String owner,
    String repo,
    String branch, {
    ReposUpdatePullRequestReviewProtectionRequest?
    reposUpdatePullRequestReviewProtectionRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposUpdatePullRequestReviewProtectionRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchPullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get commit signature protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// When authenticated with admin or owner permissions to the repository,
  /// you can use this endpoint to check whether a branch requires signed
  /// commits. An enabled status of `true` indicates you must sign commits on
  /// this branch. For more information, see [Signing commits with
  /// GPG](https://docs.github.com/articles/signing-commits-with-gpg) in
  /// GitHub Help.
  ///
  /// > [!NOTE]
  /// > You must enable branch protection to require signed commits.
  Future<ProtectedBranchAdminEnforced> getCommitSignatureProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchAdminEnforced.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create commit signature protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// When authenticated with admin or owner permissions to the repository,
  /// you can use this endpoint to require signed commits on a branch. You
  /// must enable branch protection to require signed commits.
  Future<ProtectedBranchAdminEnforced> createCommitSignatureProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProtectedBranchAdminEnforced.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete commit signature protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// When authenticated with admin or owner permissions to the repository,
  /// you can use this endpoint to disable required signed commits on a
  /// branch. You must enable branch protection to require signed commits.
  Future<void> deleteCommitSignatureProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get status checks protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<StatusCheckPolicy> getStatusChecksProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return StatusCheckPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove status check protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<void> removeStatusCheckProtection(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update status check protection
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Updating required status checks requires admin or owner permissions to
  /// the repository and branch protection to be enabled.
  Future<StatusCheckPolicy> updateStatusCheckProtection(
    String owner,
    String repo,
    String branch, {
    ReposUpdateStatusCheckProtectionRequest?
    reposUpdateStatusCheckProtectionRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposUpdateStatusCheckProtectionRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return StatusCheckPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all status check contexts
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<List<String>> getAllStatusCheckContexts(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List).cast<String>();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add status check contexts
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<List<String>> addStatusCheckContexts(
    String owner,
    String repo,
    String branch, {
    ReposAddStatusCheckContextsRequest? reposAddStatusCheckContextsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposAddStatusCheckContextsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List).cast<String>();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set status check contexts
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<List<String>> setStatusCheckContexts(
    String owner,
    String repo,
    String branch, {
    ReposSetStatusCheckContextsRequest? reposSetStatusCheckContextsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposSetStatusCheckContextsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List).cast<String>();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove status check contexts
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  Future<List<String>> removeStatusCheckContexts(
    String owner,
    String repo,
    String branch, {
    ReposRemoveStatusCheckContextsRequest?
    reposRemoveStatusCheckContextsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposRemoveStatusCheckContextsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List).cast<String>();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Lists who has access to this protected branch.
  ///
  /// > [!NOTE]
  /// > Users, apps, and teams `restrictions` are only available for
  /// organization-owned repositories.
  Future<BranchRestrictionPolicy> getAccessRestrictions(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BranchRestrictionPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Disables the ability to restrict who can push to this branch.
  Future<void> deleteAccessRestrictions(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get apps with access to the protected branch
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Lists the GitHub Apps that have push access to this branch. Only GitHub
  /// Apps that are installed on the repository and that have been granted
  /// write access to the repository contents can be added as authorized
  /// actors on a protected branch.
  Future<List<Integration>> getAppsWithAccessToProtectedBranch(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Integration>(
            (e) => Integration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add app access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Grants the specified apps push access for this branch. Only GitHub Apps
  /// that are installed on the repository and that have been granted write
  /// access to the repository contents can be added as authorized actors on a
  /// protected branch.
  Future<List<Integration>> addAppAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposAddAppAccessRestrictionsRequest reposAddAppAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposAddAppAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Integration>(
            (e) => Integration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set app access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Replaces the list of apps that have push access to this branch. This
  /// removes all apps that previously had push access and grants push access
  /// to the new list of apps. Only GitHub Apps that are installed on the
  /// repository and that have been granted write access to the repository
  /// contents can be added as authorized actors on a protected branch.
  Future<List<Integration>> setAppAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposSetAppAccessRestrictionsRequest reposSetAppAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposSetAppAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Integration>(
            (e) => Integration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove app access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Removes the ability of an app to push to this branch. Only GitHub Apps
  /// that are installed on the repository and that have been granted write
  /// access to the repository contents can be added as authorized actors on a
  /// protected branch.
  Future<List<Integration>> removeAppAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposRemoveAppAccessRestrictionsRequest
    reposRemoveAppAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposRemoveAppAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Integration>(
            (e) => Integration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get teams with access to the protected branch
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Lists the teams who have push access to this branch. The list includes
  /// child teams.
  Future<List<Team>> getTeamsWithAccessToProtectedBranch(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add team access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Grants the specified teams push access for this branch. You can also
  /// give push access to child teams.
  Future<List<Team>> addTeamAccessRestrictions(
    String owner,
    String repo,
    String branch, {
    ReposAddTeamAccessRestrictionsRequest?
    reposAddTeamAccessRestrictionsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposAddTeamAccessRestrictionsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set team access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Replaces the list of teams that have push access to this branch. This
  /// removes all teams that previously had push access and grants push access
  /// to the new list of teams. Team restrictions include child teams.
  Future<List<Team>> setTeamAccessRestrictions(
    String owner,
    String repo,
    String branch, {
    ReposSetTeamAccessRestrictionsRequest?
    reposSetTeamAccessRestrictionsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposSetTeamAccessRestrictionsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove team access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Removes the ability of a team to push to this branch. You can also
  /// remove push access for child teams.
  Future<List<Team>> removeTeamAccessRestrictions(
    String owner,
    String repo,
    String branch, {
    ReposRemoveTeamAccessRestrictionsRequest?
    reposRemoveTeamAccessRestrictionsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposRemoveTeamAccessRestrictionsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get users with access to the protected branch
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Lists the people who have push access to this branch.
  Future<List<SimpleUser>> getUsersWithAccessToProtectedBranch(
    String owner,
    String repo,
    String branch,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add user access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Grants the specified people push access for this branch.
  ///
  /// | Type    | Description
  /// |
  /// | ------- |
  /// -----------------------------------------------------------------------------------------------------------------------------
  /// |
  /// | `array` | Usernames for people who can have push access. **Note**: The
  /// list of users, apps, and teams in total is limited to 100 items. |
  Future<List<SimpleUser>> addUserAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposAddUserAccessRestrictionsRequest reposAddUserAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposAddUserAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set user access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Replaces the list of people that have push access to this branch. This
  /// removes all people that previously had push access and grants push
  /// access to the new list of people.
  ///
  /// | Type    | Description
  /// |
  /// | ------- |
  /// -----------------------------------------------------------------------------------------------------------------------------
  /// |
  /// | `array` | Usernames for people who can have push access. **Note**: The
  /// list of users, apps, and teams in total is limited to 100 items. |
  Future<List<SimpleUser>> setUserAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposSetUserAccessRestrictionsRequest reposSetUserAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposSetUserAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove user access restrictions
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Removes the ability of a user to push to this branch.
  ///
  /// | Type    | Description
  /// |
  /// | ------- |
  /// ---------------------------------------------------------------------------------------------------------------------------------------------
  /// |
  /// | `array` | Usernames of the people who should no longer have push
  /// access. **Note**: The list of users, apps, and teams in total is limited
  /// to 100 items. |
  Future<List<SimpleUser>> removeUserAccessRestrictions(
    String owner,
    String repo,
    String branch,
    ReposRemoveUserAccessRestrictionsRequest
    reposRemoveUserAccessRestrictionsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposRemoveUserAccessRestrictionsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Rename a branch
  /// Renames a branch in a repository.
  ///
  /// > [!NOTE]
  /// > Although the API responds immediately, the branch rename process might
  /// take some extra time to complete in the background. You won't be able to
  /// push to the old branch name while the rename process is in progress. For
  /// more information, see "[Renaming a
  /// branch](https://docs.github.com/github/administering-a-repository/renaming-a-branch)".
  ///
  /// The authenticated user must have push access to the branch. If the
  /// branch is the default branch, the authenticated user must also have
  /// admin or owner permissions.
  ///
  /// In order to rename the default branch, fine-grained access tokens also
  /// need the `administration:write` repository permission.
  Future<BranchWithProtection> renameBranch(
    String owner,
    String repo,
    String branch,
    ReposRenameBranchRequest reposRenameBranchRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/branches/{branch}/rename'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
      body: reposRenameBranchRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BranchWithProtection.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List CODEOWNERS errors
  /// List any syntax errors that are detected in the CODEOWNERS
  /// file.
  ///
  /// For more information about the correct CODEOWNERS syntax,
  /// see "[About code
  /// owners](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)."
  Future<CodeownersErrors> codeownersErrors(
    String owner,
    String repo, {
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codeowners/errors'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeownersErrors.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository collaborators
  /// For organization-owned repositories, the list of collaborators includes
  /// outside collaborators, organization members that are direct
  /// collaborators, organization members with access through team
  /// memberships, organization members with access through default
  /// organization permissions, and organization owners.
  /// The `permissions` hash returned in the response contains the base role
  /// permissions of the collaborator. The `role_name` is the highest role
  /// assigned to the collaborator after considering all sources of grants,
  /// including: repo, teams, organization, and enterprise.
  /// There is presently not a way to differentiate between an organization
  /// level grant and a repository level grant from this endpoint response.
  ///
  /// Team members will include the members of child teams.
  ///
  /// The authenticated user must have write, maintain, or admin privileges on
  /// the repository to use this endpoint. For organization-owned
  /// repositories, the authenticated user needs to be a member of the
  /// organization.
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:org` and `repo` scopes to use this endpoint.
  Future<List<Collaborator>> listCollaborators(
    String owner,
    String repo, {
    ReposListCollaboratorsParameter2? affiliation =
        ReposListCollaboratorsParameter2.all,
    ReposListCollaboratorsParameter3? permission,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/collaborators'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (affiliation != null) 'affiliation': [affiliation.toJson()],
        if (permission != null) 'permission': [permission.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Collaborator>(
            (e) => Collaborator.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a user is a repository collaborator
  /// For organization-owned repositories, the list of collaborators includes
  /// outside collaborators, organization members that are direct
  /// collaborators, organization members with access through team
  /// memberships, organization members with access through default
  /// organization permissions, and organization owners.
  ///
  /// Team members will include the members of child teams.
  ///
  /// The authenticated user must have push access to the repository to use
  /// this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:org` and `repo` scopes to use this endpoint.
  Future<void> checkCollaborator(
    String owner,
    String repo,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/collaborators/{username}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add a repository collaborator
  /// Add a user to a repository with a specified level of access. If the
  /// repository is owned by an organization, this API does not add the user
  /// to the organization - a user that has repository access without being an
  /// organization member is called an "outside collaborator" (if they are not
  /// an Enterprise Managed User) or a "repository collaborator" if they are
  /// an Enterprise Managed User. These users are exempt from some
  /// organization policies - see "[Adding outside collaborators to
  /// repositories](https://docs.github.com/organizations/managing-user-access-to-your-organizations-repositories/managing-outside-collaborators/adding-outside-collaborators-to-repositories-in-your-organization)"
  /// to learn more about these collaborator types.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  ///
  /// Adding an outside collaborator may be restricted by enterprise and
  /// organization administrators. For more information, see "[Enforcing
  /// repository management policies in your
  /// enterprise](https://docs.github.com/admin/policies/enforcing-policies-for-your-enterprise/enforcing-repository-management-policies-in-your-enterprise#enforcing-a-policy-for-inviting-outside-collaborators-to-repositories)"
  /// and "[Setting permissions for adding outside
  /// collaborators](https://docs.github.com/organizations/managing-organization-settings/setting-permissions-for-adding-outside-collaborators)"
  /// for organization settings.
  ///
  /// For more information on permission levels, see "[Repository permission
  /// levels for an
  /// organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)".
  /// There are restrictions on which permissions can be granted to
  /// organization members when an organization base role is in place. In this
  /// case, the role being given must be equal to or higher than the org base
  /// permission. Otherwise, the request will fail with:
  ///
  /// ```
  /// Cannot assign {member} permission of {role name}
  /// ```
  ///
  /// Note that, if you choose not to pass any parameters, you'll need to set
  /// `Content-Length` to zero when calling out to this endpoint. For more
  /// information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  ///
  /// The invitee will receive a notification that they have been invited to
  /// the repository, which they must accept or decline. They may do this via
  /// the notifications page, the email they receive, or by using the
  /// [API](https://docs.github.com/rest/collaborators/invitations).
  ///
  /// For Enterprise Managed Users, this endpoint does not send invitations -
  /// these users are automatically added to organizations and repositories.
  /// Enterprise Managed Users can only be added to organizations and
  /// repositories within their enterprise.
  ///
  /// **Updating an existing collaborator's permission level**
  ///
  /// The endpoint can also be used to change the permissions of an existing
  /// collaborator without first removing and re-adding the collaborator. To
  /// change the permissions, use the same endpoint and pass a different
  /// `permission` parameter. The response will be a `204`, with no other
  /// indication that the permission level changed.
  ///
  /// **Rate limits**
  ///
  /// You are limited to sending 50 invitations to a repository per 24 hour
  /// period. Note there is no limit if you are inviting organization members
  /// to an organization repository.
  Future<ReposAddCollaboratorResponse> addCollaborator(
    String owner,
    String repo,
    String username, {
    ReposAddCollaboratorRequest? reposAddCollaboratorRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/collaborators/{username}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: reposAddCollaboratorRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ReposAddCollaboratorResponse201(
        RepositoryInvitation.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const ReposAddCollaboratorResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Remove a repository collaborator
  /// Removes a collaborator from a repository.
  ///
  /// To use this endpoint, the authenticated user must either be an
  /// administrator of the repository or target themselves for removal.
  ///
  /// This endpoint also:
  /// - Cancels any outstanding invitations sent by the collaborator
  /// - Unassigns the user from any issues
  /// - Removes access to organization projects if the user is not an
  /// organization member and is not a collaborator on any other organization
  /// repositories.
  /// - Unstars the repository
  /// - Updates access permissions to packages
  ///
  /// Removing a user as a collaborator has the following effects on forks:
  /// - If the user had access to a fork through their membership to this
  /// repository, the user will also be removed from the fork.
  /// - If the user had their own fork of the repository, the fork will be
  /// deleted.
  /// - If the user still has read access to the repository, open pull
  /// requests by this user from a fork will be denied.
  ///
  /// > [!NOTE]
  /// > A user can still have access to the repository through organization
  /// permissions like base repository permissions.
  ///
  /// Although the API responds immediately, the additional permission updates
  /// might take some extra time to complete in the background.
  ///
  /// For more information on fork permissions, see "[About permissions and
  /// visibility of
  /// forks](https://docs.github.com/pull-requests/collaborating-with-pull-requests/working-with-forks/about-permissions-and-visibility-of-forks)".
  Future<void> removeCollaborator(
    String owner,
    String repo,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/collaborators/{username}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get repository permissions for a user
  /// Checks the repository permission and role of a collaborator.
  ///
  /// The `permission` attribute provides the legacy base roles of `admin`,
  /// `write`, `read`, and `none`, where the
  /// `maintain` role is mapped to `write` and the `triage` role is mapped to
  /// `read`.
  /// The `role_name` attribute provides the name of the assigned role,
  /// including custom roles. The
  /// `permission` can also be used to determine which base level of access
  /// the collaborator has to the repository.
  ///
  /// The calculated permissions are the highest role assigned to the
  /// collaborator after considering all sources of grants, including: repo,
  /// teams, organization, and enterprise.
  /// There is presently not a way to differentiate between an organization
  /// level grant and a repository level grant from this endpoint response.
  Future<RepositoryCollaboratorPermission> getCollaboratorPermissionLevel(
    String owner,
    String repo,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/collaborators/{username}/permission'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryCollaboratorPermission.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List commit comments for a repository
  /// Lists the commit comments for a specified repository. Comments are
  /// ordered by ascending ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<CommitComment>> listCommitCommentsForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/comments'
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
      return (jsonDecode(response.body) as List)
          .map<CommitComment>(
            (e) => CommitComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a commit comment
  /// Gets a specified commit comment.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<CommitComment> getCommitComment(
    String owner,
    String repo,
    int commentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CommitComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a commit comment
  ///
  Future<void> deleteCommitComment(
    String owner,
    String repo,
    int commentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a commit comment
  /// Updates the contents of a specified commit comment.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<CommitComment> updateCommitComment(
    String owner,
    String repo,
    int commentId,
    ReposUpdateCommitCommentRequest reposUpdateCommitCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: reposUpdateCommitCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CommitComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List commits
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<List<Commit>> listCommits(
    String owner,
    String repo, {
    String? sha,
    String? path,
    String? author,
    String? committer,
    DateTime? since,
    DateTime? until,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (sha != null) 'sha': [sha],
        if (path != null) 'path': [path],
        if (author != null) 'author': [author],
        if (committer != null) 'committer': [committer],
        if (since != null) 'since': [since.toIso8601String()],
        if (until != null) 'until': [until.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Commit>((e) => Commit.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List branches for HEAD commit
  /// Protected branches are available in public repositories with GitHub Free
  /// and GitHub Free for organizations, and in public and private
  /// repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and
  /// GitHub Enterprise Server. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Returns all branches where the given commit SHA is the HEAD, or latest
  /// commit for the branch.
  Future<List<BranchShort>> listBranchesForHeadCommit(
    String owner,
    String repo,
    String commitSha,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{commit_sha}', Uri.encodeComponent(commitSha)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<BranchShort>(
            (e) => BranchShort.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List commit comments
  /// Lists the comments for a specified commit.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<CommitComment>> listCommentsForCommit(
    String owner,
    String repo,
    String commitSha, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{commit_sha}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{commit_sha}', Uri.encodeComponent(commitSha)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CommitComment>(
            (e) => CommitComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a commit comment
  /// Create a comment for a commit using its `:commit_sha`.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<CommitComment> createCommitComment(
    String owner,
    String repo,
    String commitSha,
    ReposCreateCommitCommentRequest reposCreateCommitCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/commits/{commit_sha}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{commit_sha}', Uri.encodeComponent(commitSha)),
      body: reposCreateCommitCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CommitComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List pull requests associated with a commit
  /// Lists the merged pull request that introduced the commit to the
  /// repository. If the commit is not present in the default branch, it will
  /// return merged and open pull requests associated with the commit.
  ///
  /// To list the open or merged pull requests associated with a branch, you
  /// can set the `commit_sha` parameter to the branch name.
  Future<List<PullRequestSimple>> listPullRequestsAssociatedWithCommit(
    String owner,
    String repo,
    String commitSha, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{commit_sha}/pulls'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{commit_sha}', Uri.encodeComponent(commitSha)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PullRequestSimple>(
            (e) => PullRequestSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a commit
  /// Returns the contents of a single commit reference. You must have `read`
  /// access for the repository to use this endpoint.
  ///
  /// > [!NOTE]
  /// > If there are more than 300 files in the commit diff and the default
  /// JSON media type is requested, the response will include pagination link
  /// headers for the remaining files, up to a limit of 3000 files. Each page
  /// contains the static commit information, and the only changes are to the
  /// file listing.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  /// Pagination query parameters are not supported for these media types.
  ///
  /// - **`application/vnd.github.diff`**: Returns the diff of the commit.
  /// Larger diffs may time out and return a 5xx status code.
  /// - **`application/vnd.github.patch`**: Returns the patch of the commit.
  /// Diffs with binary data will have no `patch` property. Larger diffs may
  /// time out and return a 5xx status code.
  /// - **`application/vnd.github.sha`**: Returns the commit's SHA-1 hash. You
  /// can use this endpoint to check if a remote reference's SHA-1 hash is the
  /// same as your local reference's SHA-1 hash by providing the local SHA-1
  /// reference as the ETag.
  ///
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<Commit> getCommit(
    String owner,
    String repo,
    String ref, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Commit.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the combined status for a specific reference
  /// Users with pull access in a repository can access a combined view of
  /// commit statuses for a given ref. The ref can be a SHA, a branch name, or
  /// a tag name.
  ///
  ///
  /// Additionally, a combined `state` is returned. The `state` is one of:
  ///
  /// *   **failure** if any of the contexts report as `error` or `failure`
  /// *   **pending** if there are no statuses or a context is `pending`
  /// *   **success** if the latest status for all contexts is `success`
  Future<CombinedCommitStatus> getCombinedStatusForRef(
    String owner,
    String repo,
    String ref, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{ref}/status'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CombinedCommitStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List commit statuses for a reference
  /// Users with pull access in a repository can view commit statuses for a
  /// given ref. The ref can be a SHA, a branch name, or a tag name. Statuses
  /// are returned in reverse chronological order. The first status in the
  /// list will be the latest one.
  ///
  /// This resource is also available via a legacy route: `GET /repos/:owner/:repo/statuses/:ref`.
  Future<List<Status>> listCommitStatusesForRef(
    String owner,
    String repo,
    String ref, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{ref}/statuses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Status>((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get community profile metrics
  /// Returns all community profile metrics for a repository. The repository
  /// cannot be a fork.
  ///
  /// The returned metrics include an overall health score, the repository
  /// description, the presence of documentation, the
  /// detected code of conduct, the detected license, and the presence of
  /// ISSUE\_TEMPLATE, PULL\_REQUEST\_TEMPLATE,
  /// README, and CONTRIBUTING files.
  ///
  /// The `health_percentage` score is defined as a percentage of how many of
  /// the recommended community health files are present. For more
  /// information, see
  /// "[About community profiles for public
  /// repositories](https://docs.github.com/communities/setting-up-your-project-for-healthy-contributions/about-community-profiles-for-public-repositories)."
  ///
  /// `content_reports_enabled` is only returned for organization-owned
  /// repositories.
  Future<CommunityProfile> getCommunityProfileMetrics(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/community/profile'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CommunityProfile.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Compare two commits
  /// Compares two commits against one another. You can compare refs (branches
  /// or tags) and commit SHAs in the same repository, or you can compare refs
  /// and commit SHAs that exist in different repositories within the same
  /// repository network, including fork branches. For more information about
  /// how to view a repository's network, see "[Understanding connections
  /// between
  /// repositories](https://docs.github.com/repositories/viewing-activity-and-data-for-your-repository/understanding-connections-between-repositories)."
  ///
  /// This endpoint is equivalent to running the `git log BASE..HEAD` command,
  /// but it returns commits in a different order. The `git log BASE..HEAD`
  /// command returns commits in reverse chronological order, whereas the API
  /// returns commits in chronological order.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.diff`**: Returns the diff of the commit.
  /// - **`application/vnd.github.patch`**: Returns the patch of the commit.
  /// Diffs with binary data will have no `patch` property.
  ///
  /// The API response includes details about the files that were changed
  /// between the two commits. This includes the status of the change (if a
  /// file was added, removed, modified, or renamed), and details of the
  /// change itself. For example, files with a `renamed` status have a
  /// `previous_filename` field showing the previous filename of the file, and
  /// files with a `modified` status have a `patch` field showing the changes
  /// made to the file.
  ///
  /// When calling this endpoint without any paging parameter (`per_page` or
  /// `page`), the returned list is limited to 250 commits, and the last
  /// commit in the list is the most recent of the entire comparison.
  ///
  /// **Working with large comparisons**
  ///
  /// To process a response with a large number of commits, use a query
  /// parameter (`per_page` or `page`) to paginate the results. When using
  /// pagination:
  ///
  /// - The list of changed files is only shown on the first page of results,
  /// and it includes up to 300 changed files for the entire comparison.
  /// - The results are returned in chronological order, but the last commit
  /// in the returned list may not be the most recent one in the entire set if
  /// there are more pages of results.
  ///
  /// For more information on working with pagination, see "[Using pagination
  /// in the REST
  /// API](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api)."
  ///
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The `verification` object
  /// includes the following fields:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<CommitComparison> compareCommits(
    String owner,
    String repo,
    String basehead, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/compare/{basehead}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{basehead}', Uri.encodeComponent(basehead)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CommitComparison.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get repository content
  /// Gets the contents of a file or directory in a repository. Specify the
  /// file path or directory with the `path` parameter. If you omit the `path`
  /// parameter, you will receive the contents of the repository's root
  /// directory.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw file contents
  /// for files and symlinks.
  /// - **`application/vnd.github.html+json`**: Returns the file contents in
  /// HTML. Markup languages are rendered to HTML using GitHub's open-source
  /// [Markup library](https://github.com/github/markup).
  /// - **`application/vnd.github.object+json`**: Returns the contents in a
  /// consistent object format regardless of the content type. For example,
  /// instead of an array of objects for a directory, the response will be an
  /// object with an `entries` attribute containing the array of objects.
  ///
  /// If the content is a directory, the response will be an array of objects,
  /// one object for each item in the directory. When listing the contents of
  /// a directory, submodules have their "type" specified as "file".
  /// Logically, the value _should_ be "submodule". This behavior exists [for
  /// backwards compatibility purposes](https://git.io/v1YCW). In the next
  /// major version of the API, the type will be returned as "submodule".
  ///
  /// If the content is a symlink and the symlink's target is a normal file in
  /// the repository, then the API responds with the content of the file.
  /// Otherwise, the API responds with an object describing the symlink
  /// itself.
  ///
  /// If the content is a submodule, the `submodule_git_url` field identifies
  /// the location of the submodule repository, and the `sha` identifies a
  /// specific commit within the submodule repository. Git uses the given URL
  /// when cloning the submodule repository, and checks out the submodule at
  /// that specific commit. If the submodule repository is not hosted on
  /// github.com, the Git URLs (`git_url` and `_links["git"]`) and the
  /// github.com URLs (`html_url` and `_links["html"]`) will have null values.
  ///
  /// **Notes**:
  ///
  /// - To get a repository's contents recursively, you can [recursively get
  /// the tree](https://docs.github.com/rest/git/trees#get-a-tree).
  /// - This API has an upper limit of 1,000 files for a directory. If you
  /// need to retrieve
  /// more files, use the [Git Trees
  /// API](https://docs.github.com/rest/git/trees#get-a-tree).
  /// - Download URLs expire and are meant to be used just once. To ensure the
  /// download URL does not expire, please use the contents API to obtain a
  /// fresh download URL for each download.
  /// - If the requested file's size is:
  ///   - 1 MB or smaller: All features of this endpoint are supported.
  /// - Between 1-100 MB: Only the `raw` or `object` custom media types are
  /// supported. Both will work as normal, except that when using the `object`
  /// media type, the `content` field will be an empty
  /// string and the `encoding` field will be `"none"`. To get the contents of
  /// these larger files, use the `raw` media type.
  ///   - Greater than 100 MB: This endpoint is not supported.
  Future<ReposGetContent200Response> getContent(
    String owner,
    String repo,
    String path, {
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/contents/{path}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{path}', Uri.encodeComponent(path)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposGetContent200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update file contents
  /// Creates a new file or replaces an existing file in a repository.
  ///
  /// > [!NOTE]
  /// > If you use this endpoint and the "[Delete a
  /// file](https://docs.github.com/rest/repos/contents/#delete-a-file)"
  /// endpoint in parallel, the concurrent requests will conflict and you will
  /// receive errors. You must use these endpoints serially instead.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint. The `workflow` scope is also required in
  /// order to modify files in the `.github/workflows` directory.
  Future<FileCommit> createOrUpdateFileContents(
    String owner,
    String repo,
    String path,
    ReposCreateOrUpdateFileContentsRequest
    reposCreateOrUpdateFileContentsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/contents/{path}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{path}', Uri.encodeComponent(path)),
      body: reposCreateOrUpdateFileContentsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FileCommit.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a file
  /// Deletes a file in a repository.
  ///
  /// You can provide an additional `committer` parameter, which is an object
  /// containing information about the committer. Or, you can provide an
  /// `author` parameter, which is an object containing information about the
  /// author.
  ///
  /// The `author` section is optional and is filled in with the `committer`
  /// information if omitted. If the `committer` information is omitted, the
  /// authenticated user's information is used.
  ///
  /// You must provide values for both `name` and `email`, whether you choose
  /// to use `author` or `committer`. Otherwise, you'll receive a `422` status
  /// code.
  ///
  /// > [!NOTE]
  /// > If you use this endpoint and the "[Create or update file
  /// contents](https://docs.github.com/rest/repos/contents/#create-or-update-file-contents)"
  /// endpoint in parallel, the concurrent requests will conflict and you will
  /// receive errors. You must use these endpoints serially instead.
  Future<FileCommit> deleteFile(
    String owner,
    String repo,
    String path,
    ReposDeleteFileRequest reposDeleteFileRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/contents/{path}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{path}', Uri.encodeComponent(path)),
      body: reposDeleteFileRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FileCommit.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository contributors
  /// Lists contributors to the specified repository and sorts them by the
  /// number of commits per contributor in descending order. This endpoint may
  /// return information that is a few hours old because the GitHub REST API
  /// caches contributor data to improve performance.
  ///
  /// GitHub identifies contributors by author email address. This endpoint
  /// groups contribution counts by GitHub user, which includes all associated
  /// email addresses. To improve performance, only the first 500 author email
  /// addresses in the repository link to GitHub users. The rest will appear
  /// as anonymous contributors without associated GitHub user information.
  Future<ReposListContributorsResponse> listContributors(
    String owner,
    String repo, {
    String? anon,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/contributors'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (anon != null) 'anon': [anon],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposListContributorsResponse200(
        (jsonDecode(response.body) as List)
            .map<Contributor>(
              (e) => Contributor.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      204 => const ReposListContributorsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// List deployments
  /// Simple filtering of deployments is available via query parameters:
  Future<List<Deployment>> listDeployments(
    String owner,
    String repo, {
    String? sha = 'none',
    String? ref = 'none',
    String? task = 'none',
    String? environment = 'none',
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/deployments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (sha != null) 'sha': [sha],
        if (ref != null) 'ref': [ref],
        if (task != null) 'task': [task],
        if (environment != null) 'environment': [environment],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
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

  /// Create a deployment
  /// Deployments offer a few configurable parameters with certain defaults.
  ///
  /// The `ref` parameter can be any named branch, tag, or SHA. At GitHub we
  /// often deploy branches and verify them
  /// before we merge a pull request.
  ///
  /// The `environment` parameter allows deployments to be issued to different
  /// runtime environments. Teams often have
  /// multiple environments for verifying their applications, such as
  /// `production`, `staging`, and `qa`. This parameter
  /// makes it easier to track which environments have requested deployments.
  /// The default environment is `production`.
  ///
  /// The `auto_merge` parameter is used to ensure that the requested ref is
  /// not behind the repository's default branch. If
  /// the ref _is_ behind the default branch for the repository, we will
  /// attempt to merge it for you. If the merge succeeds,
  /// the API will return a successful merge commit. If merge conflicts
  /// prevent the merge from succeeding, the API will
  /// return a failure response.
  ///
  /// By default, [commit
  /// statuses](https://docs.github.com/rest/commits/statuses) for every
  /// submitted context must be in a `success`
  /// state. The `required_contexts` parameter allows you to specify a subset
  /// of contexts that must be `success`, or to
  /// specify contexts that have not yet been submitted. You are not required
  /// to use commit statuses to deploy. If you do
  /// not require any contexts or create any commit statuses, the deployment
  /// will always succeed.
  ///
  /// The `payload` parameter is available for any extra information that a
  /// deployment system might need. It is a JSON text
  /// field that will be passed on when a deployment event is dispatched.
  ///
  /// The `task` parameter is used by the deployment system to allow different
  /// execution paths. In the web world this might
  /// be `deploy:migrations` to run schema changes on the system. In the
  /// compiled world this could be a flag to compile an
  /// application with debugging enabled.
  ///
  /// Merged branch response:
  ///
  /// You will see this response when GitHub automatically merges the base
  /// branch into the topic branch instead of creating
  /// a deployment. This auto-merge happens when:
  /// *   Auto-merge option is enabled in the repository
  /// *   Topic branch does not include the latest changes on the base branch,
  /// which is `master` in the response example
  /// *   There are no merge conflicts
  ///
  /// If there are no new commits in the base branch, a new request to create
  /// a deployment should give a successful
  /// response.
  ///
  /// Merge conflict response:
  ///
  /// This error happens when the `auto_merge` option is enabled and when the
  /// default branch (in this case `master`), can't
  /// be merged into the branch that's being deployed (in this case
  /// `topic-branch`), due to merge conflicts.
  ///
  /// Failed commit status checks:
  ///
  /// This error happens when the `required_contexts` parameter indicates that
  /// one or more contexts need to have a `success`
  /// status for the commit to be deployed, but one or more of the required
  /// contexts do not have a state of `success`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repo_deployment` scope to use this endpoint.
  Future<ReposCreateDeploymentResponse> createDeployment(
    String owner,
    String repo,
    ReposCreateDeploymentRequest reposCreateDeploymentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/deployments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateDeploymentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ReposCreateDeploymentResponse201(
        Deployment.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      202 => ReposCreateDeploymentResponse202(
        ReposCreateDeployment202Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get a deployment
  ///
  Future<Deployment> getDeployment(
    String owner,
    String repo,
    int deploymentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/deployments/{deployment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{deployment_id}', '$deploymentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Deployment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a deployment
  /// If the repository only has one deployment, you can delete the deployment
  /// regardless of its status. If the repository has more than one
  /// deployment, you can only delete inactive deployments. This ensures that
  /// repositories with multiple deployments will always have an active
  /// deployment.
  ///
  /// To set a deployment as inactive, you must:
  ///
  /// *   Create a new deployment that is active so that the system has a
  /// record of the current state, then delete the previously active
  /// deployment.
  /// *   Mark the active deployment as inactive by adding any non-successful
  /// deployment status.
  ///
  /// For more information, see "[Create a
  /// deployment](https://docs.github.com/rest/deployments/deployments/#create-a-deployment)"
  /// and "[Create a deployment
  /// status](https://docs.github.com/rest/deployments/statuses#create-a-deployment-status)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repo_deployment` scope to use this endpoint.
  Future<void> deleteDeployment(
    String owner,
    String repo,
    int deploymentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/deployments/{deployment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{deployment_id}', '$deploymentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List deployment statuses
  /// Users with pull access can view deployment statuses for a deployment:
  Future<List<DeploymentStatus>> listDeploymentStatuses(
    String owner,
    String repo,
    int deploymentId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/deployments/{deployment_id}/statuses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{deployment_id}', '$deploymentId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<DeploymentStatus>(
            (e) => DeploymentStatus.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a deployment status
  /// Users with `push` access can create deployment statuses for a given
  /// deployment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `repo_deployment` scope to use this endpoint.
  Future<DeploymentStatus> createDeploymentStatus(
    String owner,
    String repo,
    int deploymentId,
    ReposCreateDeploymentStatusRequest reposCreateDeploymentStatusRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/deployments/{deployment_id}/statuses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{deployment_id}', '$deploymentId'),
      body: reposCreateDeploymentStatusRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a deployment status
  /// Users with pull access can view a deployment status for a deployment:
  Future<DeploymentStatus> getDeploymentStatus(
    String owner,
    String repo,
    int deploymentId,
    int statusId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{deployment_id}', '$deploymentId')
              .replaceAll('{status_id}', '$statusId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository dispatch event
  /// You can use this endpoint to trigger a webhook event called
  /// `repository_dispatch` when you want activity that happens outside of
  /// GitHub to trigger a GitHub Actions workflow or GitHub App webhook. You
  /// must configure your GitHub Actions workflow or GitHub App to run when
  /// the `repository_dispatch` event occurs. For an example
  /// `repository_dispatch` webhook payload, see
  /// "[RepositoryDispatchEvent](https://docs.github.com/webhooks/event-payloads/#repository_dispatch)."
  ///
  /// The `client_payload` parameter is available for any extra information
  /// that your workflow might need. This parameter is a JSON payload that
  /// will be passed on when the webhook event is dispatched. For example, the
  /// `client_payload` can include a message that a user would like to send
  /// using a GitHub Actions workflow. Or the `client_payload` can be used as
  /// a test to debug your workflow.
  ///
  /// This input example shows how you can use the `client_payload` as a test
  /// to debug your workflow.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> createDispatchEvent(
    String owner,
    String repo,
    ReposCreateDispatchEventRequest reposCreateDispatchEventRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/dispatches'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateDispatchEventRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List environments
  /// Lists the environments for a repository.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ReposGetAllEnvironments200Response> getAllEnvironments(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/environments'
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
      return ReposGetAllEnvironments200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an environment
  /// > [!NOTE]
  /// > To get information about name patterns that branches must match in
  /// order to deploy to this environment, see "[Get a deployment branch
  /// policy](/rest/deployments/branch-policies#get-a-deployment-branch-policy)."
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<Environment> getEnvironment(
    String owner,
    String repo,
    String environmentName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/environments/{environment_name}'
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
      return Environment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update an environment
  /// Create or update an environment with protection rules, such as required
  /// reviewers. For more information about environment protection rules, see
  /// "[Environments](/actions/reference/environments#environment-protection-rules)."
  ///
  /// > [!NOTE]
  /// > To create or update name patterns that branches must match in order to
  /// deploy to this environment, see "[Deployment branch
  /// policies](/rest/deployments/branch-policies)."
  ///
  /// > [!NOTE]
  /// > To create or update secrets for an environment, see "[GitHub Actions
  /// secrets](/rest/actions/secrets)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<Environment> createOrUpdateEnvironment(
    String owner,
    String repo,
    String environmentName, {
    ReposCreateOrUpdateEnvironmentRequest?
    reposCreateOrUpdateEnvironmentRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/environments/{environment_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{environment_name}',
            Uri.encodeComponent(environmentName),
          ),
      body: reposCreateOrUpdateEnvironmentRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Environment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an environment
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> deleteAnEnvironment(
    String owner,
    String repo,
    String environmentName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/environments/{environment_name}'
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
  }

  /// List deployment branch policies
  /// Lists the deployment branch policies for an environment.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ReposListDeploymentBranchPolicies200Response>
  listDeploymentBranchPolicies(
    String owner,
    String repo,
    String environmentName, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies'
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
      return ReposListDeploymentBranchPolicies200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a deployment branch policy
  /// Creates a deployment branch or tag policy for an environment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DeploymentBranchPolicy> createDeploymentBranchPolicy(
    String owner,
    String repo,
    String environmentName,
    DeploymentBranchPolicyNamePatternWithType
    deploymentBranchPolicyNamePatternWithType,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              ),
      body: deploymentBranchPolicyNamePatternWithType.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentBranchPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a deployment branch policy
  /// Gets a deployment branch or tag policy for an environment.
  ///
  /// Anyone with read access to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<DeploymentBranchPolicy> getDeploymentBranchPolicy(
    String owner,
    String repo,
    String environmentName,
    int branchPolicyId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{branch_policy_id}', '$branchPolicyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentBranchPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a deployment branch policy
  /// Updates a deployment branch or tag policy for an environment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DeploymentBranchPolicy> updateDeploymentBranchPolicy(
    String owner,
    String repo,
    String environmentName,
    int branchPolicyId,
    DeploymentBranchPolicyNamePattern deploymentBranchPolicyNamePattern,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{branch_policy_id}', '$branchPolicyId'),
      body: deploymentBranchPolicyNamePattern.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentBranchPolicy.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a deployment branch policy
  /// Deletes a deployment branch or tag policy for an environment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> deleteDeploymentBranchPolicy(
    String owner,
    String repo,
    String environmentName,
    int branchPolicyId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{branch_policy_id}', '$branchPolicyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get all deployment protection rules for an environment
  /// Gets all custom deployment protection rules that are enabled for an
  /// environment. Anyone with read access to the repository can use this
  /// endpoint. For more information about environments, see "[Using
  /// environments for
  /// deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment)."
  ///
  /// For more information about the app that is providing this custom
  /// deployment rule, see the [documentation for the `GET /apps/{app_slug}`
  /// endpoint](https://docs.github.com/rest/apps/apps#get-an-app).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ReposGetAllDeploymentProtectionRules200Response>
  getAllDeploymentProtectionRules(
    String environmentName,
    String repo,
    String owner,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules'
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{owner}', Uri.encodeComponent(owner)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposGetAllDeploymentProtectionRules200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a custom deployment protection rule on an environment
  /// Enable a custom deployment protection rule for an environment.
  ///
  /// The authenticated user must have admin or owner permissions to the
  /// repository to use this endpoint.
  ///
  /// For more information about the app that is providing this custom
  /// deployment rule, see the [documentation for the `GET /apps/{app_slug}`
  /// endpoint](https://docs.github.com/rest/apps/apps#get-an-app), as well as
  /// the [guide to creating custom deployment protection
  /// rules](https://docs.github.com/actions/managing-workflow-runs-and-deployments/managing-deployments/creating-custom-deployment-protection-rules).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DeploymentProtectionRule> createDeploymentProtectionRule(
    String environmentName,
    String repo,
    String owner,
    ReposCreateDeploymentProtectionRuleRequest
    reposCreateDeploymentProtectionRuleRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules'
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{owner}', Uri.encodeComponent(owner)),
      body: reposCreateDeploymentProtectionRuleRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentProtectionRule.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List custom deployment rule integrations available for an environment
  /// Gets all custom deployment protection rule integrations that are
  /// available for an environment.
  ///
  /// The authenticated user must have admin or owner permissions to the
  /// repository to use this endpoint.
  ///
  /// For more information about environments, see "[Using environments for
  /// deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment)."
  ///
  /// For more information about the app that is providing this custom
  /// deployment rule, see "[GET an
  /// app](https://docs.github.com/rest/apps/apps#get-an-app)".
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<ReposListCustomDeploymentRuleIntegrations200Response>
  listCustomDeploymentRuleIntegrations(
    String environmentName,
    String repo,
    String owner, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps'
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{owner}', Uri.encodeComponent(owner)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposListCustomDeploymentRuleIntegrations200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a custom deployment protection rule
  /// Gets an enabled custom deployment protection rule for an environment.
  /// Anyone with read access to the repository can use this endpoint. For
  /// more information about environments, see "[Using environments for
  /// deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment)."
  ///
  /// For more information about the app that is providing this custom
  /// deployment rule, see [`GET /apps/{app_slug}`](https://docs.github.com/rest/apps/apps#get-an-app).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with a private repository.
  Future<DeploymentProtectionRule> getCustomDeploymentProtectionRule(
    String owner,
    String repo,
    String environmentName,
    int protectionRuleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{protection_rule_id}', '$protectionRuleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeploymentProtectionRule.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Disable a custom protection rule for an environment
  /// Disables a custom deployment protection rule for an environment.
  ///
  /// The authenticated user must have admin or owner permissions to the
  /// repository to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> disableDeploymentProtectionRule(
    String environmentName,
    String repo,
    String owner,
    int protectionRuleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}'
              .replaceAll(
                '{environment_name}',
                Uri.encodeComponent(environmentName),
              )
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{protection_rule_id}', '$protectionRuleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List forks
  ///
  Future<List<MinimalRepository>> listForks(
    String owner,
    String repo, {
    ReposListForksParameter2? sort = ReposListForksParameter2.newest,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/forks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (sort != null) 'sort': [sort.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a fork
  /// Create a fork for the authenticated user.
  ///
  /// > [!NOTE]
  /// > Forking a Repository happens asynchronously. You may have to wait a
  /// short period of time before you can access the git objects. If this
  /// takes longer than 5 minutes, be sure to contact [GitHub
  /// Support](https://support.github.com/contact?tags=dotcom-rest-api).
  ///
  /// > [!NOTE]
  /// > Although this endpoint works with GitHub Apps, the GitHub App must be
  /// installed on the destination account with access to all repositories and
  /// on the source account with access to the source repository.
  Future<FullRepository> createFork(
    String owner,
    String repo, {
    ReposCreateForkRequest? reposCreateForkRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/forks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateForkRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository webhooks
  /// Lists webhooks for a repository. `last response` may return null if
  /// there have not been any deliveries within 30 days.
  Future<List<Hook>> listWebhooks(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/hooks'
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
      return (jsonDecode(response.body) as List)
          .map<Hook>((e) => Hook.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository webhook
  /// Repositories can have multiple webhooks installed. Each webhook should
  /// have a unique `config`. Multiple webhooks can
  /// share the same `config` as long as those webhooks do not have any
  /// `events` that overlap.
  Future<Hook> createWebhook(
    String owner,
    String repo, {
    ReposCreateWebhookRequest? reposCreateWebhookRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/hooks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateWebhookRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Hook.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository webhook
  /// Returns a webhook configured in a repository. To get only the webhook
  /// `config` properties, see "[Get a webhook configuration for a
  /// repository](/rest/webhooks/repo-config#get-a-webhook-configuration-for-a-repository)."
  Future<Hook> getWebhook(String owner, String repo, int hookId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Hook.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository webhook
  /// Delete a webhook for an organization.
  ///
  /// The authenticated user must be a repository owner, or have admin access
  /// in the repository, to delete the webhook.
  Future<void> deleteWebhook(String owner, String repo, int hookId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a repository webhook
  /// Updates a webhook configured in a repository. If you previously had a
  /// `secret` set, you must provide the same `secret` or set a new `secret`
  /// or the secret will be removed. If you are only updating individual
  /// webhook `config` properties, use "[Update a webhook configuration for a
  /// repository](/rest/webhooks/repo-config#update-a-webhook-configuration-for-a-repository)."
  Future<Hook> updateWebhook(
    String owner,
    String repo,
    int hookId,
    ReposUpdateWebhookRequest reposUpdateWebhookRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
      body: reposUpdateWebhookRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Hook.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a webhook configuration for a repository
  /// Returns the webhook configuration for a repository. To get more
  /// information about the webhook, including the `active` state and
  /// `events`, use "[Get a repository
  /// webhook](/rest/webhooks/repos#get-a-repository-webhook)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:repo_hook` or `repo` scope to use this endpoint.
  Future<WebhookConfig> getWebhookConfigForRepo(
    String owner,
    String repo,
    int hookId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/config'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WebhookConfig.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a webhook configuration for a repository
  /// Updates the webhook configuration for a repository. To update more
  /// information about the webhook, including the `active` state and
  /// `events`, use "[Update a repository
  /// webhook](/rest/webhooks/repos#update-a-repository-webhook)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:repo_hook` or `repo` scope to use this endpoint.
  Future<WebhookConfig> updateWebhookConfigForRepo(
    String owner,
    String repo,
    int hookId, {
    ReposUpdateWebhookConfigForRepoRequest?
    reposUpdateWebhookConfigForRepoRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/config'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
      body: reposUpdateWebhookConfigForRepoRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return WebhookConfig.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List deliveries for a repository webhook
  /// Returns a list of webhook deliveries for a webhook configured in a
  /// repository.
  Future<List<HookDeliveryItem>> listWebhookDeliveries(
    String owner,
    String repo,
    int hookId, {
    int? perPage = 30,
    String? cursor,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/deliveries'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (cursor != null) 'cursor': [cursor],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<HookDeliveryItem>(
            (e) => HookDeliveryItem.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a delivery for a repository webhook
  /// Returns a delivery for a webhook configured in a repository.
  Future<HookDelivery> getWebhookDelivery(
    String owner,
    String repo,
    int hookId,
    int deliveryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId')
          .replaceAll('{delivery_id}', '$deliveryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return HookDelivery.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Redeliver a delivery for a repository webhook
  /// Redeliver a webhook delivery for a webhook configured in a repository.
  Future<dynamic> redeliverWebhookDelivery(
    String owner,
    String repo,
    int hookId,
    int deliveryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{hook_id}', '$hookId')
              .replaceAll('{delivery_id}', '$deliveryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Ping a repository webhook
  /// This will trigger a [ping
  /// event](https://docs.github.com/webhooks/#ping-event) to be sent to the
  /// hook.
  Future<void> pingWebhook(String owner, String repo, int hookId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/pings'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Test the push repository webhook
  /// This will trigger the hook with the latest push to the current
  /// repository if the hook is subscribed to `push` events. If the hook is
  /// not subscribed to `push` events, the server will respond with 204 but no
  /// test POST will be generated.
  ///
  /// > [!NOTE]
  /// > Previously `/repos/:owner/:repo/hooks/:hook_id/test`
  Future<void> testPushWebhook(String owner, String repo, int hookId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/hooks/{hook_id}/tests'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository invitations
  /// When authenticating as a user with admin rights to a repository, this
  /// endpoint will list all currently open repository invitations.
  Future<List<RepositoryInvitation>> listInvitations(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/invitations'
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
      return (jsonDecode(response.body) as List)
          .map<RepositoryInvitation>(
            (e) => RepositoryInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository invitation
  ///
  Future<void> deleteInvitation(
    String owner,
    String repo,
    int invitationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/invitations/{invitation_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{invitation_id}', '$invitationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a repository invitation
  ///
  Future<RepositoryInvitation> updateInvitation(
    String owner,
    String repo,
    int invitationId, {
    ReposUpdateInvitationRequest? reposUpdateInvitationRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/invitations/{invitation_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{invitation_id}', '$invitationId'),
      body: reposUpdateInvitationRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryInvitation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List deploy keys
  ///
  Future<List<DeployKey>> listDeployKeys(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/keys'
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
      return (jsonDecode(response.body) as List)
          .map<DeployKey>((e) => DeployKey.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a deploy key
  /// You can create a read-only deploy key.
  Future<DeployKey> createDeployKey(
    String owner,
    String repo,
    ReposCreateDeployKeyRequest reposCreateDeployKeyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/keys'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateDeployKeyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeployKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a deploy key
  ///
  Future<DeployKey> getDeployKey(String owner, String repo, int keyId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/keys/{key_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{key_id}', '$keyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DeployKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a deploy key
  /// Deploy keys are immutable. If you need to update a key, remove the key
  /// and create a new one instead.
  Future<void> deleteDeployKey(String owner, String repo, int keyId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/keys/{key_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{key_id}', '$keyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository languages
  /// Lists languages for the specified repository. The value shown for each
  /// language is the number of bytes of code written in that language.
  Future<Map<String, int>> listLanguages(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/languages'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value as int),
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Sync a fork branch with the upstream repository
  /// Sync a branch of a forked repository to keep it up-to-date with the
  /// upstream repository.
  Future<MergedUpstream> mergeUpstream(
    String owner,
    String repo,
    ReposMergeUpstreamRequest reposMergeUpstreamRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/merge-upstream'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposMergeUpstreamRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return MergedUpstream.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Merge a branch
  ///
  Future<ReposMergeResponse> merge(
    String owner,
    String repo,
    ReposMergeRequest reposMergeRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/merges'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposMergeRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => ReposMergeResponse201(
        Commit.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const ReposMergeResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get a GitHub Pages site
  /// Gets information about a GitHub Pages site.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<Page> getPages(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Page.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a GitHub Pages site
  /// Configures a GitHub Pages site. For more information, see "[About GitHub
  /// Pages](/github/working-with-github-pages/about-github-pages)."
  ///
  /// The authenticated user must be a repository administrator, maintainer,
  /// or have the 'manage GitHub Pages settings' permission.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<Page> createPagesSite(
    String owner,
    String repo,
    ReposCreatePagesSiteRequest reposCreatePagesSiteRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pages'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreatePagesSiteRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Page.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update information about a GitHub Pages site
  /// Updates information for a GitHub Pages site. For more information, see
  /// "[About GitHub
  /// Pages](/github/working-with-github-pages/about-github-pages).
  ///
  /// The authenticated user must be a repository administrator, maintainer,
  /// or have the 'manage GitHub Pages settings' permission.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> updateInformationAboutPagesSite(
    String owner,
    String repo,
    ReposUpdateInformationAboutPagesSiteRequest
    reposUpdateInformationAboutPagesSiteRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/pages'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposUpdateInformationAboutPagesSiteRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete a GitHub Pages site
  /// Deletes a GitHub Pages site. For more information, see "[About GitHub
  /// Pages](/github/working-with-github-pages/about-github-pages).
  ///
  /// The authenticated user must be a repository administrator, maintainer,
  /// or have the 'manage GitHub Pages settings' permission.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> deletePagesSite(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/pages'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List GitHub Pages builds
  /// Lists builts of a GitHub Pages site.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<List<PageBuild>> listPagesBuilds(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages/builds'
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
      return (jsonDecode(response.body) as List)
          .map<PageBuild>((e) => PageBuild.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Request a GitHub Pages build
  /// You can request that your site be built from the latest revision on the
  /// default branch. This has the same effect as pushing a commit to your
  /// default branch, but does not require an additional commit. Manually
  /// triggering page builds can be helpful when diagnosing build warnings and
  /// failures.
  ///
  /// Build requests are limited to one concurrent build per repository and
  /// one concurrent build per requester. If you request a build while another
  /// is still in progress, the second request will be queued until the first
  /// completes.
  Future<PageBuildStatus> requestPagesBuild(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pages/builds'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PageBuildStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get latest Pages build
  /// Gets information about the single most recent build of a GitHub Pages
  /// site.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<PageBuild> getLatestPagesBuild(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages/builds/latest'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PageBuild.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Pages build
  /// Gets information about a GitHub Pages build.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<PageBuild> getPagesBuild(
    String owner,
    String repo,
    int buildId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages/builds/{build_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{build_id}', '$buildId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PageBuild.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a GitHub Pages deployment
  /// Create a GitHub Pages deployment for a repository.
  ///
  /// The authenticated user must have write permission to the repository.
  Future<PageDeployment> createPagesDeployment(
    String owner,
    String repo,
    ReposCreatePagesDeploymentRequest reposCreatePagesDeploymentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pages/deployments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreatePagesDeploymentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PageDeployment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the status of a GitHub Pages deployment
  /// Gets the current status of a GitHub Pages deployment.
  ///
  /// The authenticated user must have read permission for the GitHub Pages
  /// site.
  Future<PagesDeploymentStatus> getPagesDeployment(
    String owner,
    String repo,
    PagesDeploymentIdParam pagesDeploymentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll(
            '{pages_deployment_id}',
            Uri.encodeComponent('${pagesDeploymentId.toJson()}'),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PagesDeploymentStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Cancel a GitHub Pages deployment
  /// Cancels a GitHub Pages deployment.
  ///
  /// The authenticated user must have write permissions for the GitHub Pages
  /// site.
  Future<void> cancelPagesDeployment(
    String owner,
    String repo,
    PagesDeploymentIdParam pagesDeploymentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{pages_deployment_id}',
                Uri.encodeComponent('${pagesDeploymentId.toJson()}'),
              ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a DNS health check for GitHub Pages
  /// Gets a health check of the DNS settings for the `CNAME` record
  /// configured for a repository's GitHub Pages.
  ///
  /// The first request to this endpoint returns a `202 Accepted` status and
  /// starts an asynchronous background task to get the results for the
  /// domain. After the background task completes, subsequent requests to this
  /// endpoint return a `200 OK` status with the health check results in the
  /// response.
  ///
  /// The authenticated user must be a repository administrator, maintainer,
  /// or have the 'manage GitHub Pages settings' permission to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<ReposGetPagesHealthCheckResponse> getPagesHealthCheck(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pages/health'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposGetPagesHealthCheckResponse200(
        PagesHealthCheck.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      202 => ReposGetPagesHealthCheckResponse202(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Check if private vulnerability reporting is enabled for a repository
  /// Returns a boolean indicating whether or not private vulnerability
  /// reporting is enabled for the repository. For more information, see
  /// "[Evaluating the security settings of a
  /// repository](https://docs.github.com/code-security/security-advisories/working-with-repository-security-advisories/evaluating-the-security-settings-of-a-repository)".
  Future<ReposCheckPrivateVulnerabilityReporting200Response>
  checkPrivateVulnerabilityReporting(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/private-vulnerability-reporting'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReposCheckPrivateVulnerabilityReporting200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Enable private vulnerability reporting for a repository
  /// Enables private vulnerability reporting for a repository. The
  /// authenticated user must have admin access to the repository. For more
  /// information, see "[Privately reporting a security
  /// vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)."
  Future<void> enablePrivateVulnerabilityReporting(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/private-vulnerability-reporting'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Disable private vulnerability reporting for a repository
  /// Disables private vulnerability reporting for a repository. The
  /// authenticated user must have admin access to the repository. For more
  /// information, see "[Privately reporting a security
  /// vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)".
  Future<void> disablePrivateVulnerabilityReporting(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/private-vulnerability-reporting'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get all custom property values for a repository
  /// Gets all custom property values that are set for a repository.
  /// Users with read access to the repository can use this endpoint.
  Future<List<CustomPropertyValue>> getCustomPropertiesValues(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/properties/values'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CustomPropertyValue>(
            (e) => CustomPropertyValue.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update custom property values for a repository
  /// Create new or update existing custom property values for a repository.
  /// Using a value of `null` for a custom property will remove or 'unset' the
  /// property value from the repository.
  ///
  /// Repository admins and other users with the repository-level "edit custom
  /// property values" fine-grained permission can use this endpoint.
  Future<void> createOrUpdateCustomPropertiesValues(
    String owner,
    String repo,
    ReposCreateOrUpdateCustomPropertiesValuesRequest
    reposCreateOrUpdateCustomPropertiesValuesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/properties/values'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateOrUpdateCustomPropertiesValuesRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a repository README
  /// Gets the preferred README for a repository.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw file contents.
  /// This is the default if you do not specify a media type.
  /// - **`application/vnd.github.html+json`**: Returns the README in HTML.
  /// Markup languages are rendered to HTML using GitHub's open-source [Markup
  /// library](https://github.com/github/markup).
  Future<ContentFile> getReadme(
    String owner,
    String repo, {
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/readme'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ContentFile.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository README for a directory
  /// Gets the README from a repository directory.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw file contents.
  /// This is the default if you do not specify a media type.
  /// - **`application/vnd.github.html+json`**: Returns the README in HTML.
  /// Markup languages are rendered to HTML using GitHub's open-source [Markup
  /// library](https://github.com/github/markup).
  Future<ContentFile> getReadmeInDirectory(
    String owner,
    String repo,
    String dir, {
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/readme/{dir}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{dir}', Uri.encodeComponent(dir)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ContentFile.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List releases
  /// This returns a list of releases, which does not include regular Git tags
  /// that have not been associated with a release. To get a list of Git tags,
  /// use the [Repository Tags
  /// API](https://docs.github.com/rest/repos/repos#list-repository-tags).
  ///
  /// Information about published releases are available to everyone. Only
  /// users with push access will receive listings for draft releases.
  Future<List<Release>> listReleases(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases'
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
      return (jsonDecode(response.body) as List)
          .map<Release>((e) => Release.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a release
  /// Users with push access to the repository can create a release.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  Future<Release> createRelease(
    String owner,
    String repo,
    ReposCreateReleaseRequest reposCreateReleaseRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/releases'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateReleaseRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Release.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a release asset
  /// To download the asset's binary content:
  ///
  /// - If within a browser, fetch the location specified in the
  /// `browser_download_url` key provided in the response.
  /// - Alternatively, set the `Accept` header of the request to
  /// [`application/octet-stream`](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).
  ///
  /// The API will either redirect the client to the location, or stream it
  /// directly if possible.
  ///   API clients should handle both a `200` or `302` response.
  Future<ReleaseAsset> getReleaseAsset(
    String owner,
    String repo,
    int assetId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/assets/{asset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{asset_id}', '$assetId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReleaseAsset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a release asset
  ///
  Future<void> deleteReleaseAsset(
    String owner,
    String repo,
    int assetId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/releases/assets/{asset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{asset_id}', '$assetId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a release asset
  /// Users with push access to the repository can edit a release asset.
  Future<ReleaseAsset> updateReleaseAsset(
    String owner,
    String repo,
    int assetId, {
    ReposUpdateReleaseAssetRequest? reposUpdateReleaseAssetRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/releases/assets/{asset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{asset_id}', '$assetId'),
      body: reposUpdateReleaseAssetRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReleaseAsset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Generate release notes content for a release
  /// Generate a name and body describing a
  /// [release](https://docs.github.com/rest/releases/releases#get-a-release).
  /// The body content will be markdown formatted and contain information like
  /// the changes since last release and users who contributed. The generated
  /// release notes are not saved anywhere. They are intended to be generated
  /// and used when creating a new release.
  Future<ReleaseNotesContent> generateReleaseNotes(
    String owner,
    String repo,
    ReposGenerateReleaseNotesRequest reposGenerateReleaseNotesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/releases/generate-notes'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposGenerateReleaseNotesRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReleaseNotesContent.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the latest release
  /// View the latest published full release for the repository.
  ///
  /// The latest release is the most recent non-prerelease, non-draft release,
  /// sorted by the `created_at` attribute. The `created_at` attribute is the
  /// date of the commit used for the release, and not the date when the
  /// release was drafted or published.
  Future<Release> getLatestRelease(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/latest'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Release.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a release by tag name
  /// Get a published release with the specified tag.
  Future<Release> getReleaseByTag(String owner, String repo, String tag) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/tags/{tag}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{tag}', Uri.encodeComponent(tag)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Release.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a release
  /// Gets a public release with the specified release ID.
  ///
  /// > [!NOTE]
  /// > This returns an `upload_url` key corresponding to the endpoint for
  /// uploading release assets. This key is a hypermedia resource. For more
  /// information, see "[Getting started with the REST
  /// API](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia)."
  Future<Release> getRelease(String owner, String repo, int releaseId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/{release_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Release.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a release
  /// Users with push access to the repository can delete a release.
  Future<void> deleteRelease(String owner, String repo, int releaseId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/releases/{release_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a release
  /// Users with push access to the repository can edit a release.
  Future<Release> updateRelease(
    String owner,
    String repo,
    int releaseId, {
    ReposUpdateReleaseRequest? reposUpdateReleaseRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/releases/{release_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
      body: reposUpdateReleaseRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Release.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List release assets
  ///
  Future<List<ReleaseAsset>> listReleaseAssets(
    String owner,
    String repo,
    int releaseId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/{release_id}/assets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ReleaseAsset>(
            (e) => ReleaseAsset.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Upload a release asset
  /// This endpoint makes use of a [Hypermedia
  /// relation](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia)
  /// to determine which URL to access. The endpoint you call to upload
  /// release assets is specific to your release. Use the `upload_url`
  /// returned in
  /// the response of the [Create a release
  /// endpoint](https://docs.github.com/rest/releases/releases#create-a-release)
  /// to upload a release asset.
  ///
  /// You need to use an HTTP client which supports
  /// [SNI](http://en.wikipedia.org/wiki/Server_Name_Indication) to make calls
  /// to this endpoint.
  ///
  /// Most libraries will set the required `Content-Length` header
  /// automatically. Use the required `Content-Type` header to provide the
  /// media type of the asset. For a list of media types, see [Media
  /// Types](https://www.iana.org/assignments/media-types/media-types.xhtml).
  /// For example:
  ///
  /// `application/zip`
  ///
  /// GitHub expects the asset data in its raw binary form, rather than JSON.
  /// You will send the raw binary content of the asset as the request body.
  /// Everything else about the endpoint is the same as the rest of the API.
  /// For example,
  /// you'll still need to pass your authentication to be able to upload an
  /// asset.
  ///
  /// When an upstream failure occurs, you will receive a `502 Bad Gateway`
  /// status. This may leave an empty asset with a state of `starter`. It can
  /// be safely deleted.
  ///
  /// **Notes:**
  /// *   GitHub renames asset filenames that have special characters,
  /// non-alphanumeric characters, and leading or trailing periods. The "[List
  /// release
  /// assets](https://docs.github.com/rest/releases/assets#list-release-assets)"
  /// endpoint lists the renamed filenames. For more information and help,
  /// contact [GitHub
  /// Support](https://support.github.com/contact?tags=dotcom-rest-api).
  /// *   To find the `release_id` query the [`GET /repos/{owner}/{repo}/releases/latest`
  /// endpoint](https://docs.github.com/rest/releases/releases#get-the-latest-release).
  ///
  /// *   If you upload an asset with the same filename as another uploaded
  /// asset, you'll receive an error and must delete the old file before you
  /// can re-upload the new asset.
  Future<ReleaseAsset> uploadReleaseAsset(
    String owner,
    String repo,
    int releaseId,
    String name, {
    String? label,
    Uint8List? uint8List,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/releases/{release_id}/assets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
      queryParameters: {
        'name': [name],
        if (label != null) 'label': [label],
      },
      body: uint8List,
      bodyContentType: BodyContentType.octetStream,
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ReleaseAsset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get rules for a branch
  /// Returns all active rules that apply to the specified branch. The branch
  /// does not need to exist; rules that would apply
  /// to a branch with that name will be returned. All active rules that apply
  /// will be returned, regardless of the level
  /// at which they are configured (e.g. repository or organization). Rules in
  /// rulesets with "evaluate" or "disabled"
  /// enforcement statuses are not returned.
  Future<List<RepositoryRuleDetailed>> getBranchRules(
    String owner,
    String repo,
    String branch, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rules/branches/{branch}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{branch}', Uri.encodeComponent(branch)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryRuleDetailed>(
            (e) => RepositoryRuleDetailed.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all repository rulesets
  /// Get all the rulesets for a repository.
  Future<List<RepositoryRuleset>> getRepoRulesets(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
    bool? includesParents = true,
    String? targets,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (includesParents != null)
          'includes_parents': [includesParents.toString()],
        if (targets != null) 'targets': [targets],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryRuleset>(
            (e) => RepositoryRuleset.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository ruleset
  /// Create a ruleset for a repository.
  Future<RepositoryRuleset> createRepoRuleset(
    String owner,
    String repo,
    ReposCreateRepoRulesetRequest reposCreateRepoRulesetRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/rulesets'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateRepoRulesetRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository rule suites
  /// Lists suites of rule evaluations at the repository level.
  /// For more information, see "[Managing rulesets for a
  /// repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets)."
  Future<List<RuleSuitesInner>> getRepoRuleSuites(
    String owner,
    String repo, {
    String? ref,
    TimePeriodParam? timePeriod = TimePeriodParam.day,
    String? actorName,
    RuleSuiteResultParam? ruleSuiteResult = RuleSuiteResultParam.all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets/rule-suites'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
        if (timePeriod != null) 'time_period': [timePeriod.toJson()],
        if (actorName != null) 'actor_name': [actorName],
        if (ruleSuiteResult != null)
          'rule_suite_result': [ruleSuiteResult.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RuleSuitesInner>(
            (e) => RuleSuitesInner.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository rule suite
  /// Gets information about a suite of rule evaluations from within a
  /// repository.
  /// For more information, see "[Managing rulesets for a
  /// repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets)."
  Future<RuleSuite> getRepoRuleSuite(
    String owner,
    String repo,
    int ruleSuiteId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{rule_suite_id}', '$ruleSuiteId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RuleSuite.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository ruleset
  /// Get a ruleset for a repository.
  ///
  /// **Note:** To prevent leaking sensitive information, the `bypass_actors`
  /// property is only returned if the user
  /// making the API request has write access to the ruleset.
  Future<RepositoryRuleset> getRepoRuleset(
    String owner,
    String repo,
    int rulesetId, {
    bool? includesParents = true,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets/{ruleset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ruleset_id}', '$rulesetId'),
      queryParameters: {
        if (includesParents != null)
          'includes_parents': [includesParents.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a repository ruleset
  /// Update a ruleset for a repository.
  Future<RepositoryRuleset> updateRepoRuleset(
    String owner,
    String repo,
    int rulesetId, {
    ReposUpdateRepoRulesetRequest? reposUpdateRepoRulesetRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/rulesets/{ruleset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ruleset_id}', '$rulesetId'),
      body: reposUpdateRepoRulesetRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryRuleset.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a repository ruleset
  /// Delete a ruleset for a repository.
  Future<void> deleteRepoRuleset(
    String owner,
    String repo,
    int rulesetId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/rulesets/{ruleset_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ruleset_id}', '$rulesetId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get repository ruleset history
  /// Get the history of a repository ruleset.
  Future<List<RulesetVersion>> getRepoRulesetHistory(
    String owner,
    String repo,
    int rulesetId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets/{ruleset_id}/history'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ruleset_id}', '$rulesetId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RulesetVersion>(
            (e) => RulesetVersion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get repository ruleset version
  /// Get a version of a repository ruleset.
  Future<RulesetVersionWithState> getRepoRulesetVersion(
    String owner,
    String repo,
    int rulesetId,
    int versionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ruleset_id}', '$rulesetId')
          .replaceAll('{version_id}', '$versionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RulesetVersionWithState.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the weekly commit activity
  /// Returns a weekly aggregate of the number of additions and deletions
  /// pushed to a repository.
  ///
  /// > [!NOTE]
  /// > This endpoint can only be used for repositories with fewer than 10,000
  /// commits. If the repository contains 10,000 or more commits, a 422 status
  /// code will be returned.
  Future<ReposGetCodeFrequencyStatsResponse> getCodeFrequencyStats(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stats/code_frequency'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposGetCodeFrequencyStatsResponse200(
        (jsonDecode(response.body) as List).cast<List<int>>(),
      ),
      202 => ReposGetCodeFrequencyStatsResponse202(jsonDecode(response.body)),
      204 => const ReposGetCodeFrequencyStatsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get the last year of commit activity
  /// Returns the last year of commit activity grouped by week. The `days`
  /// array is a group of commits per day, starting on `Sunday`.
  Future<ReposGetCommitActivityStatsResponse> getCommitActivityStats(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stats/commit_activity'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposGetCommitActivityStatsResponse200(
        (jsonDecode(response.body) as List)
            .map<CommitActivity>(
              (e) => CommitActivity.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      202 => ReposGetCommitActivityStatsResponse202(jsonDecode(response.body)),
      204 => const ReposGetCommitActivityStatsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get all contributor commit activity
  ///
  /// Returns the `total` number of commits authored by the contributor. In
  /// addition, the response includes a Weekly Hash (`weeks` array) with the
  /// following information:
  ///
  /// *   `w` - Start of the week, given as a [Unix
  /// timestamp](https://en.wikipedia.org/wiki/Unix_time).
  /// *   `a` - Number of additions
  /// *   `d` - Number of deletions
  /// *   `c` - Number of commits
  ///
  /// > [!NOTE]
  /// > This endpoint will return `0` values for all addition and deletion
  /// counts in repositories with 10,000 or more commits.
  Future<ReposGetContributorsStatsResponse> getContributorsStats(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stats/contributors'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposGetContributorsStatsResponse200(
        (jsonDecode(response.body) as List)
            .map<ContributorActivity>(
              (e) => ContributorActivity.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
      202 => ReposGetContributorsStatsResponse202(jsonDecode(response.body)),
      204 => const ReposGetContributorsStatsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Get the weekly commit count
  /// Returns the total commit counts for the `owner` and total commit counts
  /// in `all`. `all` is everyone combined, including the `owner` in the last
  /// 52 weeks. If you'd like to get the commit counts for non-owners, you can
  /// subtract `owner` from `all`.
  ///
  /// The array order is oldest week (index 0) to most recent week.
  ///
  /// The most recent week is seven days ago at UTC midnight to today at UTC
  /// midnight.
  Future<ParticipationStats> getParticipationStats(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stats/participation'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ParticipationStats.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the hourly commit count for each day
  /// Each array contains the day number, hour number, and number of commits:
  ///
  /// *   `0-6`: Sunday - Saturday
  /// *   `0-23`: Hour of day
  /// *   Number of commits
  ///
  /// For example, `[2, 14, 25]` indicates that there were 25 total commits,
  /// during the 2:00pm hour on Tuesdays. All times are based on the time zone
  /// of individual commits.
  Future<ReposGetPunchCardStatsResponse> getPunchCardStats(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/stats/punch_card'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => ReposGetPunchCardStatsResponse200(
        (jsonDecode(response.body) as List).cast<List<int>>(),
      ),
      204 => const ReposGetPunchCardStatsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Create a commit status
  /// Users with push access in a repository can create commit statuses for a
  /// given SHA.
  ///
  /// Note: there is a limit of 1000 statuses per `sha` and `context` within a
  /// repository. Attempts to create more than 1000 statuses will result in a
  /// validation error.
  Future<Status> createCommitStatus(
    String owner,
    String repo,
    String sha,
    ReposCreateCommitStatusRequest reposCreateCommitStatusRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/statuses/{sha}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{sha}', Uri.encodeComponent(sha)),
      body: reposCreateCommitStatusRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Status.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository tags
  ///
  Future<List<Tag>> listTags(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/tags'
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
      return (jsonDecode(response.body) as List)
          .map<Tag>((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Closing down - List tag protection states for a repository
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed after August 30, 2024. Use the "[Repository
  /// Rulesets](https://docs.github.com/rest/repos/rules#get-all-repository-rulesets)"
  /// endpoint instead.
  ///
  /// This returns the tag protection states of a repository.
  ///
  /// This information is only available to repository administrators.
  Future<List<TagProtection>> listTagProtection(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/tags/protection'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<TagProtection>(
            (e) => TagProtection.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Closing down - Create a tag protection state for a repository
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed after August 30, 2024. Use the "[Repository
  /// Rulesets](https://docs.github.com/rest/repos/rules#create-a-repository-ruleset)"
  /// endpoint instead.
  ///
  /// This creates a tag protection state for a repository.
  /// This endpoint is only available to repository administrators.
  Future<TagProtection> createTagProtection(
    String owner,
    String repo,
    ReposCreateTagProtectionRequest reposCreateTagProtectionRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/tags/protection'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposCreateTagProtectionRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TagProtection.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Closing down - Delete a tag protection state for a repository
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed after August 30, 2024. Use the "[Repository
  /// Rulesets](https://docs.github.com/rest/repos/rules#delete-a-repository-ruleset)"
  /// endpoint instead.
  ///
  /// This deletes a tag protection state for a repository.
  /// This endpoint is only available to repository administrators.
  Future<void> deleteTagProtection(
    String owner,
    String repo,
    int tagProtectionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/tags/protection/{tag_protection_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{tag_protection_id}', '$tagProtectionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Download a repository archive (tar)
  /// Gets a redirect URL to download a tar archive for a repository. If you
  /// omit `:ref`, the repository’s default branch (usually
  /// `main`) will be used. Please make sure your HTTP framework is configured
  /// to follow redirects or you will need to use
  /// the `Location` header to make a second `GET` request.
  ///
  /// > [!NOTE]
  /// > For private repositories, these links are temporary and expire after
  /// five minutes.
  Future<void> downloadTarballArchive(
    String owner,
    String repo,
    String ref,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/tarball/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository teams
  /// Lists the teams that have access to the specified repository and that
  /// are also visible to the authenticated user.
  ///
  /// For a public repository, a team is listed only if that team added the
  /// public repository explicitly.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `public_repo` or `repo` scope to use this endpoint with a public
  /// repository, and `repo` scope to use this endpoint with a private
  /// repository.
  Future<List<Team>> listTeams(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/teams'
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
      return (jsonDecode(response.body) as List)
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all repository topics
  ///
  Future<Topic> getAllTopics(
    String owner,
    String repo, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/topics'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Topic.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Replace all repository topics
  ///
  Future<Topic> replaceAllTopics(
    String owner,
    String repo,
    ReposReplaceAllTopicsRequest reposReplaceAllTopicsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/topics'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposReplaceAllTopicsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Topic.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get repository clones
  /// Get the total number of clones and breakdown per day or week for the
  /// last 14 days. Timestamps are aligned to UTC midnight of the beginning of
  /// the day or week. Week begins on Monday.
  Future<CloneTraffic> getClones(
    String owner,
    String repo, {
    PerParam? per = PerParam.day,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/traffic/clones'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (per != null) 'per': [per.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CloneTraffic.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get top referral paths
  /// Get the top 10 popular contents over the last 14 days.
  Future<List<ContentTraffic>> getTopPaths(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/traffic/popular/paths'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ContentTraffic>(
            (e) => ContentTraffic.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get top referral sources
  /// Get the top 10 referrers over the last 14 days.
  Future<List<ReferrerTraffic>> getTopReferrers(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/traffic/popular/referrers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ReferrerTraffic>(
            (e) => ReferrerTraffic.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get page views
  /// Get the total number of views and breakdown per day or week for the last
  /// 14 days. Timestamps are aligned to UTC midnight of the beginning of the
  /// day or week. Week begins on Monday.
  Future<ViewTraffic> getViews(
    String owner,
    String repo, {
    PerParam? per = PerParam.day,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/traffic/views'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (per != null) 'per': [per.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ViewTraffic.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Transfer a repository
  /// A transfer request will need to be accepted by the new owner when
  /// transferring a personal repository to another user. The response will
  /// contain the original `owner`, and the transfer will continue
  /// asynchronously. For more details on the requirements to transfer
  /// personal and organization-owned repositories, see [about repository
  /// transfers](https://docs.github.com/articles/about-repository-transfers/).
  Future<MinimalRepository> transfer(
    String owner,
    String repo,
    ReposTransferRequest reposTransferRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/transfer'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: reposTransferRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return MinimalRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if vulnerability alerts are enabled for a repository
  /// Shows whether dependency alerts are enabled or disabled for a
  /// repository. The authenticated user must have admin read access to the
  /// repository. For more information, see "[About security alerts for
  /// vulnerable
  /// dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)".
  Future<void> checkVulnerabilityAlerts(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/vulnerability-alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Enable vulnerability alerts
  /// Enables dependency alerts and the dependency graph for a repository. The
  /// authenticated user must have admin access to the repository. For more
  /// information, see "[About security alerts for vulnerable
  /// dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)".
  Future<void> enableVulnerabilityAlerts(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/vulnerability-alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Disable vulnerability alerts
  /// Disables dependency alerts and the dependency graph for a repository.
  /// The authenticated user must have admin access to the repository. For
  /// more information,
  /// see "[About security alerts for vulnerable
  /// dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)".
  Future<void> disableVulnerabilityAlerts(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/vulnerability-alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Download a repository archive (zip)
  /// Gets a redirect URL to download a zip archive for a repository. If you
  /// omit `:ref`, the repository’s default branch (usually
  /// `main`) will be used. Please make sure your HTTP framework is configured
  /// to follow redirects or you will need to use
  /// the `Location` header to make a second `GET` request.
  ///
  /// > [!NOTE]
  /// > For private repositories, these links are temporary and expire after
  /// five minutes. If the repository is empty, you will receive a 404 when
  /// you follow the redirect.
  Future<void> downloadZipballArchive(
    String owner,
    String repo,
    String ref,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/zipball/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Create a repository using a template
  /// Creates a new repository using a repository template. Use the
  /// `template_owner` and `template_repo` route parameters to specify the
  /// repository to use as the template. If the repository is not public, the
  /// authenticated user must own or be a member of an organization that owns
  /// the repository. To check if a repository is available to use as a
  /// template, get the repository's information using the [Get a
  /// repository](https://docs.github.com/rest/repos/repos#get-a-repository)
  /// endpoint and check that the `is_template` key is `true`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `public_repo` or `repo` scope to create a public repository, and `repo`
  /// scope to create a private repository.
  Future<FullRepository> createUsingTemplate(
    String templateOwner,
    String templateRepo,
    ReposCreateUsingTemplateRequest reposCreateUsingTemplateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{template_owner}/{template_repo}/generate'
          .replaceAll('{template_owner}', Uri.encodeComponent(templateOwner))
          .replaceAll('{template_repo}', Uri.encodeComponent(templateRepo)),
      body: reposCreateUsingTemplateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public repositories
  /// Lists all public repositories in the order that they were created.
  ///
  /// Note:
  /// - For GitHub Enterprise Server, this endpoint will only list
  /// repositories available to all users on the enterprise.
  /// - Pagination is powered exclusively by the `since` parameter. Use the
  /// [Link
  /// header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers)
  /// to get the URL for the next page of repositories.
  Future<List<MinimalRepository>> listPublic({int? since}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repositories',
      queryParameters: {
        if (since != null) 'since': [since.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repositories for the authenticated user
  /// Lists repositories that the authenticated user has explicit permission
  /// (`:read`, `:write`, or `:admin`) to access.
  ///
  /// The authenticated user has explicit permission to access repositories
  /// they own, repositories where they are a collaborator, and repositories
  /// that they can access through an organization membership.
  Future<List<Repository>> listForAuthenticatedUser({
    ReposListForAuthenticatedUserParameter0? visibility =
        ReposListForAuthenticatedUserParameter0.all,
    String? affiliation = 'owner,collaborator,organization_member',
    ReposListForAuthenticatedUserParameter2? type =
        ReposListForAuthenticatedUserParameter2.all,
    ReposListForAuthenticatedUserParameter3? sort =
        ReposListForAuthenticatedUserParameter3.fullName,
    ReposListForAuthenticatedUserParameter4? direction,
    int? perPage = 30,
    int? page = 1,
    DateTime? since,
    DateTime? before,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/repos',
      queryParameters: {
        if (visibility != null) 'visibility': [visibility.toJson()],
        if (affiliation != null) 'affiliation': [affiliation],
        if (type != null) 'type': [type.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (since != null) 'since': [since.toIso8601String()],
        if (before != null) 'before': [before.toIso8601String()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Repository>(
            (e) => Repository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository for the authenticated user
  /// Creates a new repository for the authenticated user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `public_repo` or `repo` scope to create a public repository, and `repo`
  /// scope to create a private repository.
  Future<FullRepository> createForAuthenticatedUser(
    ReposCreateForAuthenticatedUserRequest
    reposCreateForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/repos',
      body: reposCreateForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return FullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository invitations for the authenticated user
  /// When authenticating as a user, this endpoint will list all currently
  /// open repository invitations for that user.
  Future<List<RepositoryInvitation>> listInvitationsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/repository_invitations',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryInvitation>(
            (e) => RepositoryInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Decline a repository invitation
  ///
  Future<void> declineInvitationForAuthenticatedUser(int invitationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/repository_invitations/{invitation_id}'.replaceAll(
        '{invitation_id}',
        '$invitationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Accept a repository invitation
  ///
  Future<void> acceptInvitationForAuthenticatedUser(int invitationId) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/user/repository_invitations/{invitation_id}'.replaceAll(
        '{invitation_id}',
        '$invitationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories for a user
  /// Lists public repositories for the specified user.
  Future<List<MinimalRepository>> listForUser(
    String username, {
    ReposListForUserParameter1? type = ReposListForUserParameter1.owner,
    ReposListForUserParameter2? sort = ReposListForUserParameter2.fullName,
    ReposListForUserParameter3? direction,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/repos'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (type != null) 'type': [type.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
