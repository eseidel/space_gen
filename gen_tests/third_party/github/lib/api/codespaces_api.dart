// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/codespaces_codespace_machines_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_create_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_create_or_update_org_secret_request.dart';
import 'package:github/messages/codespaces_create_or_update_repo_secret_request.dart';
import 'package:github/messages/codespaces_create_or_update_secret_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_create_with_pr_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_create_with_repo_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_delete_codespaces_access_users_request.dart';
import 'package:github/messages/codespaces_get_codespaces_for_user_in_org200_response.dart';
import 'package:github/messages/codespaces_list_devcontainers_in_repository_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_list_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_list_in_organization200_response.dart';
import 'package:github/messages/codespaces_list_in_repository_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_list_org_secrets200_response.dart';
import 'package:github/messages/codespaces_list_repo_secrets200_response.dart';
import 'package:github/messages/codespaces_list_repositories_for_secret_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_list_secrets_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_list_selected_repos_for_org_secret200_response.dart';
import 'package:github/messages/codespaces_pre_flight_with_repo_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_publish_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_repo_machines_for_authenticated_user200_response.dart';
import 'package:github/messages/codespaces_set_codespaces_access_request.dart';
import 'package:github/messages/codespaces_set_codespaces_access_users_request.dart';
import 'package:github/messages/codespaces_set_repositories_for_secret_for_authenticated_user_request.dart';
import 'package:github/messages/codespaces_set_selected_repos_for_org_secret_request.dart';
import 'package:github/messages/codespaces_update_for_authenticated_user_request.dart';
import 'package:github/models/codespace.dart';
import 'package:github/models/codespace_export_details.dart';
import 'package:github/models/codespace_with_full_repository.dart';
import 'package:github/models/codespaces_org_secret.dart';
import 'package:github/models/codespaces_permissions_check_for_devcontainer.dart';
import 'package:github/models/codespaces_public_key.dart';
import 'package:github/models/codespaces_secret.dart';
import 'package:github/models/codespaces_user_public_key.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/repo_codespaces_secret.dart';
import 'package:meta/meta.dart';

sealed class CodespacesCreateOrUpdateOrgSecretResponse {
  const CodespacesCreateOrUpdateOrgSecretResponse();
}

@immutable
final class CodespacesCreateOrUpdateOrgSecretResponse201
    extends CodespacesCreateOrUpdateOrgSecretResponse {
  const CodespacesCreateOrUpdateOrgSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateOrUpdateOrgSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class CodespacesCreateOrUpdateOrgSecretResponse204
    extends CodespacesCreateOrUpdateOrgSecretResponse {
  const CodespacesCreateOrUpdateOrgSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CodespacesCreateOrUpdateOrgSecretResponse204;
}

sealed class CodespacesCreateOrUpdateRepoSecretResponse {
  const CodespacesCreateOrUpdateRepoSecretResponse();
}

@immutable
final class CodespacesCreateOrUpdateRepoSecretResponse201
    extends CodespacesCreateOrUpdateRepoSecretResponse {
  const CodespacesCreateOrUpdateRepoSecretResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateOrUpdateRepoSecretResponse201 &&
        value == other.value;
  }
}

@immutable
final class CodespacesCreateOrUpdateRepoSecretResponse204
    extends CodespacesCreateOrUpdateRepoSecretResponse {
  const CodespacesCreateOrUpdateRepoSecretResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CodespacesCreateOrUpdateRepoSecretResponse204;
}

sealed class CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse();
}

@immutable
final class CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse201
    extends CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse201(
    this.value,
  );

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse201 &&
        value == other.value;
  }
}

@immutable
final class CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse204
    extends CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse {
  const CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse204;
}

