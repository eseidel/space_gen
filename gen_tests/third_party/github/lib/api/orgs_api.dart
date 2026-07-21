// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/organization_programmatic_access_grant_request.dart';
import 'package:github/messages/orgs_convert_member_to_outside_collaborator202_response.dart';
import 'package:github/messages/orgs_convert_member_to_outside_collaborator_request.dart';
import 'package:github/messages/orgs_create_invitation_request.dart';
import 'package:github/messages/orgs_create_or_update_custom_properties_request.dart';
import 'package:github/messages/orgs_create_or_update_custom_properties_values_for_repos_request.dart';
import 'package:github/messages/orgs_create_webhook_request.dart';
import 'package:github/messages/orgs_enable_or_disable_security_product_on_all_org_repos_request.dart';
import 'package:github/messages/orgs_list_app_installations200_response.dart';
import 'package:github/messages/orgs_list_attestations200_response.dart';
import 'package:github/messages/orgs_list_attestations_bulk200_response.dart';
import 'package:github/messages/orgs_list_attestations_bulk_request.dart';
import 'package:github/messages/orgs_list_org_roles200_response.dart';
import 'package:github/messages/orgs_review_pat_grant_request_request.dart';
import 'package:github/messages/orgs_review_pat_grant_requests_in_bulk_request.dart';
import 'package:github/messages/orgs_set_membership_for_user_request.dart';
import 'package:github/messages/orgs_update_membership_for_authenticated_user_request.dart';
import 'package:github/messages/orgs_update_pat_access_request.dart';
import 'package:github/messages/orgs_update_pat_accesses_request.dart';
import 'package:github/messages/orgs_update_request.dart';
import 'package:github/messages/orgs_update_webhook_config_for_org_request.dart';
import 'package:github/messages/orgs_update_webhook_request.dart';
import 'package:github/models/api_insights_actor_type_param.dart';
import 'package:github/models/api_insights_route_stats.dart';
import 'package:github/models/api_insights_route_stats_sort_param_inner.dart';
import 'package:github/models/api_insights_sort_param_inner.dart';
import 'package:github/models/api_insights_subject_stats.dart';
import 'package:github/models/api_insights_summary_stats.dart';
import 'package:github/models/api_insights_time_stats.dart';
import 'package:github/models/api_insights_user_stats.dart';
import 'package:github/models/custom_property.dart';
import 'package:github/models/custom_property_set_payload.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/hook_delivery.dart';
import 'package:github/models/hook_delivery_item.dart';
import 'package:github/models/issue_type.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/org_hook.dart';
import 'package:github/models/org_membership.dart';
import 'package:github/models/org_repo_custom_property_values.dart';
import 'package:github/models/org_security_product_enablement_param.dart';
import 'package:github/models/organization_create_issue_type.dart';
import 'package:github/models/organization_full.dart';
import 'package:github/models/organization_invitation.dart';
import 'package:github/models/organization_programmatic_access_grant.dart';
import 'package:github/models/organization_role.dart';
import 'package:github/models/organization_simple.dart';
import 'package:github/models/organization_update_issue_type.dart';
import 'package:github/models/orgs_list_members_parameter1.dart';
import 'package:github/models/orgs_list_members_parameter2.dart';
import 'package:github/models/orgs_list_memberships_for_authenticated_user_parameter0.dart';
import 'package:github/models/orgs_list_outside_collaborators_parameter1.dart';
import 'package:github/models/orgs_list_pending_invitations_parameter3.dart';
import 'package:github/models/orgs_list_pending_invitations_parameter4.dart';
import 'package:github/models/personal_access_token_sort_param.dart';
import 'package:github/models/ruleset_version.dart';
import 'package:github/models/ruleset_version_with_state.dart';
import 'package:github/models/security_product_param.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:github/models/team_role_assignment.dart';
import 'package:github/models/team_simple.dart';
import 'package:github/models/user_role_assignment.dart';
import 'package:github/models/webhook_config.dart';
import 'package:meta/meta.dart';

sealed class OrgsConvertMemberToOutsideCollaboratorResponse {
  const OrgsConvertMemberToOutsideCollaboratorResponse();
}

@immutable
final class OrgsConvertMemberToOutsideCollaboratorResponse202
    extends OrgsConvertMemberToOutsideCollaboratorResponse {
  const OrgsConvertMemberToOutsideCollaboratorResponse202(this.value);

  final OrgsConvertMemberToOutsideCollaborator202Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsConvertMemberToOutsideCollaboratorResponse202 &&
        value == other.value;
  }
}

@immutable
final class OrgsConvertMemberToOutsideCollaboratorResponse204
    extends OrgsConvertMemberToOutsideCollaboratorResponse {
  const OrgsConvertMemberToOutsideCollaboratorResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is OrgsConvertMemberToOutsideCollaboratorResponse204;
}

