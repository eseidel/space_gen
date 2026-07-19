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
import 'package:github/messages/copilot_add_copilot_seats_for_teams201_response.dart';
import 'package:github/messages/copilot_add_copilot_seats_for_teams_request.dart';
import 'package:github/messages/copilot_add_copilot_seats_for_users201_response.dart';
import 'package:github/messages/copilot_add_copilot_seats_for_users_request.dart';
import 'package:github/messages/copilot_cancel_copilot_seat_assignment_for_teams200_response.dart';
import 'package:github/messages/copilot_cancel_copilot_seat_assignment_for_teams_request.dart';
import 'package:github/messages/copilot_cancel_copilot_seat_assignment_for_users200_response.dart';
import 'package:github/messages/copilot_cancel_copilot_seat_assignment_for_users_request.dart';
import 'package:github/messages/copilot_list_copilot_seats200_response.dart';
import 'package:github/models/copilot_organization_details.dart';
import 'package:github/models/copilot_seat_details.dart';
import 'package:github/models/copilot_usage_metrics_day.dart';

/// Endpoints to manage Copilot using the REST API.
class CopilotApi {
  CopilotApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get Copilot seat information and settings for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Gets information about an organization's Copilot subscription, including
  /// seat breakdown
  /// and feature policies. To configure these settings, go to your
  /// organization's settings on GitHub.com.
  /// For more information, see "[Managing policies for Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-policies-for-copilot-business-in-your-organization)."
  ///
  /// Only organization owners can view details about the organization's
  /// Copilot Business or Copilot Enterprise subscription.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `read:org` scopes to use this endpoint.
  Future<CopilotOrganizationDetails> getCopilotOrganizationDetails(
    String org,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/copilot/billing'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotOrganizationDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List all Copilot seat assignments for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Lists all Copilot seats for which an organization with a Copilot
  /// Business or Copilot Enterprise subscription is currently being billed.
  /// Only organization owners can view assigned seats.
  ///
  /// Each seat object contains information about the assigned user's most
  /// recent Copilot activity. Users must have telemetry enabled in their IDE
  /// for Copilot in the IDE activity to be reflected in `last_activity_at`.
  /// For more information about activity data, see "[Reviewing user activity
  /// data for Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/reviewing-activity-related-to-github-copilot-in-your-organization/reviewing-user-activity-data-for-copilot-in-your-organization)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `read:org` scopes to use this endpoint.
  Future<CopilotListCopilotSeats200Response> listCopilotSeats(
    String org, {
    int? page = 1,
    int? perPage = 50,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/copilot/billing/seats'.replaceAll(
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
      return CopilotListCopilotSeats200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add teams to the Copilot subscription for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Purchases a GitHub Copilot seat for all users within each specified
  /// team.
  /// The organization will be billed for each seat based on the
  /// organization's Copilot plan. For more information about Copilot pricing,
  /// see "[About billing for GitHub Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization)."
  ///
  /// Only organization owners can purchase Copilot seats for their
  /// organization members. The organization must have a Copilot Business or
  /// Copilot Enterprise subscription and a configured suggestion matching
  /// policy.
  /// For more information about setting up a Copilot subscription, see
  /// "[Subscribing to Copilot for your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization)."
  /// For more information about setting a suggestion matching policy, see
  /// "[Managing policies for Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching)."
  ///
  /// The response contains the total number of new seats that were created
  /// and existing seats that were refreshed.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `admin:org` scopes to use this endpoint.
  Future<CopilotAddCopilotSeatsForTeams201Response> addCopilotSeatsForTeams(
    String org,
    CopilotAddCopilotSeatsForTeamsRequest copilotAddCopilotSeatsForTeamsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/copilot/billing/selected_teams'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: copilotAddCopilotSeatsForTeamsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotAddCopilotSeatsForTeams201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove teams from the Copilot subscription for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Sets seats for all members of each team specified to "pending
  /// cancellation".
  /// This will cause the members of the specified team(s) to lose access to
  /// GitHub Copilot at the end of the current billing cycle unless they
  /// retain access through another team.
  /// For more information about disabling access to Copilot, see "[Revoking
  /// access to Copilot for members of your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization)."
  ///
  /// Only organization owners can cancel Copilot seats for their organization
  /// members.
  ///
  /// The response contains the total number of seats set to "pending
  /// cancellation".
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `admin:org` scopes to use this endpoint.
  Future<CopilotCancelCopilotSeatAssignmentForTeams200Response>
  cancelCopilotSeatAssignmentForTeams(
    String org,
    CopilotCancelCopilotSeatAssignmentForTeamsRequest
    copilotCancelCopilotSeatAssignmentForTeamsRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/copilot/billing/selected_teams'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: copilotCancelCopilotSeatAssignmentForTeamsRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotCancelCopilotSeatAssignmentForTeams200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add users to the Copilot subscription for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Purchases a GitHub Copilot seat for each user specified.
  /// The organization will be billed for each seat based on the
  /// organization's Copilot plan. For more information about Copilot pricing,
  /// see "[About billing for GitHub Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization)."
  ///
  /// Only organization owners can purchase Copilot seats for their
  /// organization members. The organization must have a Copilot Business or
  /// Copilot Enterprise subscription and a configured suggestion matching
  /// policy.
  /// For more information about setting up a Copilot subscription, see
  /// "[Subscribing to Copilot for your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization)."
  /// For more information about setting a suggestion matching policy, see
  /// "[Managing policies for Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching)."
  ///
  /// The response contains the total number of new seats that were created
  /// and existing seats that were refreshed.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `admin:org` scopes to use this endpoint.
  Future<CopilotAddCopilotSeatsForUsers201Response> addCopilotSeatsForUsers(
    String org,
    CopilotAddCopilotSeatsForUsersRequest copilotAddCopilotSeatsForUsersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/copilot/billing/selected_users'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: copilotAddCopilotSeatsForUsersRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotAddCopilotSeatsForUsers201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove users from the Copilot subscription for an organization
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Sets seats for all users specified to "pending cancellation".
  /// This will cause the specified users to lose access to GitHub Copilot at
  /// the end of the current billing cycle unless they retain access through
  /// team membership.
  /// For more information about disabling access to Copilot, see "[Revoking
  /// access to Copilot for members of your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization)."
  ///
  /// Only organization owners can cancel Copilot seats for their organization
  /// members.
  ///
  /// The response contains the total number of seats set to "pending
  /// cancellation".
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `admin:org` scopes to use this endpoint.
  Future<CopilotCancelCopilotSeatAssignmentForUsers200Response>
  cancelCopilotSeatAssignmentForUsers(
    String org,
    CopilotCancelCopilotSeatAssignmentForUsersRequest
    copilotCancelCopilotSeatAssignmentForUsersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/copilot/billing/selected_users'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: copilotCancelCopilotSeatAssignmentForUsersRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotCancelCopilotSeatAssignmentForUsers200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Copilot metrics for an organization
  /// Use this endpoint to see a breakdown of aggregated metrics for various
  /// GitHub Copilot features. See the response schema tab for detailed
  /// metrics definitions.
  ///
  /// > [!NOTE]
  /// > This endpoint will only return results for a given day if the
  /// organization contained **five or more members with active Copilot
  /// licenses** on that day, as evaluated at the end of that day.
  ///
  /// The response contains metrics for up to 28 days prior. Metrics are
  /// processed once per day for the previous day,
  /// and the response will only include data up until yesterday. In order for
  /// an end user to be counted towards these metrics,
  /// they must have telemetry enabled in their IDE.
  ///
  /// To access this endpoint, the Copilot Metrics API access policy must be
  /// enabled for the organization.
  /// Only organization owners and owners and billing managers of the parent
  /// enterprise can view Copilot metrics.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use
  /// this endpoint.
  Future<List<CopilotUsageMetricsDay>> copilotMetricsForOrganization(
    String org, {
    String? since,
    String? until,
    int? page = 1,
    int? perPage = 28,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/copilot/metrics'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (since != null) 'since': [since],
        if (until != null) 'until': [until],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CopilotUsageMetricsDay>(
            (e) => CopilotUsageMetricsDay.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Copilot seat assignment details for a user
  /// > [!NOTE]
  /// > This endpoint is in public preview and is subject to change.
  ///
  /// Gets the GitHub Copilot seat details for a member of an organization who
  /// currently has access to GitHub Copilot.
  ///
  /// The seat object contains information about the user's most recent
  /// Copilot activity. Users must have telemetry enabled in their IDE for
  /// Copilot in the IDE activity to be reflected in `last_activity_at`.
  /// For more information about activity data, see "[Reviewing user activity
  /// data for Copilot in your
  /// organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/reviewing-activity-related-to-github-copilot-in-your-organization/reviewing-user-activity-data-for-copilot-in-your-organization)."
  ///
  /// Only organization owners can view Copilot seat assignment details for
  /// members of their organization.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot` or `read:org` scopes to use this endpoint.
  Future<CopilotSeatDetails> getCopilotSeatDetailsForUser(
    String org,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/members/{username}/copilot'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CopilotSeatDetails.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Copilot metrics for a team
  /// Use this endpoint to see a breakdown of aggregated metrics for various
  /// GitHub Copilot features. See the response schema tab for detailed
  /// metrics definitions.
  ///
  /// > [!NOTE]
  /// > This endpoint will only return results for a given day if the team had
  /// **five or more members with active Copilot licenses** on that day, as
  /// evaluated at the end of that day.
  ///
  /// The response contains metrics for up to 28 days prior. Metrics are
  /// processed once per day for the previous day,
  /// and the response will only include data up until yesterday. In order for
  /// an end user to be counted towards these metrics,
  /// they must have telemetry enabled in their IDE.
  ///
  /// To access this endpoint, the Copilot Metrics API access policy must be
  /// enabled for the organization containing the team within GitHub settings.
  /// Only organization owners for the organization that contains this team
  /// and owners and billing managers of the parent enterprise can view
  /// Copilot metrics for a team.
  ///
  /// OAuth app tokens and personal access tokens (classic) need either the
  /// `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use
  /// this endpoint.
  Future<List<CopilotUsageMetricsDay>> copilotMetricsForTeam(
    String org,
    String teamSlug, {
    String? since,
    String? until,
    int? page = 1,
    int? perPage = 28,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/team/{team_slug}/copilot/metrics'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
      queryParameters: {
        if (since != null) 'since': [since],
        if (until != null) 'until': [until],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CopilotUsageMetricsDay>(
            (e) => CopilotUsageMetricsDay.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
