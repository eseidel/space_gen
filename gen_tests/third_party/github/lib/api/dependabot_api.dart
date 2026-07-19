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
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/dependabot_create_or_update_org_secret_request.dart';
import 'package:github/messages/dependabot_create_or_update_repo_secret_request.dart';
import 'package:github/messages/dependabot_list_org_secrets200_response.dart';
import 'package:github/messages/dependabot_list_repo_secrets200_response.dart';
import 'package:github/messages/dependabot_list_selected_repos_for_org_secret200_response.dart';
import 'package:github/messages/dependabot_set_repository_access_default_level_request.dart';
import 'package:github/messages/dependabot_set_selected_repos_for_org_secret_request.dart';
import 'package:github/messages/dependabot_update_alert_request.dart';
import 'package:github/messages/dependabot_update_repository_access_for_org_request.dart';
import 'package:github/models/alert_number.dart';
import 'package:github/models/dependabot_alert.dart';
import 'package:github/models/dependabot_alert_comma_separated_has_param.dart';
import 'package:github/models/dependabot_alert_scope_param.dart';
import 'package:github/models/dependabot_alert_sort_param.dart';
import 'package:github/models/dependabot_alert_with_repository.dart';
import 'package:github/models/dependabot_public_key.dart';
import 'package:github/models/dependabot_repository_access_details.dart';
import 'package:github/models/dependabot_secret.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/organization_dependabot_secret.dart';
import 'package:meta/meta.dart';

sealed class DependabotCreateOrUpdateOrgSecretResponse {
  const DependabotCreateOrUpdateOrgSecretResponse();
}