/// Endpoints to manage Codespaces using the REST API.
class CodespacesApi {
  CodespacesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List codespaces for the organization
  /// Lists the codespaces associated to a specified organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesListInOrganization200Response> listInOrganization(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/codespaces'.replaceAll(
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
      return CodespacesListInOrganization200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Manage access control for organization codespaces
  /// Sets which users can access codespaces in an organization. This is
  /// synonymous with granting or revoking codespaces access permissions for
  /// users according to the visibility.
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setCodespacesAccess(
    String org,
    CodespacesSetCodespacesAccessRequest codespacesSetCodespacesAccessRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/codespaces/access'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: codespacesSetCodespacesAccessRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add users to Codespaces access for an organization
  /// Codespaces for the specified users will be billed to the organization.
  ///
  /// To use this endpoint, the access settings for the organization must be
  /// set to `selected_members`.
  /// For information on how to change this setting, see "[Manage access
  /// control for organization
  /// codespaces](https://docs.github.com/rest/codespaces/organizations#manage-access-control-for-organization-codespaces)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setCodespacesAccessUsers(
    String org,
    CodespacesSetCodespacesAccessUsersRequest
    codespacesSetCodespacesAccessUsersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/codespaces/access/selected_users'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: codespacesSetCodespacesAccessUsersRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove users from Codespaces access for an organization
  /// Codespaces for the specified users will no longer be billed to the
  /// organization.
  ///
  /// To use this endpoint, the access settings for the organization must be
  /// set to `selected_members`.
  /// For information on how to change this setting, see "[Manage access
  /// control for organization
  /// codespaces](https://docs.github.com/rest/codespaces/organizations#manage-access-control-for-organization-codespaces)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> deleteCodespacesAccessUsers(
    String org,
    CodespacesDeleteCodespacesAccessUsersRequest
    codespacesDeleteCodespacesAccessUsersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/codespaces/access/selected_users'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: codespacesDeleteCodespacesAccessUsersRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List organization secrets
  /// Lists all Codespaces development environment secrets available at the
  /// organization-level without revealing their encrypted
  /// values.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesListOrgSecrets200Response> listOrgSecrets(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/codespaces/secrets'.replaceAll(
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
      return CodespacesListOrgSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization public key
  /// Gets a public key for an organization, which is required in order to
  /// encrypt secrets. You need to encrypt the value of a secret before you
  /// can create or update secrets.
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesPublicKey> getOrgPublicKey(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/codespaces/secrets/public-key'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization secret
  /// Gets an organization development environment secret without revealing
  /// its encrypted value.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesOrgSecret> getOrgSecret(
    String org,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/codespaces/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesOrgSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update an organization secret
  /// Creates or updates an organization development environment secret with
  /// an encrypted value. Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesCreateOrUpdateOrgSecretResponse> createOrUpdateOrgSecret(
    String org,
    String secretName,
    CodespacesCreateOrUpdateOrgSecretRequest
    codespacesCreateOrUpdateOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/codespaces/secrets/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: codespacesCreateOrUpdateOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => CodespacesCreateOrUpdateOrgSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const CodespacesCreateOrUpdateOrgSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete an organization secret
  /// Deletes an organization development environment secret using the secret
  /// name.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> deleteOrgSecret(String org, String secretName) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/codespaces/secrets/{secret_name}'
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
  Future<CodespacesListSelectedReposForOrgSecret200Response>
  listSelectedReposForOrgSecret(
    String org,
    String secretName, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/codespaces/secrets/{secret_name}/repositories'
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
      return CodespacesListSelectedReposForOrgSecret200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set selected repositories for an organization secret
  /// Replaces all repositories for an organization development environment
  /// secret when the `visibility`
  /// for repository access is set to `selected`. The visibility is set when
  /// you [Create
  /// or update an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> setSelectedReposForOrgSecret(
    String org,
    String secretName,
    CodespacesSetSelectedReposForOrgSecretRequest
    codespacesSetSelectedReposForOrgSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/codespaces/secrets/{secret_name}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: codespacesSetSelectedReposForOrgSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add selected repository to an organization secret
  /// Adds a repository to an organization development environment secret when
  /// the `visibility` for repository access is set to `selected`. The
  /// visibility is set when you [Create or update an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).
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
          '/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove selected repository from an organization secret
  /// Removes a repository from an organization development environment secret
  /// when the `visibility`
  /// for repository access is set to `selected`. The visibility is set when
  /// you [Create
  /// or update an organization
  /// secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).
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
          '/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List codespaces for a user in organization
  /// Lists the codespaces that a member of an organization has for
  /// repositories in that organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<CodespacesGetCodespacesForUserInOrg200Response>
  getCodespacesForUserInOrg(
    String org,
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/members/{username}/codespaces'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesGetCodespacesForUserInOrg200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a codespace from the organization
  /// Deletes a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<dynamic> deleteFromOrganization(
    String org,
    String username,
    String codespaceName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/members/{username}/codespaces/{codespace_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{codespace_name}', Uri.encodeComponent(codespaceName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Stop a codespace for an organization user
  /// Stops a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<Codespace> stopInOrganization(
    String org,
    String username,
    String codespaceName,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/members/{username}/codespaces/{codespace_name}/stop'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{codespace_name}', Uri.encodeComponent(codespaceName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List codespaces in a repository for the authenticated user
  /// Lists the codespaces associated to a specified repository and the
  /// authenticated user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesListInRepositoryForAuthenticatedUser200Response>
  listInRepositoryForAuthenticatedUser(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces'
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
      return CodespacesListInRepositoryForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a codespace in a repository
  /// Creates a codespace owned by the authenticated user in the specified
  /// repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> createWithRepoForAuthenticatedUser(
    String owner,
    String repo,
    CodespacesCreateWithRepoForAuthenticatedUserRequest
    codespacesCreateWithRepoForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/codespaces'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: codespacesCreateWithRepoForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List devcontainer configurations in a repository for the authenticated
  /// user
  /// Lists the devcontainer.json files associated with a specified repository
  /// and the authenticated user. These files
  /// specify launchpoint configurations for codespaces created within the
  /// repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response>
  listDevcontainersInRepositoryForAuthenticatedUser(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/devcontainers'
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
      return CodespacesListDevcontainersInRepositoryForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List available machine types for a repository
  /// List the machine types available for a given repository based on its
  /// configuration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesRepoMachinesForAuthenticatedUser200Response>
  repoMachinesForAuthenticatedUser(
    String owner,
    String repo, {
    String? location,
    String? clientIp,
    String? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/machines'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (location != null) 'location': [location],
        if (clientIp != null) 'client_ip': [clientIp],
        if (ref != null) 'ref': [ref],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesRepoMachinesForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get default attributes for a codespace
  /// Gets the default attributes for codespaces created by the user with the
  /// repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesPreFlightWithRepoForAuthenticatedUser200Response>
  preFlightWithRepoForAuthenticatedUser(
    String owner,
    String repo, {
    String? ref,
    String? clientIp,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/new'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (ref != null) 'ref': [ref],
        if (clientIp != null) 'client_ip': [clientIp],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesPreFlightWithRepoForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if permissions defined by a devcontainer have been accepted by the
  /// authenticated user
  /// Checks whether the permissions defined by a given devcontainer
  /// configuration have been accepted by the authenticated user.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesPermissionsCheckForDevcontainer>
  checkPermissionsForDevcontainer(
    String owner,
    String repo,
    String ref,
    String devcontainerPath,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/permissions_check'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        'ref': [ref],
        'devcontainer_path': [devcontainerPath],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesPermissionsCheckForDevcontainer.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository secrets
  /// Lists all development environment secrets available in a repository
  /// without revealing their encrypted
  /// values.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<CodespacesListRepoSecrets200Response> listRepoSecrets(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/secrets'
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
      return CodespacesListRepoSecrets200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository public key
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets.
  ///
  /// If the repository is private, OAuth app tokens and personal access
  /// tokens (classic) need the `repo` scope to use this endpoint.
  Future<CodespacesPublicKey> getRepoPublicKey(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/secrets/public-key'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository secret
  /// Gets a single repository development environment secret without
  /// revealing its encrypted value.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<RepoCodespacesSecret> getRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/codespaces/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepoCodespacesSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update a repository secret
  /// Creates or updates a repository development environment secret with an
  /// encrypted value. Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint. The associated user must be a repository
  /// admin.
  Future<CodespacesCreateOrUpdateRepoSecretResponse> createOrUpdateRepoSecret(
    String owner,
    String repo,
    String secretName,
    CodespacesCreateOrUpdateRepoSecretRequest
    codespacesCreateOrUpdateRepoSecretRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/codespaces/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: codespacesCreateOrUpdateRepoSecretRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => CodespacesCreateOrUpdateRepoSecretResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const CodespacesCreateOrUpdateRepoSecretResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete a repository secret
  /// Deletes a development environment secret in a repository using the
  /// secret name.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint. The associated user must be a repository
  /// admin.
  Future<void> deleteRepoSecret(
    String owner,
    String repo,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/codespaces/secrets/{secret_name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Create a codespace from a pull request
  /// Creates a codespace owned by the authenticated user for the specified
  /// pull request.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> createWithPrForAuthenticatedUser(
    String owner,
    String repo,
    int pullNumber,
    CodespacesCreateWithPrForAuthenticatedUserRequest
    codespacesCreateWithPrForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/codespaces'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: codespacesCreateWithPrForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List codespaces for the authenticated user
  /// Lists the authenticated user's codespaces.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesListForAuthenticatedUser200Response>
  listForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
    int? repositoryId,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (repositoryId != null) 'repository_id': [repositoryId.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesListForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a codespace for the authenticated user
  /// Creates a new codespace, owned by the authenticated user.
  ///
  /// This endpoint requires either a `repository_id` OR a `pull_request` but
  /// not both.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> createForAuthenticatedUser(
    CodespacesCreateForAuthenticatedUserRequest
    codespacesCreateForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/codespaces',
      body: codespacesCreateForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List secrets for the authenticated user
  /// Lists all development environment secrets available for a user's
  /// codespaces without revealing their
  /// encrypted values.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<CodespacesListSecretsForAuthenticatedUser200Response>
  listSecretsForAuthenticatedUser({int? perPage = 30, int? page = 1}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/secrets',
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesListSecretsForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get public key for the authenticated user
  /// Gets your public key, which you need to encrypt secrets. You need to
  /// encrypt a secret before you can create or update secrets.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<CodespacesUserPublicKey> getPublicKeyForAuthenticatedUser() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/secrets/public-key',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesUserPublicKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a secret for the authenticated user
  /// Gets a development environment secret available to a user's codespaces
  /// without revealing its encrypted value.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<CodespacesSecret> getSecretForAuthenticatedUser(
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/secrets/{secret_name}'.replaceAll(
        '{secret_name}',
        Uri.encodeComponent(secretName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesSecret.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create or update a secret for the authenticated user
  /// Creates or updates a development environment secret for a user's
  /// codespace with an encrypted value. Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse>
  createOrUpdateSecretForAuthenticatedUser(
    String secretName,
    CodespacesCreateOrUpdateSecretForAuthenticatedUserRequest
    codespacesCreateOrUpdateSecretForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/codespaces/secrets/{secret_name}'.replaceAll(
        '{secret_name}',
        Uri.encodeComponent(secretName),
      ),
      body: codespacesCreateOrUpdateSecretForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      201 => CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 =>
        const CodespacesCreateOrUpdateSecretForAuthenticatedUserResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Delete a secret for the authenticated user
  /// Deletes a development environment secret from a user's codespaces using
  /// the secret name. Deleting the secret will remove access from all
  /// codespaces that were allowed to access the secret.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<void> deleteSecretForAuthenticatedUser(String secretName) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/codespaces/secrets/{secret_name}'.replaceAll(
        '{secret_name}',
        Uri.encodeComponent(secretName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List selected repositories for a user secret
  /// List the repositories that have been granted the ability to use a user's
  /// development environment secret.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<CodespacesListRepositoriesForSecretForAuthenticatedUser200Response>
  listRepositoriesForSecretForAuthenticatedUser(String secretName) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/secrets/{secret_name}/repositories'.replaceAll(
        '{secret_name}',
        Uri.encodeComponent(secretName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesListRepositoriesForSecretForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set selected repositories for a user secret
  /// Select the repositories that will use a user's development environment
  /// secret.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<void> setRepositoriesForSecretForAuthenticatedUser(
    String secretName,
    CodespacesSetRepositoriesForSecretForAuthenticatedUserRequest
    codespacesSetRepositoriesForSecretForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/codespaces/secrets/{secret_name}/repositories'.replaceAll(
        '{secret_name}',
        Uri.encodeComponent(secretName),
      ),
      body: codespacesSetRepositoriesForSecretForAuthenticatedUserRequest
          .toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add a selected repository to a user secret
  /// Adds a repository to the selected repositories for a user's development
  /// environment secret.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<void> addRepositoryForSecretForAuthenticatedUser(
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/user/codespaces/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a selected repository from a user secret
  /// Removes a repository from the selected repositories for a user's
  /// development environment secret.
  ///
  /// The authenticated user must have Codespaces access to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` or `codespace:secrets` scope to use this endpoint.
  Future<void> removeRepositoryForSecretForAuthenticatedUser(
    String secretName,
    int repositoryId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/user/codespaces/secrets/{secret_name}/repositories/{repository_id}'
              .replaceAll('{secret_name}', Uri.encodeComponent(secretName))
              .replaceAll('{repository_id}', '$repositoryId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a codespace for the authenticated user
  /// Gets information about a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> getForAuthenticatedUser(String codespaceName) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/{codespace_name}'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a codespace for the authenticated user
  /// Deletes a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<dynamic> deleteForAuthenticatedUser(String codespaceName) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/codespaces/{codespace_name}'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a codespace for the authenticated user
  /// Updates a codespace owned by the authenticated user. Currently only the
  /// codespace's machine type and recent folders can be modified using this
  /// endpoint.
  ///
  /// If you specify a new machine type it will be applied the next time your
  /// codespace is started.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> updateForAuthenticatedUser(
    String codespaceName, {
    CodespacesUpdateForAuthenticatedUserRequest?
    codespacesUpdateForAuthenticatedUserRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/user/codespaces/{codespace_name}'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
      body: codespacesUpdateForAuthenticatedUserRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Export a codespace for the authenticated user
  /// Triggers an export of the specified codespace and returns a URL and ID
  /// where the status of the export can be monitored.
  ///
  /// If changes cannot be pushed to the codespace's repository, they will be
  /// pushed to a new or previously-existing fork instead.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespaceExportDetails> exportForAuthenticatedUser(
    String codespaceName,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/codespaces/{codespace_name}/exports'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespaceExportDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get details about a codespace export
  /// Gets information about an export of a codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespaceExportDetails> getExportDetailsForAuthenticatedUser(
    String codespaceName,
    String exportId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/{codespace_name}/exports/{export_id}'
          .replaceAll('{codespace_name}', Uri.encodeComponent(codespaceName))
          .replaceAll('{export_id}', Uri.encodeComponent(exportId)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespaceExportDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List machine types for a codespace
  /// List the machine types a codespace can transition to use.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespacesCodespaceMachinesForAuthenticatedUser200Response>
  codespaceMachinesForAuthenticatedUser(String codespaceName) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/codespaces/{codespace_name}/machines'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespacesCodespaceMachinesForAuthenticatedUser200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository from an unpublished codespace
  /// Publishes an unpublished codespace, creating a new repository and
  /// assigning it to the codespace.
  ///
  /// The codespace's token is granted write permissions to the repository,
  /// allowing the user to push their changes.
  ///
  /// This will fail for a codespace that is already published, meaning it has
  /// an associated repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<CodespaceWithFullRepository> publishForAuthenticatedUser(
    String codespaceName,
    CodespacesPublishForAuthenticatedUserRequest
    codespacesPublishForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/codespaces/{codespace_name}/publish'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
      body: codespacesPublishForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodespaceWithFullRepository.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Start a codespace for the authenticated user
  /// Starts a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> startForAuthenticatedUser(String codespaceName) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/codespaces/{codespace_name}/start'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Stop a codespace for the authenticated user
  /// Stops a user's codespace.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `codespace` scope to use this endpoint.
  Future<Codespace> stopForAuthenticatedUser(String codespaceName) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/codespaces/{codespace_name}/stop'.replaceAll(
        '{codespace_name}',
        Uri.encodeComponent(codespaceName),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Codespace.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
