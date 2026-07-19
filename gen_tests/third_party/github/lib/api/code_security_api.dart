// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/code_security_attach_configuration_request.dart';
import 'package:github/messages/code_security_attach_enterprise_configuration_request.dart';
import 'package:github/messages/code_security_create_configuration_for_enterprise_request.dart';
import 'package:github/messages/code_security_create_configuration_request.dart';
import 'package:github/messages/code_security_detach_configuration_request.dart';
import 'package:github/messages/code_security_set_configuration_as_default200_response.dart';
import 'package:github/messages/code_security_set_configuration_as_default_for_enterprise200_response.dart';
import 'package:github/messages/code_security_set_configuration_as_default_for_enterprise_request.dart';
import 'package:github/messages/code_security_set_configuration_as_default_request.dart';
import 'package:github/messages/code_security_update_configuration_request.dart';
import 'package:github/messages/code_security_update_enterprise_configuration_request.dart';
import 'package:github/models/code_security_configuration.dart';
import 'package:github/models/code_security_configuration_for_repository.dart';
import 'package:github/models/code_security_configuration_repositories.dart';
import 'package:github/models/code_security_default_configurations_inner.dart';
import 'package:github/models/code_security_get_configurations_for_org_parameter1.dart';
import 'package:meta/meta.dart';

sealed class CodeSecurityUpdateConfigurationResponse {
  const CodeSecurityUpdateConfigurationResponse();
}

@immutable
final class CodeSecurityUpdateConfigurationResponse200
    extends CodeSecurityUpdateConfigurationResponse {
  const CodeSecurityUpdateConfigurationResponse200(this.value);

  final CodeSecurityConfiguration value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityUpdateConfigurationResponse200 &&
        value == other.value;
  }
}

@immutable
final class CodeSecurityUpdateConfigurationResponse204
    extends CodeSecurityUpdateConfigurationResponse {
  const CodeSecurityUpdateConfigurationResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CodeSecurityUpdateConfigurationResponse204;
}

sealed class CodeSecurityGetConfigurationForRepositoryResponse {
  const CodeSecurityGetConfigurationForRepositoryResponse();
}

@immutable
final class CodeSecurityGetConfigurationForRepositoryResponse200
    extends CodeSecurityGetConfigurationForRepositoryResponse {
  const CodeSecurityGetConfigurationForRepositoryResponse200(this.value);

  final CodeSecurityConfigurationForRepository value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeSecurityGetConfigurationForRepositoryResponse200 &&
        value == other.value;
  }
}

@immutable
final class CodeSecurityGetConfigurationForRepositoryResponse204
    extends CodeSecurityGetConfigurationForRepositoryResponse {
  const CodeSecurityGetConfigurationForRepositoryResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is CodeSecurityGetConfigurationForRepositoryResponse204;
}

