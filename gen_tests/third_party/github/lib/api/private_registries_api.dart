// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/private_registries_create_org_private_registry_request.dart';
import 'package:github/messages/private_registries_get_org_public_key200_response.dart';
import 'package:github/messages/private_registries_list_org_private_registries200_response.dart';
import 'package:github/messages/private_registries_update_org_private_registry_request.dart';
import 'package:github/models/org_private_registry_configuration.dart';
import 'package:github/models/org_private_registry_configuration_with_selected_repositories.dart';

/// Manage private registry configurations.
class PrivateRegistriesApi {
  PrivateRegistriesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List private registries for an organization
  ///
  /// Lists all private registry configurations available at the
  /// organization-level without revealing their encrypted
  /// values.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<PrivateRegistriesListOrgPrivateRegistries200Response>
  privateRegistriesListOrgPrivateRegistries(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/private-registries'.replaceAll(
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
      return PrivateRegistriesListOrgPrivateRegistries200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a private registry for an organization
  ///
  /// Creates a private registry configuration with an encrypted value for an
  /// organization. Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<OrgPrivateRegistryConfigurationWithSelectedRepositories>
  privateRegistriesCreateOrgPrivateRegistry(
    String org,
    PrivateRegistriesCreateOrgPrivateRegistryRequest
    privateRegistriesCreateOrgPrivateRegistryRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/private-registries'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: privateRegistriesCreateOrgPrivateRegistryRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgPrivateRegistryConfigurationWithSelectedRepositories.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get private registries public key for an organization
  ///
  /// Gets the org public key, which is needed to encrypt private registry
  /// secrets. You need to encrypt a secret before you can create or update
  /// secrets.
  ///
  /// OAuth tokens and personal access tokens (classic) need the `admin:org`
  /// scope to use this endpoint.
  Future<PrivateRegistriesGetOrgPublicKey200Response>
  privateRegistriesGetOrgPublicKey(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/private-registries/public-key'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PrivateRegistriesGetOrgPublicKey200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a private registry for an organization
  ///
  /// Get the configuration of a single private registry defined for an
  /// organization, omitting its encrypted value.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<OrgPrivateRegistryConfiguration>
  privateRegistriesGetOrgPrivateRegistry(String org, String secretName) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/private-registries/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return OrgPrivateRegistryConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a private registry for an organization
  ///
  /// Delete a private registry configuration at the organization-level.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> privateRegistriesDeleteOrgPrivateRegistry(
    String org,
    String secretName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/private-registries/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a private registry for an organization
  ///
  /// Updates a private registry configuration with an encrypted value for an
  /// organization. Encrypt your secret using
  /// [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages).
  /// For more information, see "[Encrypting secrets for the REST
  /// API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:org` scope to use this endpoint.
  Future<void> privateRegistriesUpdateOrgPrivateRegistry(
    String org,
    String secretName,
    PrivateRegistriesUpdateOrgPrivateRegistryRequest
    privateRegistriesUpdateOrgPrivateRegistryRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/private-registries/{secret_name}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{secret_name}', Uri.encodeComponent(secretName)),
      body: privateRegistriesUpdateOrgPrivateRegistryRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
