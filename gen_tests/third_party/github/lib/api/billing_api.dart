// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/actions_billing_usage.dart';
import 'package:github/models/billing_usage_report.dart';
import 'package:github/models/billing_usage_report_user.dart';
import 'package:github/models/combined_billing_usage.dart';
import 'package:github/models/packages_billing_usage.dart';

/// Monitor charges and usage from Actions and Packages.
class BillingApi {
  BillingApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get billing usage report for an organization
  /// Gets a report of the total usage for an organization. To use this
  /// endpoint, you must be an administrator of an organization within an
  /// enterprise or an organization account.
  ///
  /// **Note:** This endpoint is only available to organizations with access
  /// to the enhanced billing platform. For more information, see "[About the
  /// enhanced billing
  /// platform](https://docs.github.com/billing/using-the-new-billing-platform)."
  Future<BillingUsageReport> getGithubBillingUsageReportOrg(
    String org, {
    int? year,
    int? month,
    int? day,
    int? hour,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/organizations/{org}/settings/billing/usage'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (year != null) 'year': [year.toString()],
        if (month != null) 'month': [month.toString()],
        if (day != null) 'day': [day.toString()],
        if (hour != null) 'hour': [hour.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BillingUsageReport.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Actions billing for an organization
  /// Gets the summary of the free and paid GitHub Actions minutes used.
  ///
  /// Paid minutes only apply to workflows in private repositories that use
  /// GitHub-hosted runners. Minutes used is listed for each GitHub-hosted
  /// runner operating system. Any job re-runs are also included in the usage.
  /// The usage returned includes any minute multipliers for macOS and Windows
  /// runners, and is rounded up to the nearest whole minute. For more
  /// information, see "[Managing billing for GitHub
  /// Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `admin:org` scope to use this endpoint.
  Future<ActionsBillingUsage> getGithubActionsBillingOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/settings/billing/actions'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Packages billing for an organization
  /// Gets the free and paid storage used for GitHub Packages in gigabytes.
  ///
  /// Paid minutes only apply to packages stored for private repositories. For
  /// more information, see "[Managing billing for GitHub
  /// Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `admin:org` scope to use this endpoint.
  Future<PackagesBillingUsage> getGithubPackagesBillingOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/settings/billing/packages'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PackagesBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get shared storage billing for an organization
  /// Gets the estimated paid and estimated total storage used for GitHub
  /// Actions and GitHub Packages.
  ///
  /// Paid minutes only apply to packages stored for private repositories. For
  /// more information, see "[Managing billing for GitHub
  /// Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo` or
  /// `admin:org` scope to use this endpoint.
  Future<CombinedBillingUsage> getSharedStorageBillingOrg(String org) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/settings/billing/shared-storage'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CombinedBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Actions billing for a user
  /// Gets the summary of the free and paid GitHub Actions minutes used.
  ///
  /// Paid minutes only apply to workflows in private repositories that use
  /// GitHub-hosted runners. Minutes used is listed for each GitHub-hosted
  /// runner operating system. Any job re-runs are also included in the usage.
  /// The usage returned includes any minute multipliers for macOS and Windows
  /// runners, and is rounded up to the nearest whole minute. For more
  /// information, see "[Managing billing for GitHub
  /// Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<ActionsBillingUsage> getGithubActionsBillingUser(
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/settings/billing/actions'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ActionsBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub Packages billing for a user
  /// Gets the free and paid storage used for GitHub Packages in gigabytes.
  ///
  /// Paid minutes only apply to packages stored for private repositories. For
  /// more information, see "[Managing billing for GitHub
  /// Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<PackagesBillingUsage> getGithubPackagesBillingUser(
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/settings/billing/packages'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PackagesBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get shared storage billing for a user
  /// Gets the estimated paid and estimated total storage used for GitHub
  /// Actions and GitHub Packages.
  ///
  /// Paid minutes only apply to packages stored for private repositories. For
  /// more information, see "[Managing billing for GitHub
  /// Packages](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-packages)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<CombinedBillingUsage> getSharedStorageBillingUser(
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/settings/billing/shared-storage'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CombinedBillingUsage.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get billing usage report for a user
  /// Gets a report of the total usage for a user.
  ///
  /// **Note:** This endpoint is only available to users with access to the
  /// enhanced billing platform.
  Future<BillingUsageReportUser> getGithubBillingUsageReportUser(
    String username, {
    int? year,
    int? month,
    int? day,
    int? hour,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/settings/billing/usage'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (year != null) 'year': [year.toString()],
        if (month != null) 'month': [month.toString()],
        if (day != null) 'day': [day.toString()],
        if (hour != null) 'hour': [hour.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BillingUsageReportUser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