/// Endpoints to manage Code security using the REST API.
class CodeSecurityApi {
  CodeSecurityApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get code security configurations for an enterprise
  /// Lists all code security configurations available in an enterprise.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:enterprise` scope to use this endpoint.
  Future<List<CodeSecurityConfiguration>>
  codeSecurityGetConfigurationsForEnterprise(
    String enterprise, {
    int? perPage = 30,
    String? before,
    String? after,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/enterprises/{enterprise}/code-security/configurations'.replaceAll(
        '{enterprise}',
        Uri.encodeComponent(enterprise),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityConfiguration>(
            (e) =>
                CodeSecurityConfiguration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a code security configuration for an enterprise
  /// Creates a code security configuration in an enterprise.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:enterprise` scope to use this endpoint.
  Future<CodeSecurityConfiguration>
  codeSecurityCreateConfigurationForEnterprise(
    String enterprise,
    CodeSecurityCreateConfigurationForEnterpriseRequest
    codeSecurityCreateConfigurationForEnterpriseRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/enterprises/{enterprise}/code-security/configurations'.replaceAll(
        '{enterprise}',
        Uri.encodeComponent(enterprise),
      ),
      body: codeSecurityCreateConfigurationForEnterpriseRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecurityConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get default code security configurations for an enterprise
  /// Lists the default code security configurations for an enterprise.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:enterprise` scope to use this endpoint.
  Future<List<CodeSecurityDefaultConfigurationsInner>>
  codeSecurityGetDefaultConfigurationsForEnterprise(String enterprise) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/enterprises/{enterprise}/code-security/configurations/defaults'
          .replaceAll('{enterprise}', Uri.encodeComponent(enterprise)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityDefaultConfigurationsInner>(
            (e) => CodeSecurityDefaultConfigurationsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Retrieve a code security configuration of an enterprise
  /// Gets a code security configuration available in an enterprise.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:enterprise` scope to use this endpoint.
  Future<CodeSecurityConfiguration>
  codeSecurityGetSingleConfigurationForEnterprise(
    String enterprise,
    int configurationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecurityConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a code security configuration for an enterprise
  /// Deletes a code security configuration from an enterprise.
  /// Repositories attached to the configuration will retain their settings
  /// but will no longer be associated with
  /// the configuration.
  ///
  /// The authenticated user must be an administrator for the enterprise to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:enterprise` scope to use this endpoint.
  Future<void> codeSecurityDeleteConfigurationForEnterprise(
    String enterprise,
    int configurationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a custom code security configuration for an enterprise
  /// Updates a code security configuration in an enterprise.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:enterprise` scope to use this endpoint.
  Future<CodeSecurityConfiguration> codeSecurityUpdateEnterpriseConfiguration(
    String enterprise,
    int configurationId,
    CodeSecurityUpdateEnterpriseConfigurationRequest
    codeSecurityUpdateEnterpriseConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecurityUpdateEnterpriseConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecurityConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Attach an enterprise configuration to repositories
  /// Attaches an enterprise code security configuration to repositories. If
  /// the repositories specified are already attached to a configuration, they
  /// will be re-attached to the provided configuration.
  ///
  /// If insufficient GHAS licenses are available to attach the configuration
  /// to a repository, only free features will be enabled.
  ///
  /// The authenticated user must be an administrator for the enterprise to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:enterprise` scope to use this endpoint.
  Future<dynamic> codeSecurityAttachEnterpriseConfiguration(
    String enterprise,
    int configurationId,
    CodeSecurityAttachEnterpriseConfigurationRequest
    codeSecurityAttachEnterpriseConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}/attach'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecurityAttachEnterpriseConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set a code security configuration as a default for an enterprise
  /// Sets a code security configuration as a default to be applied to new
  /// repositories in your enterprise.
  ///
  /// This configuration will be applied by default to the matching repository
  /// type when created, but only for organizations within the enterprise that
  /// do not already have a default code security configuration set.
  ///
  /// The authenticated user must be an administrator for the enterprise to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:enterprise` scope to use this endpoint.
  Future<CodeSecuritySetConfigurationAsDefaultForEnterprise200Response>
  codeSecuritySetConfigurationAsDefaultForEnterprise(
    String enterprise,
    int configurationId,
    CodeSecuritySetConfigurationAsDefaultForEnterpriseRequest
    codeSecuritySetConfigurationAsDefaultForEnterpriseRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}/defaults'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecuritySetConfigurationAsDefaultForEnterpriseRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecuritySetConfigurationAsDefaultForEnterprise200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get repositories associated with an enterprise code security
  /// configuration
  /// Lists the repositories associated with an enterprise code security
  /// configuration in an organization.
  ///
  /// The authenticated user must be an administrator of the enterprise in
  /// order to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:enterprise` scope to use this endpoint.
  Future<List<CodeSecurityConfigurationRepositories>>
  codeSecurityGetRepositoriesForEnterpriseConfiguration(
    String enterprise,
    int configurationId, {
    int? perPage = 30,
    String? before,
    String? after,
    String? status = 'all',
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/enterprises/{enterprise}/code-security/configurations/{configuration_id}/repositories'
              .replaceAll('{enterprise}', Uri.encodeComponent(enterprise))
              .replaceAll('{configuration_id}', '$configurationId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (status != null) 'status': [status],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityConfigurationRepositories>(
            (e) => CodeSecurityConfigurationRepositories.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get code security configurations for an organization
  /// Lists all code security configurations available in an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<List<CodeSecurityConfiguration>> codeSecurityGetConfigurationsForOrg(
    String org, {
    CodeSecurityGetConfigurationsForOrgParameter1? targetType =
        CodeSecurityGetConfigurationsForOrgParameter1.all,
    int? perPage = 30,
    String? before,
    String? after,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/code-security/configurations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (targetType != null) 'target_type': [targetType.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityConfiguration>(
            (e) =>
                CodeSecurityConfiguration.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a code security configuration
  /// Creates a code security configuration in an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<CodeSecurityConfiguration> codeSecurityCreateConfiguration(
    String org,
    CodeSecurityCreateConfigurationRequest
    codeSecurityCreateConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/code-security/configurations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: codeSecurityCreateConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecurityConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get default code security configurations
  /// Lists the default code security configurations for an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<List<CodeSecurityDefaultConfigurationsInner>>
  codeSecurityGetDefaultConfigurations(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/code-security/configurations/defaults'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityDefaultConfigurationsInner>(
            (e) => CodeSecurityDefaultConfigurationsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Detach configurations from repositories
  /// Detach code security configuration(s) from a set of repositories.
  /// Repositories will retain their settings but will no longer be associated
  /// with the configuration.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<void> codeSecurityDetachConfiguration(
    String org,
    CodeSecurityDetachConfigurationRequest
    codeSecurityDetachConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/code-security/configurations/detach'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: codeSecurityDetachConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a code security configuration
  /// Gets a code security configuration available in an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<CodeSecurityConfiguration> codeSecurityGetConfiguration(
    String org,
    int configurationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/code-security/configurations/{configuration_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{configuration_id}', '$configurationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecurityConfiguration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a code security configuration
  /// Deletes the desired code security configuration from an organization.
  /// Repositories attached to the configuration will retain their settings
  /// but will no longer be associated with
  /// the configuration.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<void> codeSecurityDeleteConfiguration(
    String org,
    int configurationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/code-security/configurations/{configuration_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{configuration_id}', '$configurationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a code security configuration
  /// Updates a code security configuration in an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<CodeSecurityUpdateConfigurationResponse>
  codeSecurityUpdateConfiguration(
    String org,
    int configurationId,
    CodeSecurityUpdateConfigurationRequest
    codeSecurityUpdateConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/code-security/configurations/{configuration_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecurityUpdateConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => CodeSecurityUpdateConfigurationResponse200(
        CodeSecurityConfiguration.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const CodeSecurityUpdateConfigurationResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Attach a configuration to repositories
  /// Attach a code security configuration to a set of repositories. If the
  /// repositories specified are already attached to a configuration, they
  /// will be re-attached to the provided configuration.
  ///
  /// If insufficient GHAS licenses are available to attach the configuration
  /// to a repository, only free features will be enabled.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<dynamic> codeSecurityAttachConfiguration(
    String org,
    int configurationId,
    CodeSecurityAttachConfigurationRequest
    codeSecurityAttachConfigurationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/code-security/configurations/{configuration_id}/attach'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecurityAttachConfigurationRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set a code security configuration as a default for an organization
  /// Sets a code security configuration as a default to be applied to new
  /// repositories in your organization.
  ///
  /// This configuration will be applied to the matching repository type (all,
  /// none, public, private and internal) by default when they are created.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<CodeSecuritySetConfigurationAsDefault200Response>
  codeSecuritySetConfigurationAsDefault(
    String org,
    int configurationId,
    CodeSecuritySetConfigurationAsDefaultRequest
    codeSecuritySetConfigurationAsDefaultRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/orgs/{org}/code-security/configurations/{configuration_id}/defaults'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{configuration_id}', '$configurationId'),
      body: codeSecuritySetConfigurationAsDefaultRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeSecuritySetConfigurationAsDefault200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get repositories associated with a code security configuration
  /// Lists the repositories associated with a code security configuration in
  /// an organization.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:org` scope to use this endpoint.
  Future<List<CodeSecurityConfigurationRepositories>>
  codeSecurityGetRepositoriesForConfiguration(
    String org,
    int configurationId, {
    int? perPage = 30,
    String? before,
    String? after,
    String? status = 'all',
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/code-security/configurations/{configuration_id}/repositories'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{configuration_id}', '$configurationId'),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (status != null) 'status': [status],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeSecurityConfigurationRepositories>(
            (e) => CodeSecurityConfigurationRepositories.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the code security configuration associated with a repository
  /// Get the code security configuration that manages a repository's code
  /// security settings.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<CodeSecurityGetConfigurationForRepositoryResponse>
  codeSecurityGetConfigurationForRepository(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-security-configuration'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => CodeSecurityGetConfigurationForRepositoryResponse200(
        CodeSecurityConfigurationForRepository.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const CodeSecurityGetConfigurationForRepositoryResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }
}