@immutable
final class DependabotCreateOrUpdateOrgSecretResponse201
    extends DependabotCreateOrUpdateOrgSecretResponse {
  const DependabotCreateOrUpdateOrgSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotCreateOrUpdateOrgSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class DependabotCreateOrUpdateOrgSecretResponse204
    extends DependabotCreateOrUpdateOrgSecretResponse {
  const DependabotCreateOrUpdateOrgSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is DependabotCreateOrUpdateOrgSecretResponse204;
}

sealed class DependabotCreateOrUpdateRepoSecretResponse {
  const DependabotCreateOrUpdateRepoSecretResponse();
}

@immutable
final class DependabotCreateOrUpdateRepoSecretResponse201
    extends DependabotCreateOrUpdateRepoSecretResponse {
  const DependabotCreateOrUpdateRepoSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DependabotCreateOrUpdateRepoSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class DependabotCreateOrUpdateRepoSecretResponse204
    extends DependabotCreateOrUpdateRepoSecretResponse {
  const DependabotCreateOrUpdateRepoSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is DependabotCreateOrUpdateRepoSecretResponse204;
}

/// Endpoints to manage Dependabot.
class DependabotApi {
  DependabotApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List Dependabot alerts for an enterprise
  /// Lists Dependabot alerts for repositories that are owned by the specified
  /// enterprise.
  ///
  /// The authenticated user must be a member of the enterprise to use this
  /// endpoint.
  ///
  /// Alerts are only returned for organizations in the enterprise for which
  /// you are an organization owner or a security manager. For more
  /// information about security managers, see "[Managing security managers in
  /// your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint.
  Future<List<DependabotAlertWithRepository>> listAlertsForEnterprise(
    String enterprise, {
    String? state,
    String? severity,
    String? ecosystem,
    String? package,
    String? epssPercentage,
    DependabotAlertCommaSeparatedHasParam? has,
    DependabotAlertScopeParam? scope,
    DependabotAlertSortParam? sort = DependabotAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    String? before,
    String? after,
    int? first = 30,
    int? last,
    int? perPage = 30,
  }) async {
    first?.validateMaximum(100);
    first?.validateMinimum(1);
    last?.validateMaximum(100);
    last?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/enterprises/{enterprise}/dependabot/alerts'.replaceAll(
        '{enterprise}',
        Uri.encodeComponent(enterprise),
      ),
      queryParameters: {
        if (state != null) 'state': [state],
        if (severity != null) 'severity': [severity],
        if (ecosystem != null) 'ecosystem': [ecosystem],
        if (package != null) 'package': [package],
        if (epssPercentage != null) 'epss_percentage': [epssPercentage],
        if (has != null)
          'has': switch (has) {
            DependabotAlertCommaSeparatedHasParamString(:final value) => [
              value,
            ],
            DependabotAlertCommaSeparatedHasParamList(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (scope != null) 'scope': [scope.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (first != null) 'first': [first.toString()],
        if (last != null) 'last': [last.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<DependabotAlertWithRepository>(
            (e) => DependabotAlertWithRepository.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Lists repositories that organization admins have allowed Dependabot to
  /// access when updating dependencies.
  /// > [!NOTE]
  /// >    This operation supports both server-to-server and user-to-server
  /// access.
  /// Unauthorized users will not see the existence of this endpoint.
  Future<DependabotRepositoryAccessDetails> repositoryAccessForOrg(
    String org, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    page?.validateMinimum(1);
    perPage?.validateMaximum(100);
    perPage?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/organizations/{org}/dependabot/repository-access'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotRepositoryAccessDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Updates repositories to the list of repositories that organization
  /// admins have allowed Dependabot to access when updating dependencies.
  /// > [!NOTE]
  /// >    This operation supports both server-to-server and user-to-server
  /// access.
  /// Unauthorized users will not see the existence of this endpoint.
  ///
  /// **Example request body:**
  /// ```json
  /// {
  ///   "repository_ids_to_add": [123, 456],
  ///   "repository_ids_to_remove": [789]
  /// }
  /// ```
  Future<void> updateRepositoryAccessForOrg(
    String org,
    DependabotUpdateRepositoryAccessForOrgRequest
    dependabotUpdateRepositoryAccessForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/organizations/{org}/dependabot/repository-access'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: dependabotUpdateRepositoryAccessForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Set the default repository access level for Dependabot
  /// > [!NOTE]
  /// >    This operation supports both server-to-server and user-to-server
  /// access.
  /// Sets the default level of repository access Dependabot will have while
  /// performing an update.  Available values are:
  /// - 'public' - Dependabot will only have access to public repositories,
  /// unless access is explicitly granted to non-public repositories.
  /// - 'internal' - Dependabot will only have access to public and internal
  /// repositories, unless access is explicitly granted to private
  /// repositories.
  ///
  /// Unauthorized users will not see the existence of this endpoint.
  Future<void> setRepositoryAccessDefaultLevel(
    String org,
    DependabotSetRepositoryAccessDefaultLevelRequest
    dependabotSetRepositoryAccessDefaultLevelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/organizations/{org}/dependabot/repository-access/default-level'
          .replaceAll('{org}', Uri.encodeComponent(org)),
      body: dependabotSetRepositoryAccessDefaultLevelRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List Dependabot alerts for an organization
  /// Lists Dependabot alerts for an organization.
  ///
  /// The authenticated user must be an owner or security manager for the
  /// organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<List<DependabotAlertWithRepository>> listAlertsForOrg(
    String org, {
    String? state,
    String? severity,
    String? ecosystem,
    String? package,
    String? epssPercentage,
    DependabotAlertCommaSeparatedHasParam? has,
    DependabotAlertScopeParam? scope,
    DependabotAlertSortParam? sort = DependabotAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    String? before,
    String? after,
    int? first = 30,
    int? last,
    int? perPage = 30,
  }) async {
    first?.validateMaximum(100);
    first?.validateMinimum(1);
    last?.validateMaximum(100);
    last?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/dependabot/alerts'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (state != null) 'state': [state],
        if (severity != null) 'severity': [severity],
        if (ecosystem != null) 'ecosystem': [ecosystem],
        if (package != null) 'package': [package],
        if (epssPercentage != null) 'epss_percentage': [epssPercentage],
        if (has != null)
          'has': switch (has) {
            DependabotAlertCommaSeparatedHasParamString(:final value) => [
              value,
            ],
            DependabotAlertCommaSeparatedHasParamList(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (scope != null) 'scope': [scope.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (first != null) 'first': [first.toString()],
        if (last != null) 'last': [last.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<DependabotAlertWithRepository>(
            (e) => DependabotAlertWithRepository.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization secrets
  /// Lists all secrets available in an organization without revealing their
  /// encrypted values.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<DependabotListOrgSecrets200Response> listOrgSecrets(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/dependabot/secrets'.replaceAll(
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
      return DependabotListOrgSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization public key
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<DependabotPublicKey> getOrgPublicKey(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/dependabot/secrets/public-key'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization secret
  /// Gets a single organization secret without revealing its encrypted value.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<OrganizationDependabotSecret> getOrgSecret(
    String org,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/dependabot/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrganizationDependabotSecret.fromJson(
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
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<DependabotCreateOrUpdateOrgSecretResponse> createOrUpdateOrgSecret(
    String org,
    String secretName,
    DependabotCreateOrUpdateOrgSecretRequest
    dependabotCreateOrUpdateOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/dependabot/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: dependabotCreateOrUpdateOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => DependabotCreateOrUpdateOrgSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const DependabotCreateOrUpdateOrgSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete an organization secret
  /// Deletes a secret in an organization using the secret name.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> deleteOrgSecret(String org, String secretName) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/dependabot/secrets/{secret_name}'
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
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<DependabotListSelectedReposForOrgSecret200Response>
  listSelectedReposForOrgSecret(
    String org,
    String secretName, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/dependabot/secrets/{secret_name}/repositories'
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
      return DependabotListSelectedReposForOrgSecret200Response.fromJson(
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
  /// secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setSelectedReposForOrgSecret(
    String org,
    String secretName,
    DependabotSetSelectedReposForOrgSecretRequest
    dependabotSetSelectedReposForOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/dependabot/secrets/{secret_name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: dependabotSetSelectedReposForOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add selected repository to an organization secret
  /// Adds a repository to an organization secret when the `visibility` for
  /// repository access is set to `selected`. The visibility is set when you
  /// [Create or
  /// update an organization
  /// secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> addSelectedRepoToOrgSecret(
    String org,
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}'
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
  /// secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> removeSelectedRepoFromOrgSecret(
    String org,
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List Dependabot alerts for a repository
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<List<DependabotAlert>> listAlertsForRepo(
    String owner,
    String repo, {
    String? state,
    String? severity,
    String? ecosystem,
    String? package,
    String? manifest,
    String? epssPercentage,
    DependabotAlertCommaSeparatedHasParam? has,
    DependabotAlertScopeParam? scope,
    DependabotAlertSortParam? sort = DependabotAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? page = 1,
    int? perPage = 30,
    String? before,
    String? after,
    int? first = 30,
    int? last,
  }) async {
    first?.validateMaximum(100);
    first?.validateMinimum(1);
    last?.validateMaximum(100);
    last?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/dependabot/alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (state != null) 'state': [state],
        if (severity != null) 'severity': [severity],
        if (ecosystem != null) 'ecosystem': [ecosystem],
        if (package != null) 'package': [package],
        if (manifest != null) 'manifest': [manifest],
        if (epssPercentage != null) 'epss_percentage': [epssPercentage],
        if (has != null)
          'has': switch (has) {
            DependabotAlertCommaSeparatedHasParamString(:final value) => [
              value,
            ],
            DependabotAlertCommaSeparatedHasParamList(:final value) =>
              value.map((e) => e.toJson()).toList(),
          },
        if (scope != null) 'scope': [scope.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (first != null) 'first': [first.toString()],
        if (last != null) 'last': [last.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<DependabotAlert>(
            (e) => DependabotAlert.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a Dependabot alert
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<DependabotAlert> getAlert(
    String owner,
    String repo,
    AlertNumber alertNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/dependabot/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotAlert.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a Dependabot alert
  /// The authenticated user must have access to security alerts for the
  /// repository to use this endpoint. For more information, see "[Granting
  /// access to security
  /// alerts](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository#granting-access-to-security-alerts)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<DependabotAlert> updateAlert(
    String owner,
    String repo,
    AlertNumber alertNumber,
    DependabotUpdateAlertRequest dependabotUpdateAlertRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/dependabot/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      body: dependabotUpdateAlertRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotAlert.fromJson(
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
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DependabotListRepoSecrets200Response> listRepoSecrets(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/dependabot/secrets'
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
      return DependabotListRepoSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository public key
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets. Anyone with
  /// read access
  /// to the repository can use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint if the repository is private.
  Future<DependabotPublicKey> getRepoPublicKey(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/dependabot/secrets/public-key'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository secret
  /// Gets a single repository secret without revealing its encrypted value.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DependabotSecret> getRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/dependabot/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return DependabotSecret.fromJson(
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
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<DependabotCreateOrUpdateRepoSecretResponse> createOrUpdateRepoSecret(
    String owner,
    String repo,
    String secretName,
    DependabotCreateOrUpdateRepoSecretRequest
    dependabotCreateOrUpdateRepoSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/dependabot/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: dependabotCreateOrUpdateRepoSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => DependabotCreateOrUpdateRepoSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const DependabotCreateOrUpdateRepoSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete a repository secret
  /// Deletes a secret in a repository using the secret name.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<void> deleteRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/dependabot/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
