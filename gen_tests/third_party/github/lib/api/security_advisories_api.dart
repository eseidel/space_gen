// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/full_repository.dart';
import 'package:github/models/global_advisory.dart';
import 'package:github/models/private_vulnerability_report_create.dart';
import 'package:github/models/repository_advisory.dart';
import 'package:github/models/repository_advisory_create.dart';
import 'package:github/models/repository_advisory_update.dart';
import 'package:github/models/security_advisories_list_global_advisories_parameter1.dart';
import 'package:github/models/security_advisories_list_global_advisories_parameter17.dart';
import 'package:github/models/security_advisories_list_global_advisories_parameter4.dart';
import 'package:github/models/security_advisories_list_global_advisories_parameter5.dart';
import 'package:github/models/security_advisories_list_global_advisories_parameter7.dart';
import 'package:github/models/security_advisories_list_org_repository_advisories_parameter2.dart';
import 'package:github/models/security_advisories_list_org_repository_advisories_parameter6.dart';
import 'package:github/models/security_advisories_list_repository_advisories_parameter3.dart';
import 'package:github/models/security_advisories_list_repository_advisories_parameter7.dart';
import 'package:github/models/security_advisory_ecosystems.dart';

/// Manage security advisories.
class SecurityAdvisoriesApi {
  SecurityAdvisoriesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List global security advisories
  /// Lists all global security advisories that match the specified
  /// parameters. If no other parameters are defined, the request will return
  /// only GitHub-reviewed advisories that are not malware.
  ///
  /// By default, all responses will exclude advisories for malware, because
  /// malware are not standard vulnerabilities. To list advisories for
  /// malware, you must include the `type` parameter in your request, with the
  /// value `malware`. For more information about the different types of
  /// security advisories, see "[About the GitHub Advisory
  /// database](https://docs.github.com/code-security/security-advisories/global-security-advisories/about-the-github-advisory-database#about-types-of-security-advisories)."
  Future<List<GlobalAdvisory>> securityAdvisoriesListGlobalAdvisories({
    String? ghsaId,
    SecurityAdvisoriesListGlobalAdvisoriesParameter1? type =
        SecurityAdvisoriesListGlobalAdvisoriesParameter1.reviewed,
    String? cveId,
    SecurityAdvisoryEcosystems? ecosystem,
    SecurityAdvisoriesListGlobalAdvisoriesParameter4? severity,
    SecurityAdvisoriesListGlobalAdvisoriesParameter5? cwes,
    bool? isWithdrawn,
    SecurityAdvisoriesListGlobalAdvisoriesParameter7? affects,
    String? published,
    String? updated,
    String? modified,
    String? epssPercentage,
    String? epssPercentile,
    String? before,
    String? after,
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    SecurityAdvisoriesListGlobalAdvisoriesParameter17? sort =
        SecurityAdvisoriesListGlobalAdvisoriesParameter17.published,
  }) async {
    perPage?.validateMaximum(100);
    perPage?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/advisories',
      queryParameters: {
        if (ghsaId != null) 'ghsa_id': [ghsaId],
        if (type != null) 'type': [type.toJson()],
        if (cveId != null) 'cve_id': [cveId],
        if (ecosystem != null) 'ecosystem': [ecosystem.toJson()],
        if (severity != null) 'severity': [severity.toJson()],
        if (cwes != null)
          'cwes': switch (cwes) {
            SecurityAdvisoriesListGlobalAdvisoriesParameter5String(
              :final value,
            ) =>
              [value],
            SecurityAdvisoriesListGlobalAdvisoriesParameter5List(
              :final value,
            ) =>
              value,
          },
        if (isWithdrawn != null) 'is_withdrawn': [isWithdrawn.toString()],
        if (affects != null)
          'affects': switch (affects) {
            SecurityAdvisoriesListGlobalAdvisoriesParameter7String(
              :final value,
            ) =>
              [value],
            SecurityAdvisoriesListGlobalAdvisoriesParameter7List(
              :final value,
            ) =>
              value,
          },
        if (published != null) 'published': [published],
        if (updated != null) 'updated': [updated],
        if (modified != null) 'modified': [modified],
        if (epssPercentage != null) 'epss_percentage': [epssPercentage],
        if (epssPercentile != null) 'epss_percentile': [epssPercentile],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (sort != null) 'sort': [sort.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GlobalAdvisory>(
            (e) => GlobalAdvisory.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a global security advisory
  /// Gets a global security advisory using its GitHub Security Advisory
  /// (GHSA) identifier.
  Future<GlobalAdvisory> securityAdvisoriesGetGlobalAdvisory(
    String ghsaId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/advisories/{ghsa_id}'.replaceAll(
        '{ghsa_id}',
        Uri.encodeComponent(ghsaId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GlobalAdvisory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository security advisories for an organization
  /// Lists repository security advisories for an organization.
  ///
  /// The authenticated user must be an owner or security manager for the
  /// organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:write` scope to use this endpoint.
  Future<List<RepositoryAdvisory>>
  securityAdvisoriesListOrgRepositoryAdvisories(
    String org, {
    DirectionParam? direction = DirectionParam.desc,
    SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2? sort =
        SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter2.created,
    String? before,
    String? after,
    int? perPage = 30,
    SecurityAdvisoriesListOrgRepositoryAdvisoriesParameter6? state,
  }) async {
    perPage?.validateMaximum(100);
    perPage?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/security-advisories'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (state != null) 'state': [state.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryAdvisory>(
            (e) => RepositoryAdvisory.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository security advisories
  /// Lists security advisories in a repository.
  ///
  /// The authenticated user can access unpublished security advisories from a
  /// repository if they are a security manager or administrator of that
  /// repository, or if they are a collaborator on any security advisory.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:read` scope to to get a published security
  /// advisory in a private repository, or any unpublished security advisory
  /// that the authenticated user has access to.
  Future<List<RepositoryAdvisory>> securityAdvisoriesListRepositoryAdvisories(
    String owner,
    String repo, {
    DirectionParam? direction = DirectionParam.desc,
    SecurityAdvisoriesListRepositoryAdvisoriesParameter3? sort =
        SecurityAdvisoriesListRepositoryAdvisoriesParameter3.created,
    String? before,
    String? after,
    int? perPage = 30,
    SecurityAdvisoriesListRepositoryAdvisoriesParameter7? state,
  }) async {
    perPage?.validateMaximum(100);
    perPage?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/security-advisories'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (state != null) 'state': [state.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<RepositoryAdvisory>(
            (e) => RepositoryAdvisory.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository security advisory
  /// Creates a new repository security advisory.
  ///
  /// In order to create a draft repository security advisory, the
  /// authenticated user must be a security manager or administrator of that
  /// repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:write` scope to use this endpoint.
  Future<RepositoryAdvisory> securityAdvisoriesCreateRepositoryAdvisory(
    String owner,
    String repo,
    RepositoryAdvisoryCreate repositoryAdvisoryCreate,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/security-advisories'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: repositoryAdvisoryCreate.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryAdvisory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Privately report a security vulnerability
  /// Report a security vulnerability to the maintainers of the repository.
  /// See "[Privately reporting a security
  /// vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)"
  /// for more information about private vulnerability reporting.
  Future<RepositoryAdvisory> securityAdvisoriesCreatePrivateVulnerabilityReport(
    String owner,
    String repo,
    PrivateVulnerabilityReportCreate privateVulnerabilityReportCreate,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/security-advisories/reports'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: privateVulnerabilityReportCreate.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryAdvisory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a repository security advisory
  /// Get a repository security advisory using its GitHub Security Advisory
  /// (GHSA) identifier.
  ///
  /// Anyone can access any published security advisory on a public
  /// repository.
  ///
  /// The authenticated user can access an unpublished security advisory from
  /// a repository if they are a security manager or administrator of that
  /// repository, or if they are a
  /// collaborator on the security advisory.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:read` scope to to get a published security
  /// advisory in a private repository, or any unpublished security advisory
  /// that the authenticated user has access to.
  Future<RepositoryAdvisory> securityAdvisoriesGetRepositoryAdvisory(
    String owner,
    String repo,
    String ghsaId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/security-advisories/{ghsa_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ghsa_id}', Uri.encodeComponent(ghsaId)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryAdvisory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a repository security advisory
  /// Update a repository security advisory using its GitHub Security Advisory
  /// (GHSA) identifier.
  ///
  /// In order to update any security advisory, the authenticated user must be
  /// a security manager or administrator of that repository,
  /// or a collaborator on the repository security advisory.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:write` scope to use this endpoint.
  Future<RepositoryAdvisory> securityAdvisoriesUpdateRepositoryAdvisory(
    String owner,
    String repo,
    String ghsaId,
    RepositoryAdvisoryUpdate repositoryAdvisoryUpdate,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/security-advisories/{ghsa_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ghsa_id}', Uri.encodeComponent(ghsaId)),
      body: repositoryAdvisoryUpdate.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return RepositoryAdvisory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Request a CVE for a repository security advisory
  /// If you want a CVE identification number for the security vulnerability
  /// in your project, and don't already have one, you can request a CVE
  /// identification number from GitHub. For more information see "[Requesting
  /// a CVE identification
  /// number](https://docs.github.com/code-security/security-advisories/repository-security-advisories/publishing-a-repository-security-advisory#requesting-a-cve-identification-number-optional)."
  ///
  /// You may request a CVE for public repositories, but cannot do so for
  /// private repositories.
  ///
  /// In order to request a CVE for a repository security advisory, the
  /// authenticated user must be a security manager or administrator of that
  /// repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `repository_advisories:write` scope to use this endpoint.
  Future<dynamic> securityAdvisoriesCreateRepositoryAdvisoryCveRequest(
    String owner,
    String repo,
    String ghsaId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ghsa_id}', Uri.encodeComponent(ghsaId)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a temporary private fork
  /// Create a temporary private fork to collaborate on fixing a security
  /// vulnerability in your repository.
  ///
  /// > [!NOTE]
  /// > Forking a repository happens asynchronously. You may have to wait up
  /// to 5 minutes before you can access the fork.
  Future<FullRepository> securityAdvisoriesCreateFork(
    String owner,
    String repo,
    String ghsaId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ghsa_id}', Uri.encodeComponent(ghsaId)),
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
}
