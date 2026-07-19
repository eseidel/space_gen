// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/secret_scanning_create_push_protection_bypass_request.dart';
import 'package:github/messages/secret_scanning_update_alert_request.dart';
import 'package:github/models/alert_number.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/organization_secret_scanning_alert.dart';
import 'package:github/models/secret_scanning_alert.dart';
import 'package:github/models/secret_scanning_alert_sort_param.dart';
import 'package:github/models/secret_scanning_alert_state_param.dart';
import 'package:github/models/secret_scanning_location.dart';
import 'package:github/models/secret_scanning_push_protection_bypass.dart';
import 'package:github/models/secret_scanning_scan_history.dart';

/// Retrieve secret scanning alerts from a repository.
class SecretScanningApi {
  SecretScanningApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List secret scanning alerts for an enterprise
  /// Lists secret scanning alerts for eligible repositories in an enterprise,
  /// from newest to oldest.
  ///
  /// Alerts are only returned for organizations in the enterprise for which
  /// the authenticated user is an organization owner or a [security
  /// manager](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).
  ///
  /// The authenticated user must be a member of the enterprise in order to
  /// use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope or `security_events` scope to use this endpoint.
  Future<List<OrganizationSecretScanningAlert>>
  secretScanningListAlertsForEnterprise(
    String enterprise, {
    SecretScanningAlertStateParam? state,
    String? secretType,
    String? resolution,
    SecretScanningAlertSortParam? sort = SecretScanningAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    String? before,
    String? after,
    String? validity,
    bool? isPubliclyLeaked = false,
    bool? isMultiRepo = false,
    bool? hideSecret = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/enterprises/{enterprise}/secret-scanning/alerts'.replaceAll(
        '{enterprise}',
        Uri.encodeComponent(enterprise),
      ),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (secretType != null) 'secret_type': [secretType],
        if (resolution != null) 'resolution': [resolution],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (validity != null) 'validity': [validity],
        if (isPubliclyLeaked != null)
          'is_publicly_leaked': [isPubliclyLeaked.toString()],
        if (isMultiRepo != null) 'is_multi_repo': [isMultiRepo.toString()],
        if (hideSecret != null) 'hide_secret': [hideSecret.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationSecretScanningAlert>(
            (e) => OrganizationSecretScanningAlert.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List secret scanning alerts for an organization
  /// Lists secret scanning alerts for eligible repositories in an
  /// organization, from newest to oldest.
  ///
  /// The authenticated user must be an administrator or security manager for
  /// the organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<List<OrganizationSecretScanningAlert>> secretScanningListAlertsForOrg(
    String org, {
    SecretScanningAlertStateParam? state,
    String? secretType,
    String? resolution,
    SecretScanningAlertSortParam? sort = SecretScanningAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? page = 1,
    int? perPage = 30,
    String? before,
    String? after,
    String? validity,
    bool? isPubliclyLeaked = false,
    bool? isMultiRepo = false,
    bool? hideSecret = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/secret-scanning/alerts'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (secretType != null) 'secret_type': [secretType],
        if (resolution != null) 'resolution': [resolution],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (validity != null) 'validity': [validity],
        if (isPubliclyLeaked != null)
          'is_publicly_leaked': [isPubliclyLeaked.toString()],
        if (isMultiRepo != null) 'is_multi_repo': [isMultiRepo.toString()],
        if (hideSecret != null) 'hide_secret': [hideSecret.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<OrganizationSecretScanningAlert>(
            (e) => OrganizationSecretScanningAlert.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List secret scanning alerts for a repository
  /// Lists secret scanning alerts for an eligible repository, from newest to
  /// oldest.
  ///
  /// The authenticated user must be an administrator for the repository or
  /// for the organization that owns the repository to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<List<SecretScanningAlert>> secretScanningListAlertsForRepo(
    String owner,
    String repo, {
    SecretScanningAlertStateParam? state,
    String? secretType,
    String? resolution,
    SecretScanningAlertSortParam? sort = SecretScanningAlertSortParam.created,
    DirectionParam? direction = DirectionParam.desc,
    int? page = 1,
    int? perPage = 30,
    String? before,
    String? after,
    String? validity,
    bool? isPubliclyLeaked = false,
    bool? isMultiRepo = false,
    bool? hideSecret = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/secret-scanning/alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (secretType != null) 'secret_type': [secretType],
        if (resolution != null) 'resolution': [resolution],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (validity != null) 'validity': [validity],
        if (isPubliclyLeaked != null)
          'is_publicly_leaked': [isPubliclyLeaked.toString()],
        if (isMultiRepo != null) 'is_multi_repo': [isMultiRepo.toString()],
        if (hideSecret != null) 'hide_secret': [hideSecret.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SecretScanningAlert>(
            (e) => SecretScanningAlert.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a secret scanning alert
  /// Gets a single secret scanning alert detected in an eligible repository.
  ///
  /// The authenticated user must be an administrator for the repository or
  /// for the organization that owns the repository to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<SecretScanningAlert> secretScanningGetAlert(
    String owner,
    String repo,
    AlertNumber alertNumber, {
    bool? hideSecret = false,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      queryParameters: {
        if (hideSecret != null) 'hide_secret': [hideSecret.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SecretScanningAlert.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a secret scanning alert
  /// Updates the status of a secret scanning alert in an eligible repository.
  ///
  /// The authenticated user must be an administrator for the repository or
  /// for the organization that owns the repository to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<SecretScanningAlert> secretScanningUpdateAlert(
    String owner,
    String repo,
    AlertNumber alertNumber,
    SecretScanningUpdateAlertRequest secretScanningUpdateAlertRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      body: secretScanningUpdateAlertRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SecretScanningAlert.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List locations for a secret scanning alert
  /// Lists all locations for a given secret scanning alert for an eligible
  /// repository.
  ///
  /// The authenticated user must be an administrator for the repository or
  /// for the organization that owns the repository to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<List<SecretScanningLocation>> secretScanningListLocationsForAlert(
    String owner,
    String repo,
    AlertNumber alertNumber, {
    int? page = 1,
    int? perPage = 30,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SecretScanningLocation>(
            (e) => SecretScanningLocation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a push protection bypass
  /// Creates a bypass for a previously push protected secret.
  ///
  /// The authenticated user must be the original author of the committed
  /// secret.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<SecretScanningPushProtectionBypass>
  secretScanningCreatePushProtectionBypass(
    String owner,
    String repo,
    SecretScanningCreatePushProtectionBypassRequest
    secretScanningCreatePushProtectionBypassRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/secret-scanning/push-protection-bypasses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: secretScanningCreatePushProtectionBypassRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SecretScanningPushProtectionBypass.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get secret scanning scan history for a repository
  /// Lists the latest default incremental and backfill scans by type for a
  /// repository. Scans from Copilot Secret Scanning are not included.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `security_events` scope to use this endpoint. If this endpoint is only
  /// used with public repositories, the token can use the `public_repo` scope
  /// instead.
  Future<SecretScanningScanHistory> secretScanningGetScanHistory(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/secret-scanning/scan-history'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SecretScanningScanHistory.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