/// Interact with GitHub Orgs.
class OrgsApi {
  OrgsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List organizations
  /// Lists all organizations, in the order that they were created.
  ///
  /// > [!NOTE]
  /// > Pagination is powered exclusively by the `since` parameter. Use the
  /// [Link
  /// header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers)
  /// to get the URL for the next page of organizations.
  Future<List<OrganizationSimple>> orgsList({
    int? since,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/organizations',
      queryParameters: {
        if (since != null) 'since': [since.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationSimple>(
            (e) => OrganizationSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization
  /// Gets information about an organization.
  ///
  /// When the value of `two_factor_requirement_enabled` is `true`, the
  /// organization requires all members, billing managers, outside
  /// collaborators, guest collaborators, repository collaborators, or
  /// everyone with access to any repository within the organization to enable
  /// [two-factor
  /// authentication](https://docs.github.com/articles/securing-your-account-with-two-factor-authentication-2fa/).
  ///
  /// To see the full details about an organization, the authenticated user
  /// must be an organization owner.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to see the full details about an organization.
  ///
  /// To see information about an organization's GitHub plan, GitHub Apps need
  /// the `Organization plan` permission.
  Future<OrganizationFull> orgsGet(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}'.replaceAll('{org}', Uri.encodeComponent(org)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an organization
  /// Deletes an organization and all its repositories.
  ///
  /// The organization login will be unavailable for 90 days after deletion.
  ///
  /// Please review the Terms of Service regarding account deletion before
  /// using this endpoint:
  ///
  /// https://docs.github.com/site-policy/github-terms/github-terms-of-service
  Future<dynamic> orgsDelete(String org) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}'.replaceAll('{org}', Uri.encodeComponent(org)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update an organization
  /// > [!WARNING]
  /// > **Closing down notice:** GitHub will replace and discontinue
  /// `members_allowed_repository_creation_type` in favor of more granular
  /// permissions. The new input parameters are
  /// `members_can_create_public_repositories`,
  /// `members_can_create_private_repositories` for all organizations and
  /// `members_can_create_internal_repositories` for organizations associated
  /// with an enterprise account using GitHub Enterprise Cloud or GitHub
  /// Enterprise Server 2.20+. For more information, see the [blog
  /// post](https://developer.github.com/changes/2019-12-03-internal-visibility-changes).
  ///
  /// > [!WARNING]
  /// > **Closing down notice:** Code security product enablement for new
  /// repositories through the organization API is closing down. Please use
  /// [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-organization)
  /// to set defaults instead. For more information on setting a default
  /// security configuration, see the
  /// [changelog](https://github.blog/changelog/2024-07-09-sunsetting-security-settings-defaults-parameters-in-the-organizations-rest-api/).
  ///
  /// Updates the organization's profile and member privileges.
  ///
  /// The authenticated user must be an organization owner to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` or `repo` scope to use this endpoint.
  Future<OrganizationFull> orgsUpdate(
    String org, {
    OrgsUpdateRequest? orgsUpdateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}'.replaceAll('{org}', Uri.encodeComponent(org)),
      body: orgsUpdateRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List attestations by bulk subject digests
  /// List a collection of artifact attestations associated with any entry in
  /// a list of subject digests owned by an organization.
  ///
  /// The collection of attestations returned by this endpoint is filtered
  /// according to the authenticated user's permissions; if the authenticated
  /// user cannot read a repository, the attestations associated with that
  /// repository will not be included in the response. In addition, when using
  /// a fine-grained access token the `attestations:read` permission is
  /// required.
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
  Future<OrgsListAttestationsBulk200Response> orgsListAttestationsBulk(
    String org,
    OrgsListAttestationsBulkRequest orgsListAttestationsBulkRequest, {
    int? perPage = 30,
    String? before,
    String? after,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/attestations/bulk-list'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
      },
      body: orgsListAttestationsBulkRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgsListAttestationsBulk200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List attestations
  /// List a collection of artifact attestations with a given subject digest
  /// that are associated with repositories owned by an organization.
  ///
  /// The collection of attestations returned by this endpoint is filtered
  /// according to the authenticated user's permissions; if the authenticated
  /// user cannot read a repository, the attestations associated with that
  /// repository will not be included in the response. In addition, when using
  /// a fine-grained access token the `attestations:read` permission is
  /// required.
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
  Future<OrgsListAttestations200Response> orgsListAttestations(
    String org,
    String subjectDigest, {
    int? perPage = 30,
    String? before,
    String? after,
    String? predicateType,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/attestations/{subject_digest}'
          .replaceAll('{org}', Uri.encodeComponent(org))
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
      return OrgsListAttestations200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List users blocked by an organization
  /// List the users blocked by an organization.
  Future<List<SimpleUser>> orgsListBlockedUsers(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/blocks'.replaceAll('{org}', Uri.encodeComponent(org)),
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
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a user is blocked by an organization
  /// Returns a 204 if the given user is blocked by the given organization.
  /// Returns a 404 if the organization is not blocking the user, or if the
  /// user account has been identified as spam by GitHub.
  Future<void> orgsCheckBlockedUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/blocks/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Block a user from an organization
  /// Blocks the given user on behalf of the specified organization and
  /// returns a 204. If the organization cannot block the given user a 422 is
  /// returned.
  Future<void> orgsBlockUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/blocks/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unblock a user from an organization
  /// Unblocks the given user on behalf of the specified organization.
  Future<void> orgsUnblockUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/blocks/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List failed organization invitations
  /// The return hash contains `failed_at` and `failed_reason` fields which
  /// represent the time at which the invitation failed and the reason for the
  /// failure.
  Future<List<OrganizationInvitation>> orgsListFailedInvitations(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/failed_invitations'.replaceAll(
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
      return (jsonDecode(response.body) as List)
          .map<OrganizationInvitation>(
            (e) => OrganizationInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization webhooks
  /// List webhooks for an organization.
  ///
  /// The authenticated user must be an organization owner to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<List<OrgHook>> orgsListWebhooks(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/hooks'.replaceAll('{org}', Uri.encodeComponent(org)),
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
          .map<OrgHook>((e) => OrgHook.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization webhook
  /// Create a hook that posts payloads in JSON format.
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or
  /// edit webhooks that they did not create and users cannot list, view, or
  /// edit webhooks that were created by OAuth apps.
  Future<OrgHook> orgsCreateWebhook(
    String org,
    OrgsCreateWebhookRequest orgsCreateWebhookRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/hooks'.replaceAll('{org}', Uri.encodeComponent(org)),
      body: orgsCreateWebhookRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgHook.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization webhook
  /// Returns a webhook configured in an organization. To get only the webhook
  /// `config` properties, see "[Get a webhook configuration for an
  /// organization](/rest/orgs/webhooks#get-a-webhook-configuration-for-an-organization).
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<OrgHook> orgsGetWebhook(String org, int hookId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/hooks/{hook_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgHook.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an organization webhook
  /// Delete a webhook for an organization.
  ///
  /// The authenticated user must be an organization owner to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<void> orgsDeleteWebhook(String org, int hookId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/hooks/{hook_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an organization webhook
  /// Updates a webhook configured in an organization. When you update a
  /// webhook,
  /// the `secret` will be overwritten. If you previously had a `secret` set,
  /// you must
  /// provide the same `secret` or set a new `secret` or the secret will be
  /// removed. If
  /// you are only updating individual webhook `config` properties, use
  /// "[Update a webhook
  /// configuration for an
  /// organization](/rest/orgs/webhooks#update-a-webhook-configuration-for-an-organization)".
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<OrgHook> orgsUpdateWebhook(
    String org,
    int hookId, {
    OrgsUpdateWebhookRequest? orgsUpdateWebhookRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/hooks/{hook_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hook_id}', '$hookId'),
      body: orgsUpdateWebhookRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgHook.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a webhook configuration for an organization
  /// Returns the webhook configuration for an organization. To get more
  /// information about the webhook, including the `active` state and
  /// `events`, use "[Get an organization webhook
  /// ](/rest/orgs/webhooks#get-an-organization-webhook)."
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<WebhookConfig> orgsGetWebhookConfigForOrg(
    String org,
    int hookId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/hooks/{hook_id}/config'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// Update a webhook configuration for an organization
  /// Updates the webhook configuration for an organization. To update more
  /// information about the webhook, including the `active` state and
  /// `events`, use "[Update an organization webhook
  /// ](/rest/orgs/webhooks#update-an-organization-webhook)."
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<WebhookConfig> orgsUpdateWebhookConfigForOrg(
    String org,
    int hookId, {
    OrgsUpdateWebhookConfigForOrgRequest? orgsUpdateWebhookConfigForOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/hooks/{hook_id}/config'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hook_id}', '$hookId'),
      body: orgsUpdateWebhookConfigForOrgRequest?.toJson(),
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

  /// List deliveries for an organization webhook
  /// Returns a list of webhook deliveries for a webhook configured in an
  /// organization.
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<List<HookDeliveryItem>> orgsListWebhookDeliveries(
    String org,
    int hookId, {
    int? perPage = 30,
    String? cursor,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/hooks/{hook_id}/deliveries'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// Get a webhook delivery for an organization webhook
  /// Returns a delivery for a webhook configured in an organization.
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<HookDelivery> orgsGetWebhookDelivery(
    String org,
    int hookId,
    int deliveryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// Redeliver a delivery for an organization webhook
  /// Redeliver a delivery for a webhook configured in an organization.
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<dynamic> orgsRedeliverWebhookDelivery(
    String org,
    int hookId,
    int deliveryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// Ping an organization webhook
  /// This will trigger a [ping
  /// event](https://docs.github.com/webhooks/#ping-event)
  /// to be sent to the hook.
  ///
  /// You must be an organization owner to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need
  /// `admin:org_hook` scope. OAuth apps cannot list, view, or edit
  /// webhooks that they did not create and users cannot list, view, or edit
  /// webhooks that were created by OAuth apps.
  Future<void> orgsPingWebhook(String org, int hookId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/hooks/{hook_id}/pings'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{hook_id}', '$hookId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get route stats by actor
  /// Get API request count statistics for an actor broken down by route
  /// within a specified time frame.
  Future<ApiInsightsRouteStats> apiInsightsGetRouteStatsByActor(
    String org,
    ApiInsightsActorTypeParam actorType,
    int actorId,
    String minTimestamp, {
    String? maxTimestamp,
    int? page = 1,
    int? perPage = 30,
    DirectionParam? direction = .desc,
    List<ApiInsightsRouteStatsSortParamInner>? sort,
    String? apiRouteSubstring,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/route-stats/{actor_type}/{actor_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{actor_type}', Uri.encodeComponent(actorType.toJson()))
          .replaceAll('{actor_id}', '$actorId'),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': sort.map((e) => e.toJson()).toList(),
        if (apiRouteSubstring != null)
          'api_route_substring': [apiRouteSubstring],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsRouteStats.fromJson(jsonDecode(response.body) as List);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get subject stats
  /// Get API request statistics for all subjects within an organization
  /// within a specified time frame. Subjects can be users or GitHub Apps.
  Future<ApiInsightsSubjectStats> apiInsightsGetSubjectStats(
    String org,
    String minTimestamp, {
    String? maxTimestamp,
    int? page = 1,
    int? perPage = 30,
    DirectionParam? direction = .desc,
    List<ApiInsightsSortParamInner>? sort,
    String? subjectNameSubstring,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/subject-stats'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': sort.map((e) => e.toJson()).toList(),
        if (subjectNameSubstring != null)
          'subject_name_substring': [subjectNameSubstring],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsSubjectStats.fromJson(
        jsonDecode(response.body) as List,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get summary stats
  /// Get overall statistics of API requests made within an organization by
  /// all users and apps within a specified time frame.
  Future<ApiInsightsSummaryStats> apiInsightsGetSummaryStats(
    String org,
    String minTimestamp, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/summary-stats'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsSummaryStats.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get summary stats by user
  /// Get overall statistics of API requests within the organization for a
  /// user.
  Future<ApiInsightsSummaryStats> apiInsightsGetSummaryStatsByUser(
    String org,
    String userId,
    String minTimestamp, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/summary-stats/users/{user_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{user_id}', Uri.encodeComponent(userId)),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsSummaryStats.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get summary stats by actor
  /// Get overall statistics of API requests within the organization made by a
  /// specific actor. Actors can be GitHub App installations, OAuth apps or
  /// other tokens on behalf of a user.
  Future<ApiInsightsSummaryStats> apiInsightsGetSummaryStatsByActor(
    String org,
    String minTimestamp,
    ApiInsightsActorTypeParam actorType,
    int actorId, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/summary-stats/{actor_type}/{actor_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{actor_type}', Uri.encodeComponent(actorType.toJson()))
          .replaceAll('{actor_id}', '$actorId'),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsSummaryStats.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get time stats
  /// Get the number of API requests and rate-limited requests made within an
  /// organization over a specified time period.
  Future<ApiInsightsTimeStats> apiInsightsGetTimeStats(
    String org,
    String minTimestamp,
    String timestampIncrement, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/time-stats'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        'timestamp_increment': [timestampIncrement],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsTimeStats.fromJson(jsonDecode(response.body) as List);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get time stats by user
  /// Get the number of API requests and rate-limited requests made within an
  /// organization by a specific user over a specified time period.
  Future<ApiInsightsTimeStats> apiInsightsGetTimeStatsByUser(
    String org,
    String userId,
    String minTimestamp,
    String timestampIncrement, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/time-stats/users/{user_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{user_id}', Uri.encodeComponent(userId)),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        'timestamp_increment': [timestampIncrement],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsTimeStats.fromJson(jsonDecode(response.body) as List);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get time stats by actor
  /// Get the number of API requests and rate-limited requests made within an
  /// organization by a specific actor within a specified time period.
  Future<ApiInsightsTimeStats> apiInsightsGetTimeStatsByActor(
    String org,
    ApiInsightsActorTypeParam actorType,
    int actorId,
    String minTimestamp,
    String timestampIncrement, {
    String? maxTimestamp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/time-stats/{actor_type}/{actor_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{actor_type}', Uri.encodeComponent(actorType.toJson()))
          .replaceAll('{actor_id}', '$actorId'),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        'timestamp_increment': [timestampIncrement],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsTimeStats.fromJson(jsonDecode(response.body) as List);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get user stats
  /// Get API usage statistics within an organization for a user broken down
  /// by the type of access.
  Future<ApiInsightsUserStats> apiInsightsGetUserStats(
    String org,
    String userId,
    String minTimestamp, {
    String? maxTimestamp,
    int? page = 1,
    int? perPage = 30,
    DirectionParam? direction = .desc,
    List<ApiInsightsSortParamInner>? sort,
    String? actorNameSubstring,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/insights/api/user-stats/{user_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{user_id}', Uri.encodeComponent(userId)),
      queryParameters: {
        'min_timestamp': [minTimestamp],
        if (maxTimestamp != null) 'max_timestamp': [maxTimestamp],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': sort.map((e) => e.toJson()).toList(),
        if (actorNameSubstring != null)
          'actor_name_substring': [actorNameSubstring],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiInsightsUserStats.fromJson(jsonDecode(response.body) as List);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List app installations for an organization
  /// Lists all GitHub Apps in an organization. The installation count
  /// includes
  /// all GitHub Apps installed on repositories in the organization.
  ///
  /// The authenticated user must be an organization owner to use this
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:read` scope to use this endpoint.
  Future<OrgsListAppInstallations200Response> orgsListAppInstallations(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/installations'.replaceAll(
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
      return OrgsListAppInstallations200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List pending organization invitations
  /// The return hash contains a `role` field which refers to the Organization
  /// Invitation role and will be one of the following values:
  /// `direct_member`, `admin`,
  /// `billing_manager`, or `hiring_manager`. If the invitee is not a GitHub
  /// member, the `login` field in the return hash will be `null`.
  Future<List<OrganizationInvitation>> orgsListPendingInvitations(
    String org, {
    int? perPage = 30,
    int? page = 1,
    OrgsListPendingInvitationsParameter3? role = .all,
    OrgsListPendingInvitationsParameter4? invitationSource = .all,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/invitations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (role != null) 'role': [role.toJson()],
        if (invitationSource != null)
          'invitation_source': [invitationSource.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationInvitation>(
            (e) => OrganizationInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization invitation
  /// Invite people to an organization by using their GitHub user ID or their
  /// email address. In order to create invitations in an organization, the
  /// authenticated user must be an organization owner.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  Future<OrganizationInvitation> orgsCreateInvitation(
    String org, {
    OrgsCreateInvitationRequest? orgsCreateInvitationRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/invitations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsCreateInvitationRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationInvitation.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Cancel an organization invitation
  /// Cancel an organization invitation. In order to cancel an organization
  /// invitation, the authenticated user must be an organization owner.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  Future<void> orgsCancelInvitation(String org, int invitationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/invitations/{invitation_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{invitation_id}', '$invitationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List organization invitation teams
  /// List all teams associated with an invitation. In order to see
  /// invitations in an organization, the authenticated user must be an
  /// organization owner.
  Future<List<Team>> orgsListInvitationTeams(
    String org,
    int invitationId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/invitations/{invitation_id}/teams'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{invitation_id}', '$invitationId'),
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

  /// List issue types for an organization
  /// Lists all issue types for an organization. OAuth app tokens and personal
  /// access tokens (classic) need the read:org scope to use this endpoint.
  Future<List<IssueType>> orgsListIssueTypes(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/issue-types'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<IssueType>((e) => IssueType.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create issue type for an organization
  /// Create a new issue type for an organization.
  ///
  /// You can find out more about issue types in [Managing issue types in an
  /// organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).
  ///
  /// To use this endpoint, the authenticated user must be an administrator
  /// for the organization. OAuth app tokens and
  /// personal access tokens (classic) need the `admin:org` scope to use this
  /// endpoint.
  Future<IssueType> orgsCreateIssueType(
    String org,
    OrganizationCreateIssueType organizationCreateIssueType,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/issue-types'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: organizationCreateIssueType.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueType.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update issue type for an organization
  /// Updates an issue type for an organization.
  ///
  /// You can find out more about issue types in [Managing issue types in an
  /// organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).
  ///
  /// To use this endpoint, the authenticated user must be an administrator
  /// for the organization. OAuth app tokens and
  /// personal access tokens (classic) need the `admin:org` scope to use this
  /// endpoint.
  Future<IssueType> orgsUpdateIssueType(
    String org,
    int issueTypeId,
    OrganizationUpdateIssueType organizationUpdateIssueType,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/issue-types/{issue_type_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{issue_type_id}', '$issueTypeId'),
      body: organizationUpdateIssueType.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueType.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete issue type for an organization
  /// Deletes an issue type for an organization.
  ///
  /// You can find out more about issue types in [Managing issue types in an
  /// organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).
  ///
  /// To use this endpoint, the authenticated user must be an administrator
  /// for the organization. OAuth app tokens and
  /// personal access tokens (classic) need the `admin:org` scope to use this
  /// endpoint.
  Future<void> orgsDeleteIssueType(String org, int issueTypeId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/issue-types/{issue_type_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{issue_type_id}', '$issueTypeId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List organization members
  /// List all users who are members of an organization. If the authenticated
  /// user is also a member of this organization then both concealed and
  /// public members will be returned.
  Future<List<SimpleUser>> orgsListMembers(
    String org, {
    OrgsListMembersParameter1? filter = .all,
    OrgsListMembersParameter2? role = .all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/members'.replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (filter != null) 'filter': [filter.toJson()],
        if (role != null) 'role': [role.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
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

  /// Check organization membership for a user
  /// Check if a user is, publicly or privately, a member of the organization.
  Future<void> orgsCheckMembershipForUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/members/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove an organization member
  /// Removing a user from this list will remove them from all teams and they
  /// will no longer have any access to the organization's repositories.
  Future<void> orgsRemoveMember(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/members/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get organization membership for a user
  /// In order to get a user's membership with an organization, the
  /// authenticated user must be an organization member. The `state` parameter
  /// in the response can be used to identify the user's membership status.
  Future<OrgMembership> orgsGetMembershipForUser(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set organization membership for a user
  /// Only authenticated organization owners can add a member to the
  /// organization or update the member's role.
  ///
  /// *   If the authenticated user is _adding_ a member to the organization,
  /// the invited user will receive an email inviting them to the
  /// organization. The user's [membership
  /// status](https://docs.github.com/rest/orgs/members#get-organization-membership-for-a-user)
  /// will be `pending` until they accept the invitation.
  ///
  /// *   Authenticated users can _update_ a user's membership by passing the
  /// `role` parameter. If the authenticated user changes a member's role to
  /// `admin`, the affected user will receive an email notifying them that
  /// they've been made an organization owner. If the authenticated user
  /// changes an owner's role to `member`, no email will be sent.
  ///
  /// **Rate limits**
  ///
  /// To prevent abuse, organization owners are limited to creating 50
  /// organization invitations for an organization within a 24 hour period. If
  /// the organization is more than one month old or on a paid plan, the limit
  /// is 500 invitations per 24 hour period.
  Future<OrgMembership> orgsSetMembershipForUser(
    String org,
    String username, {
    OrgsSetMembershipForUserRequest? orgsSetMembershipForUserRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: orgsSetMembershipForUserRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove organization membership for a user
  /// In order to remove a user's membership with an organization, the
  /// authenticated user must be an organization owner.
  ///
  /// If the specified user is an active member of the organization, this will
  /// remove them from the organization. If the specified user has been
  /// invited to the organization, this will cancel their invitation. The
  /// specified user will receive an email notification in both cases.
  Future<void> orgsRemoveMembershipForUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get all organization roles for an organization
  /// Lists the organization roles available in this organization. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// To use this endpoint, the authenticated user must be one of:
  ///
  /// - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permissions of
  /// `read_organization_custom_org_role` in the organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<OrgsListOrgRoles200Response> orgsListOrgRoles(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/organization-roles'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgsListOrgRoles200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove all organization roles for a team
  /// Removes all assigned organization roles from a team. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsRevokeAllOrgRolesTeam(String org, String teamSlug) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/organization-roles/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Assign an organization role to a team
  /// Assigns an organization role to a team in an organization. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsAssignTeamToOrgRole(
    String org,
    String teamSlug,
    int roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{role_id}', '$roleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove an organization role from a team
  /// Removes an organization role from a team. For more information on
  /// organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsRevokeOrgRoleTeam(
    String org,
    String teamSlug,
    int roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{role_id}', '$roleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove all organization roles for a user
  /// Revokes all assigned organization roles from a user. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsRevokeAllOrgRolesUser(String org, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/organization-roles/users/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Assign an organization role to a user
  /// Assigns an organization role to a member of an organization. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsAssignUserToOrgRole(
    String org,
    String username,
    int roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/organization-roles/users/{username}/{role_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{role_id}', '$roleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove an organization role from a user
  /// Remove an organization role from a user. For more information on
  /// organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// The authenticated user must be an administrator for the organization to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> orgsRevokeOrgRoleUser(
    String org,
    String username,
    int roleId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/organization-roles/users/{username}/{role_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{role_id}', '$roleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get an organization role
  /// Gets an organization role that is available to this organization. For
  /// more information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// To use this endpoint, the authenticated user must be one of:
  ///
  /// - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permissions of
  /// `read_organization_custom_org_role` in the organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<OrganizationRole> orgsGetOrgRole(String org, int roleId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/organization-roles/{role_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{role_id}', '$roleId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationRole.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List teams that are assigned to an organization role
  /// Lists the teams that are assigned to an organization role. For more
  /// information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// To use this endpoint, you must be an administrator for the organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<List<TeamRoleAssignment>> orgsListOrgRoleTeams(
    String org,
    int roleId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/organization-roles/{role_id}/teams'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{role_id}', '$roleId'),
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
          .map<TeamRoleAssignment>(
            (e) => TeamRoleAssignment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List users that are assigned to an organization role
  /// Lists organization members that are assigned to an organization role.
  /// For more information on organization roles, see "[Using organization
  /// roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles)."
  ///
  /// To use this endpoint, you must be an administrator for the organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<List<UserRoleAssignment>> orgsListOrgRoleUsers(
    String org,
    int roleId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/organization-roles/{role_id}/users'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{role_id}', '$roleId'),
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
          .map<UserRoleAssignment>(
            (e) => UserRoleAssignment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List outside collaborators for an organization
  /// List all users who are outside collaborators of an organization.
  Future<List<SimpleUser>> orgsListOutsideCollaborators(
    String org, {
    OrgsListOutsideCollaboratorsParameter1? filter = .all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/outside_collaborators'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
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
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Convert an organization member to outside collaborator
  /// When an organization member is converted to an outside collaborator,
  /// they'll only have access to the repositories that their current team
  /// membership allows. The user will no longer be a member of the
  /// organization. For more information, see "[Converting an organization
  /// member to an outside
  /// collaborator](https://docs.github.com/articles/converting-an-organization-member-to-an-outside-collaborator/)".
  /// Converting an organization member to an outside collaborator may be
  /// restricted by enterprise administrators. For more information, see
  /// "[Enforcing repository management policies in your
  /// enterprise](https://docs.github.com/admin/policies/enforcing-policies-for-your-enterprise/enforcing-repository-management-policies-in-your-enterprise#enforcing-a-policy-for-inviting-outside-collaborators-to-repositories)."
  Future<OrgsConvertMemberToOutsideCollaboratorResponse>
  orgsConvertMemberToOutsideCollaborator(
    String org,
    String username, {
    OrgsConvertMemberToOutsideCollaboratorRequest?
    orgsConvertMemberToOutsideCollaboratorRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/outside_collaborators/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: orgsConvertMemberToOutsideCollaboratorRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      202 => OrgsConvertMemberToOutsideCollaboratorResponse202(
        OrgsConvertMemberToOutsideCollaborator202Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const OrgsConvertMemberToOutsideCollaboratorResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Remove outside collaborator from an organization
  /// Removing a user from this list will remove them from all the
  /// organization's repositories.
  Future<void> orgsRemoveOutsideCollaborator(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/outside_collaborators/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List requests to access organization resources with fine-grained
  /// personal access tokens
  /// Lists requests from organization members to access organization
  /// resources with a fine-grained personal access token.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<List<OrganizationProgrammaticAccessGrantRequest>>
  orgsListPatGrantRequests(
    String org, {
    int? perPage = 30,
    int? page = 1,
    PersonalAccessTokenSortParam? sort = .createdAt,
    DirectionParam? direction = .desc,
    List<String>? owner,
    String? repository,
    String? permission,
    DateTime? lastUsedBefore,
    DateTime? lastUsedAfter,
    List<String>? tokenId,
  }) async {
    owner?.validate(maxItems: 10);
    tokenId?.validate(maxItems: 50);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/personal-access-token-requests'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (owner != null) 'owner': owner,
        if (repository != null) 'repository': [repository],
        if (permission != null) 'permission': [permission],
        if (lastUsedBefore != null)
          'last_used_before': [lastUsedBefore.toIso8601String()],
        if (lastUsedAfter != null)
          'last_used_after': [lastUsedAfter.toIso8601String()],
        if (tokenId != null) 'token_id': tokenId,
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationProgrammaticAccessGrantRequest>(
            (e) => OrganizationProgrammaticAccessGrantRequest.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Review requests to access organization resources with fine-grained
  /// personal access tokens
  /// Approves or denies multiple pending requests to access organization
  /// resources via a fine-grained personal access token.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<dynamic> orgsReviewPatGrantRequestsInBulk(
    String org,
    OrgsReviewPatGrantRequestsInBulkRequest
    orgsReviewPatGrantRequestsInBulkRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/personal-access-token-requests'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsReviewPatGrantRequestsInBulkRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Review a request to access organization resources with a fine-grained
  /// personal access token
  /// Approves or denies a pending request to access organization resources
  /// via a fine-grained personal access token.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<void> orgsReviewPatGrantRequest(
    String org,
    int patRequestId,
    OrgsReviewPatGrantRequestRequest orgsReviewPatGrantRequestRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/personal-access-token-requests/{pat_request_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{pat_request_id}', '$patRequestId'),
      body: orgsReviewPatGrantRequestRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories requested to be accessed by a fine-grained personal
  /// access token
  /// Lists the repositories a fine-grained personal access token request is
  /// requesting access to.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<List<MinimalRepository>> orgsListPatGrantRequestRepositories(
    String org,
    int patRequestId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{pat_request_id}', '$patRequestId'),
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
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List fine-grained personal access tokens with access to organization
  /// resources
  /// Lists approved fine-grained personal access tokens owned by organization
  /// members that can access organization resources.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<List<OrganizationProgrammaticAccessGrant>> orgsListPatGrants(
    String org, {
    int? perPage = 30,
    int? page = 1,
    PersonalAccessTokenSortParam? sort = .createdAt,
    DirectionParam? direction = .desc,
    List<String>? owner,
    String? repository,
    String? permission,
    DateTime? lastUsedBefore,
    DateTime? lastUsedAfter,
    List<String>? tokenId,
  }) async {
    owner?.validate(maxItems: 10);
    tokenId?.validate(maxItems: 50);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/personal-access-tokens'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (owner != null) 'owner': owner,
        if (repository != null) 'repository': [repository],
        if (permission != null) 'permission': [permission],
        if (lastUsedBefore != null)
          'last_used_before': [lastUsedBefore.toIso8601String()],
        if (lastUsedAfter != null)
          'last_used_after': [lastUsedAfter.toIso8601String()],
        if (tokenId != null) 'token_id': tokenId,
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationProgrammaticAccessGrant>(
            (e) => OrganizationProgrammaticAccessGrant.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the access to organization resources via fine-grained personal
  /// access tokens
  /// Updates the access organization members have to organization resources
  /// via fine-grained personal access tokens. Limited to revoking a token's
  /// existing access.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<dynamic> orgsUpdatePatAccesses(
    String org,
    OrgsUpdatePatAccessesRequest orgsUpdatePatAccessesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/personal-access-tokens'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsUpdatePatAccessesRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the access a fine-grained personal access token has to
  /// organization resources
  /// Updates the access an organization member has to organization resources
  /// via a fine-grained personal access token. Limited to revoking the
  /// token's existing access. Limited to revoking a token's existing access.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<void> orgsUpdatePatAccess(
    String org,
    int patId,
    OrgsUpdatePatAccessRequest orgsUpdatePatAccessRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/personal-access-tokens/{pat_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{pat_id}', '$patId'),
      body: orgsUpdatePatAccessRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories a fine-grained personal access token has access to
  /// Lists the repositories a fine-grained personal access token has access
  /// to.
  ///
  /// Only GitHub Apps can use this endpoint.
  Future<List<MinimalRepository>> orgsListPatGrantRepositories(
    String org,
    int patId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/personal-access-tokens/{pat_id}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{pat_id}', '$patId'),
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
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all custom properties for an organization
  /// Gets all custom properties defined for an organization.
  /// Organization members can read these properties.
  Future<List<CustomProperty>> orgsGetAllCustomProperties(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/properties/schema'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CustomProperty>(
            (e) => CustomProperty.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update custom properties for an organization
  /// Creates new or updates existing custom properties defined for an
  /// organization in a batch.
  ///
  /// If the property already exists, the existing property will be replaced
  /// with the new values.
  /// Missing optional values will fall back to default values, previous
  /// values will be overwritten.
  /// E.g. if a property exists with `values_editable_by: org_and_repo_actors`
  /// and it's updated without specifying `values_editable_by`, it will be
  /// updated to default value `org_actors`.
  ///
  /// To use this endpoint, the authenticated user must be one of:
  ///   - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permission of
  /// `custom_properties_org_definitions_manager` in the organization.
  Future<List<CustomProperty>> orgsCreateOrUpdateCustomProperties(
    String org,
    OrgsCreateOrUpdateCustomPropertiesRequest
    orgsCreateOrUpdateCustomPropertiesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/properties/schema'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsCreateOrUpdateCustomPropertiesRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CustomProperty>(
            (e) => CustomProperty.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a custom property for an organization
  /// Gets a custom property that is defined for an organization.
  /// Organization members can read these properties.
  Future<CustomProperty> orgsGetCustomProperty(
    String org,
    String customPropertyName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/properties/schema/{custom_property_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll(
            '{custom_property_name}',
            Uri.encodeComponent(customPropertyName),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CustomProperty.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update a custom property for an organization
  /// Creates a new or updates an existing custom property that is defined for
  /// an organization.
  ///
  /// To use this endpoint, the authenticated user must be one of:
  /// - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permission of
  /// `custom_properties_org_definitions_manager` in the organization.
  Future<CustomProperty> orgsCreateOrUpdateCustomProperty(
    String org,
    String customPropertyName,
    CustomPropertySetPayload customPropertySetPayload,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/properties/schema/{custom_property_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll(
            '{custom_property_name}',
            Uri.encodeComponent(customPropertyName),
          ),
      body: customPropertySetPayload.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CustomProperty.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove a custom property for an organization
  /// Removes a custom property that is defined for an organization.
  ///
  /// To use this endpoint, the authenticated user must be one of:
  ///   - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permission of
  /// `custom_properties_org_definitions_manager` in the organization.
  Future<void> orgsRemoveCustomProperty(
    String org,
    String customPropertyName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/properties/schema/{custom_property_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll(
            '{custom_property_name}',
            Uri.encodeComponent(customPropertyName),
          ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List custom property values for organization repositories
  /// Lists organization repositories with all of their custom property
  /// values.
  /// Organization members can read these properties.
  Future<List<OrgRepoCustomPropertyValues>>
  orgsListCustomPropertiesValuesForRepos(
    String org, {
    int? perPage = 30,
    int? page = 1,
    String? repositoryQuery,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/properties/values'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (repositoryQuery != null) 'repository_query': [repositoryQuery],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrgRepoCustomPropertyValues>(
            (e) =>
                OrgRepoCustomPropertyValues.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update custom property values for organization repositories
  /// Create new or update existing custom property values for repositories in
  /// a batch that belong to an organization.
  /// Each target repository will have its custom property values updated to
  /// match the values provided in the request.
  ///
  /// A maximum of 30 repositories can be updated in a single request.
  ///
  /// Using a value of `null` for a custom property will remove or 'unset' the
  /// property value from the repository.
  ///
  /// To use this endpoint, the authenticated user must be one of:
  ///   - An administrator for the organization.
  /// - A user, or a user on a team, with the fine-grained permission of
  /// `custom_properties_org_values_editor` in the organization.
  Future<void> orgsCreateOrUpdateCustomPropertiesValuesForRepos(
    String org,
    OrgsCreateOrUpdateCustomPropertiesValuesForReposRequest
    orgsCreateOrUpdateCustomPropertiesValuesForReposRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/properties/values'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsCreateOrUpdateCustomPropertiesValuesForReposRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List public organization members
  /// Members of an organization can choose to have their membership
  /// publicized or not.
  Future<List<SimpleUser>> orgsListPublicMembers(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/public_members'.replaceAll(
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
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check public organization membership for a user
  /// Check if the provided user is a public member of the organization.
  Future<void> orgsCheckPublicMembershipForUser(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/public_members/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Set public organization membership for the authenticated user
  /// The user can publicize their own membership. (A user cannot publicize
  /// the membership for another user.)
  ///
  /// Note that you'll need to set `Content-Length` to zero when calling out
  /// to this endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> orgsSetPublicMembershipForAuthenticatedUser(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/public_members/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove public organization membership for the authenticated user
  /// Removes the public membership for the authenticated user from the
  /// specified organization, unless public visibility is enforced by default.
  Future<void> orgsRemovePublicMembershipForAuthenticatedUser(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/public_members/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get organization ruleset history
  /// Get the history of an organization ruleset.
  Future<List<RulesetVersion>> orgsGetOrgRulesetHistory(
    String org,
    int rulesetId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets/{ruleset_id}/history'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// Get organization ruleset version
  /// Get a version of an organization ruleset.
  Future<RulesetVersionWithState> orgsGetOrgRulesetVersion(
    String org,
    int rulesetId,
    int versionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/rulesets/{ruleset_id}/history/{version_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
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

  /// List security manager teams
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed starting January 1, 2026. Please use the "[Organization
  /// Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints
  /// instead.
  Future<List<TeamSimple>> orgsListSecurityManagerTeams(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/security-managers'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<TeamSimple>(
            (e) => TeamSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add a security manager team
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed starting January 1, 2026. Please use the "[Organization
  /// Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints
  /// instead.
  Future<void> orgsAddSecurityManagerTeam(String org, String teamSlug) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/security-managers/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a security manager team
  /// > [!WARNING]
  /// > **Closing down notice:** This operation is closing down and will be
  /// removed starting January 1, 2026. Please use the "[Organization
  /// Roles](https://docs.github.com/rest/orgs/organization-roles)" endpoints
  /// instead.
  Future<void> orgsRemoveSecurityManagerTeam(
    String org,
    String teamSlug,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/security-managers/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Enable or disable a security feature for an organization
  /// > [!WARNING]
  /// > **Closing down notice:** The ability to enable or disable a security
  /// feature for all eligible repositories in an organization is closing
  /// down. Please use [code security
  /// configurations](https://docs.github.com/rest/code-security/configurations)
  /// instead. For more information, see the
  /// [changelog](https://github.blog/changelog/2024-07-22-deprecation-of-api-endpoint-to-enable-or-disable-a-security-feature-for-an-organization/).
  ///
  /// Enables or disables the specified security feature for all eligible
  /// repositories in an organization. For more information, see "[Managing
  /// security managers in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// The authenticated user must be an organization owner or be member of a
  /// team with the security manager role to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org`, `write:org`, or `repo` scopes to use this endpoint.
  Future<void> orgsEnableOrDisableSecurityProductOnAllOrgRepos(
    String org,
    SecurityProductParam securityProduct,
    OrgSecurityProductEnablementParam enablement, {
    OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest?
    orgsEnableOrDisableSecurityProductOnAllOrgReposRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/{security_product}/{enablement}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll(
            '{security_product}',
            Uri.encodeComponent(securityProduct.toJson()),
          )
          .replaceAll('{enablement}', Uri.encodeComponent(enablement.toJson())),
      body: orgsEnableOrDisableSecurityProductOnAllOrgReposRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List organization memberships for the authenticated user
  /// Lists all of the authenticated user's organization memberships.
  Future<List<OrgMembership>> orgsListMembershipsForAuthenticatedUser({
    OrgsListMembershipsForAuthenticatedUserParameter0? state,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/memberships/orgs',
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrgMembership>(
            (e) => OrgMembership.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization membership for the authenticated user
  /// If the authenticated user is an active or pending member of the
  /// organization, this endpoint will return the user's membership. If the
  /// authenticated user is not affiliated with the organization, a `404` is
  /// returned. This endpoint will return a `403` if the request is made by a
  /// GitHub App that is blocked by the organization.
  Future<OrgMembership> orgsGetMembershipForAuthenticatedUser(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/memberships/orgs/{org}'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update an organization membership for the authenticated user
  /// Converts the authenticated user to an active member of the organization,
  /// if that user has a pending invitation from the organization.
  Future<OrgMembership> orgsUpdateMembershipForAuthenticatedUser(
    String org,
    OrgsUpdateMembershipForAuthenticatedUserRequest
    orgsUpdateMembershipForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/user/memberships/orgs/{org}'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: orgsUpdateMembershipForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organizations for the authenticated user
  /// List organizations for the authenticated user.
  ///
  /// For OAuth app tokens and personal access tokens (classic), this endpoint
  /// only lists organizations that your authorization allows you to operate
  /// on in some way (e.g., you can list teams with `read:org` scope, you can
  /// publicize your organization membership with `user` scope, etc.).
  /// Therefore, this API requires at least `user` or `read:org` scope for
  /// OAuth app tokens and personal access tokens (classic). Requests with
  /// insufficient scope will receive a `403 Forbidden` response.
  ///
  /// > [!NOTE]
  /// > Requests using a fine-grained access token will receive a `200 Success`
  /// response with an empty list.
  Future<List<OrganizationSimple>> orgsListForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/orgs',
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
          .map<OrganizationSimple>(
            (e) => OrganizationSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organizations for a user
  /// List [public organization
  /// memberships](https://docs.github.com/articles/publicizing-or-concealing-organization-membership)
  /// for the specified user.
  ///
  /// This method only lists _public_ memberships, regardless of
  /// authentication. If you need to fetch all of the organization memberships
  /// (public and private) for the authenticated user, use the [List
  /// organizations for the authenticated
  /// user](https://docs.github.com/rest/orgs/orgs#list-organizations-for-the-authenticated-user)
  /// API instead.
  Future<List<OrganizationSimple>> orgsListForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/orgs'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
      return (jsonDecode(response.body) as List)
          .map<OrganizationSimple>(
            (e) => OrganizationSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
