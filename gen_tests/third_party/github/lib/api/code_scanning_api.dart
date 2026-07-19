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
import 'package:github/messages/code_scanning_autofix_commits_response.dart';
import 'package:github/messages/code_scanning_create_variant_analysis_request.dart';
import 'package:github/messages/code_scanning_default_setup_update_response.dart';
import 'package:github/messages/code_scanning_update_alert_request.dart';
import 'package:github/messages/code_scanning_upload_sarif_request.dart';
import 'package:github/models/alert_number.dart';
import 'package:github/models/code_scanning_alert.dart';
import 'package:github/models/code_scanning_alert_instance.dart';
import 'package:github/models/code_scanning_alert_items.dart';
import 'package:github/models/code_scanning_alert_severity.dart';
import 'package:github/models/code_scanning_alert_state_query.dart';
import 'package:github/models/code_scanning_analysis.dart';
import 'package:github/models/code_scanning_analysis_deletion.dart';
import 'package:github/models/code_scanning_analysis_sarif_id.dart';
import 'package:github/models/code_scanning_analysis_tool_guid.dart';
import 'package:github/models/code_scanning_analysis_tool_name.dart';
import 'package:github/models/code_scanning_autofix.dart';
import 'package:github/models/code_scanning_autofix_commits.dart';
import 'package:github/models/code_scanning_codeql_database.dart';
import 'package:github/models/code_scanning_default_setup.dart';
import 'package:github/models/code_scanning_default_setup_update.dart';
import 'package:github/models/code_scanning_list_alerts_for_org_parameter9.dart';
import 'package:github/models/code_scanning_list_alerts_for_repo_parameter11.dart';
import 'package:github/models/code_scanning_list_recent_analyses_parameter10.dart';
import 'package:github/models/code_scanning_organization_alert_items.dart';
import 'package:github/models/code_scanning_ref.dart';
import 'package:github/models/code_scanning_sarifs_receipt.dart';
import 'package:github/models/code_scanning_sarifs_status.dart';
import 'package:github/models/code_scanning_variant_analysis.dart';
import 'package:github/models/code_scanning_variant_analysis_repo_task.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/empty_object.dart';
import 'package:meta/meta.dart';

sealed class CodeScanningUpdateDefaultSetupResponse {
  const CodeScanningUpdateDefaultSetupResponse();
}

@immutable
final class CodeScanningUpdateDefaultSetupResponse200
    extends CodeScanningUpdateDefaultSetupResponse {
  const CodeScanningUpdateDefaultSetupResponse200(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningUpdateDefaultSetupResponse200 &&
        value == other.value;
  }
}

@immutable
final class CodeScanningUpdateDefaultSetupResponse202
    extends CodeScanningUpdateDefaultSetupResponse {
  const CodeScanningUpdateDefaultSetupResponse202(this.value);

  final CodeScanningDefaultSetupUpdateResponse value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodeScanningUpdateDefaultSetupResponse202 &&
        value == other.value;
  }
}

/// Retrieve code scanning alerts from a repository.
class CodeScanningApi {
  CodeScanningApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List code scanning alerts for an organization
  /// Lists code scanning alerts for the default branch for all eligible
  /// repositories in an organization. Eligible repositories are repositories
  /// that are owned by organizations that you own or for which you are a
  /// security manager. For more information, see "[Managing security managers
  /// in your
  /// organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization)."
  ///
  /// The authenticated user must be an owner or security manager for the
  /// organization to use this endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` or `repo`s cope to use this endpoint with private or
  /// public repositories, or the `public_repo` scope to use this endpoint
  /// with only public repositories.
  Future<List<CodeScanningOrganizationAlertItems>> codeScanningListAlertsForOrg(
    String org, {
    CodeScanningAnalysisToolName? toolName,
    CodeScanningAnalysisToolGuid? toolGuid,
    String? before,
    String? after,
    int? page = 1,
    int? perPage = 30,
    DirectionParam? direction = DirectionParam.desc,
    CodeScanningAlertStateQuery? state,
    CodeScanningListAlertsForOrgParameter9? sort =
        CodeScanningListAlertsForOrgParameter9.created,
    CodeScanningAlertSeverity? severity,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/code-scanning/alerts'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (toolName != null) 'tool_name': [toolName.toJson()],
        if (toolGuid != null) 'tool_guid': [toolGuid.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (direction != null) 'direction': [direction.toJson()],
        if (state != null) 'state': [state.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (severity != null) 'severity': [severity.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeScanningOrganizationAlertItems>(
            (e) => CodeScanningOrganizationAlertItems.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List code scanning alerts for a repository
  /// Lists code scanning alerts.
  ///
  /// The response includes a `most_recent_instance` object.
  /// This provides details of the most recent instance of this alert
  /// for the default branch (or for the specified Git reference if you used
  /// `ref` in the request).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<List<CodeScanningAlertItems>> codeScanningListAlertsForRepo(
    String owner,
    String repo, {
    CodeScanningAnalysisToolName? toolName,
    CodeScanningAnalysisToolGuid? toolGuid,
    int? page = 1,
    int? perPage = 30,
    CodeScanningRef? ref,
    int? pr,
    DirectionParam? direction = DirectionParam.desc,
    String? before,
    String? after,
    CodeScanningListAlertsForRepoParameter11? sort =
        CodeScanningListAlertsForRepoParameter11.created,
    CodeScanningAlertStateQuery? state,
    CodeScanningAlertSeverity? severity,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/alerts'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (toolName != null) 'tool_name': [toolName.toJson()],
        if (toolGuid != null) 'tool_guid': [toolGuid.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (ref != null) 'ref': [ref.toJson()],
        if (pr != null) 'pr': [pr.toString()],
        if (direction != null) 'direction': [direction.toJson()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (sort != null) 'sort': [sort.toJson()],
        if (state != null) 'state': [state.toJson()],
        if (severity != null) 'severity': [severity.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeScanningAlertItems>(
            (e) => CodeScanningAlertItems.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a code scanning alert
  /// Gets a single code scanning alert.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningAlert> codeScanningGetAlert(
    String owner,
    String repo,
    AlertNumber alertNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAlert.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a code scanning alert
  /// Updates the status of a single code scanning alert.
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningAlert> codeScanningUpdateAlert(
    String owner,
    String repo,
    AlertNumber alertNumber,
    CodeScanningUpdateAlertRequest codeScanningUpdateAlertRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      body: codeScanningUpdateAlertRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAlert.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the status of an autofix for a code scanning alert
  /// Gets the status and description of an autofix for a code scanning alert.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningAutofix> codeScanningGetAutofix(
    String owner,
    String repo,
    AlertNumber alertNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAutofix.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an autofix for a code scanning alert
  /// Creates an autofix for a code scanning alert.
  ///
  /// If a new autofix is to be created as a result of this request or is
  /// currently being generated, then this endpoint will return a 202 Accepted
  /// response.
  ///
  /// If an autofix already exists for a given alert, then this endpoint will
  /// return a 200 OK response.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningAutofix> codeScanningCreateAutofix(
    String owner,
    String repo,
    AlertNumber alertNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAutofix.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Commit an autofix for a code scanning alert
  /// Commits an autofix for a code scanning alert.
  ///
  /// If an autofix is committed as a result of this request, then this
  /// endpoint will return a 201 Created response.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<CodeScanningAutofixCommitsResponse> codeScanningCommitAutofix(
    String owner,
    String repo,
    AlertNumber alertNumber, {
    CodeScanningAutofixCommits? codeScanningAutofixCommits,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix/commits'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      body: codeScanningAutofixCommits?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAutofixCommitsResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List instances of a code scanning alert
  /// Lists all instances of the specified code scanning alert.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<List<CodeScanningAlertInstance>> codeScanningListAlertInstances(
    String owner,
    String repo,
    AlertNumber alertNumber, {
    int? page = 1,
    int? perPage = 30,
    CodeScanningRef? ref,
    int? pr,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{alert_number}', '${alertNumber.toJson()}'),
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (ref != null) 'ref': [ref.toJson()],
        if (pr != null) 'pr': [pr.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeScanningAlertInstance>(
            (e) =>
                CodeScanningAlertInstance.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List code scanning analyses for a repository
  /// Lists the details of all code scanning analyses for a repository,
  /// starting with the most recent.
  /// The response is paginated and you can use the `page` and `per_page`
  /// parameters
  /// to list the analyses you're interested in.
  /// By default 30 analyses are listed per page.
  ///
  /// The `rules_count` field in the response give the number of rules
  /// that were run in the analysis.
  /// For very old analyses this data is not available,
  /// and `0` is returned in this field.
  ///
  /// > [!WARNING]
  /// > **Closing down notice:** The `tool_name` field is closing down and
  /// will, in future, not be included in the response for this endpoint. The
  /// example response reflects this change. The tool name can now be found
  /// inside the `tool` field.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<List<CodeScanningAnalysis>> codeScanningListRecentAnalyses(
    String owner,
    String repo, {
    CodeScanningAnalysisToolName? toolName,
    CodeScanningAnalysisToolGuid? toolGuid,
    int? page = 1,
    int? perPage = 30,
    int? pr,
    CodeScanningRef? ref,
    CodeScanningAnalysisSarifId? sarifId,
    DirectionParam? direction = DirectionParam.desc,
    CodeScanningListRecentAnalysesParameter10? sort =
        CodeScanningListRecentAnalysesParameter10.created,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/analyses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (toolName != null) 'tool_name': [toolName.toJson()],
        if (toolGuid != null) 'tool_guid': [toolGuid.toJson()],
        if (page != null) 'page': [page.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (pr != null) 'pr': [pr.toString()],
        if (ref != null) 'ref': [ref.toJson()],
        if (sarifId != null) 'sarif_id': [sarifId.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeScanningAnalysis>(
            (e) => CodeScanningAnalysis.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a code scanning analysis for a repository
  /// Gets a specified code scanning analysis for a repository.
  ///
  /// The default JSON response contains fields that describe the analysis.
  /// This includes the Git reference and commit SHA to which the analysis
  /// relates,
  /// the datetime of the analysis, the name of the code scanning tool,
  /// and the number of alerts.
  ///
  /// The `rules_count` field in the default response give the number of rules
  /// that were run in the analysis.
  /// For very old analyses this data is not available,
  /// and `0` is returned in this field.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/sarif+json`**: Instead of returning a summary of the
  /// analysis, this endpoint returns a subset of the analysis data that was
  /// uploaded. The data is formatted as [SARIF version
  /// 2.1.0](https://docs.oasis-open.org/sarif/sarif/v2.1.0/cs01/sarif-v2.1.0-cs01.html).
  /// It also returns additional data such as the `github/alertNumber` and
  /// `github/alertUrl` properties.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningAnalysis> codeScanningGetAnalysis(
    String owner,
    String repo,
    int analysisId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{analysis_id}', '$analysisId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAnalysis.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a code scanning analysis from a repository
  /// Deletes a specified code scanning analysis from a repository.
  ///
  /// You can delete one analysis at a time.
  /// To delete a series of analyses, start with the most recent analysis and
  /// work backwards.
  /// Conceptually, the process is similar to the undo function in a text
  /// editor.
  ///
  /// When you list the analyses for a repository,
  /// one or more will be identified as deletable in the response:
  ///
  /// ```
  /// "deletable": true
  /// ```
  ///
  /// An analysis is deletable when it's the most recent in a set of analyses.
  /// Typically, a repository will have multiple sets of analyses
  /// for each enabled code scanning tool,
  /// where a set is determined by a unique combination of analysis values:
  ///
  /// * `ref`
  /// * `tool`
  /// * `category`
  ///
  /// If you attempt to delete an analysis that is not the most recent in a
  /// set,
  /// you'll get a 400 response with the message:
  ///
  /// ```
  /// Analysis specified is not deletable.
  /// ```
  ///
  /// The response from a successful `DELETE` operation provides you with
  /// two alternative URLs for deleting the next analysis in the set:
  /// `next_analysis_url` and `confirm_delete_url`.
  /// Use the `next_analysis_url` URL if you want to avoid accidentally
  /// deleting the final analysis
  /// in a set. This is a useful option if you want to preserve at least one
  /// analysis
  /// for the specified tool in your repository.
  /// Use the `confirm_delete_url` URL if you are content to remove all
  /// analyses for a tool.
  /// When you delete the last analysis in a set, the value of
  /// `next_analysis_url` and `confirm_delete_url`
  /// in the 200 response is `null`.
  ///
  /// As an example of the deletion process,
  /// let's imagine that you added a workflow that configured a particular
  /// code scanning tool
  /// to analyze the code in a repository. This tool has added 15 analyses:
  /// 10 on the default branch, and another 5 on a topic branch.
  /// You therefore have two separate sets of analyses for this tool.
  /// You've now decided that you want to remove all of the analyses for the
  /// tool.
  /// To do this you must make 15 separate deletion requests.
  /// To start, you must find an analysis that's identified as deletable.
  /// Each set of analyses always has one that's identified as deletable.
  /// Having found the deletable analysis for one of the two sets,
  /// delete this analysis and then continue deleting the next analysis in the
  /// set until they're all deleted.
  /// Then repeat the process for the second set.
  /// The procedure therefore consists of a nested loop:
  ///
  /// **Outer loop**:
  /// * List the analyses for the repository, filtered by tool.
  /// * Parse this list to find a deletable analysis. If found:
  ///
  ///   **Inner loop**:
  ///   * Delete the identified analysis.
  /// * Parse the response for the value of `confirm_delete_url` and, if
  /// found, use this in the next iteration.
  ///
  /// The above process assumes that you want to remove all trace of the
  /// tool's analyses from the GitHub user interface, for the specified
  /// repository, and it therefore uses the `confirm_delete_url` value.
  /// Alternatively, you could use the `next_analysis_url` value, which would
  /// leave the last analysis in each set undeleted to avoid removing a tool's
  /// analysis entirely.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<CodeScanningAnalysisDeletion> codeScanningDeleteAnalysis(
    String owner,
    String repo,
    int analysisId, {
    String? confirmDelete,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{analysis_id}', '$analysisId'),
      queryParameters: {
        if (confirmDelete != null) 'confirm_delete': [confirmDelete],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningAnalysisDeletion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List CodeQL databases for a repository
  /// Lists the CodeQL databases that are available in a repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<List<CodeScanningCodeqlDatabase>> codeScanningListCodeqlDatabases(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/codeql/databases'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeScanningCodeqlDatabase>(
            (e) =>
                CodeScanningCodeqlDatabase.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a CodeQL database for a repository
  /// Gets a CodeQL database for a language in a repository.
  ///
  /// By default this endpoint returns JSON metadata about the CodeQL
  /// database. To
  /// download the CodeQL database binary content, set the `Accept` header of
  /// the request
  /// to
  /// [`application/zip`](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types),
  /// and make sure
  /// your HTTP client is configured to follow redirects or use the `Location`
  /// header
  /// to make a second request to get the redirect URL.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<CodeScanningCodeqlDatabase> codeScanningGetCodeqlDatabase(
    String owner,
    String repo,
    String language,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{language}', Uri.encodeComponent(language)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningCodeqlDatabase.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a CodeQL database
  /// Deletes a CodeQL database for a language in a repository.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<void> codeScanningDeleteCodeqlDatabase(
    String owner,
    String repo,
    String language,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{language}', Uri.encodeComponent(language)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Create a CodeQL variant analysis
  /// Creates a new CodeQL variant analysis, which will run a CodeQL query
  /// against one or more repositories.
  ///
  /// Get started by learning more about [running CodeQL queries at scale with
  /// Multi-Repository Variant
  /// Analysis](https://docs.github.com/code-security/codeql-for-vs-code/getting-started-with-codeql-for-vs-code/running-codeql-queries-at-scale-with-multi-repository-variant-analysis).
  ///
  /// Use the `owner` and `repo` parameters in the URL to specify the
  /// controller repository that
  /// will be used for running GitHub Actions workflows and storing the
  /// results of the CodeQL variant analysis.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<CodeScanningVariantAnalysis> codeScanningCreateVariantAnalysis(
    String owner,
    String repo,
    CodeScanningCreateVariantAnalysisRequest
    codeScanningCreateVariantAnalysisRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: codeScanningCreateVariantAnalysisRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningVariantAnalysis.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the summary of a CodeQL variant analysis
  /// Gets the summary of a CodeQL variant analysis.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningVariantAnalysis> codeScanningGetVariantAnalysis(
    String owner,
    String repo,
    int codeqlVariantAnalysisId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{codeql_variant_analysis_id}',
                '$codeqlVariantAnalysisId',
              ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningVariantAnalysis.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the analysis status of a repository in a CodeQL variant analysis
  /// Gets the analysis status of a repository in a CodeQL variant analysis.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningVariantAnalysisRepoTask>
  codeScanningGetVariantAnalysisRepoTask(
    String owner,
    String repo,
    int codeqlVariantAnalysisId,
    String repoOwner,
    String repoName,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll(
                '{codeql_variant_analysis_id}',
                '$codeqlVariantAnalysisId',
              )
              .replaceAll('{repo_owner}', Uri.encodeComponent(repoOwner))
              .replaceAll('{repo_name}', Uri.encodeComponent(repoName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningVariantAnalysisRepoTask.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a code scanning default setup configuration
  /// Gets a code scanning default setup configuration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<CodeScanningDefaultSetup> codeScanningGetDefaultSetup(
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/default-setup'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningDefaultSetup.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a code scanning default setup configuration
  /// Updates a code scanning default setup configuration.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint with private or public repositories, or the
  /// `public_repo` scope to use this endpoint with only public repositories.
  Future<CodeScanningUpdateDefaultSetupResponse> codeScanningUpdateDefaultSetup(
    String owner,
    String repo,
    CodeScanningDefaultSetupUpdate codeScanningDefaultSetupUpdate,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/code-scanning/default-setup'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: codeScanningDefaultSetupUpdate.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => CodeScanningUpdateDefaultSetupResponse200(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      202 => CodeScanningUpdateDefaultSetupResponse202(
        CodeScanningDefaultSetupUpdateResponse.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Upload an analysis as SARIF data
  /// Uploads SARIF data containing the results of a code scanning analysis to
  /// make the results available in a repository. For troubleshooting
  /// information, see "[Troubleshooting SARIF
  /// uploads](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif)."
  ///
  /// There are two places where you can upload code scanning results.
  /// - If you upload to a pull request, for example `--ref refs/pull/42/merge`
  /// or `--ref refs/pull/42/head`, then the results appear as alerts in a
  /// pull request check. For more information, see "[Triaging code scanning
  /// alerts in pull
  /// requests](/code-security/secure-coding/triaging-code-scanning-alerts-in-pull-requests)."
  /// - If you upload to a branch, for example `--ref refs/heads/my-branch`,
  /// then the results appear in the **Security** tab for your repository. For
  /// more information, see "[Managing code scanning alerts for your
  /// repository](/code-security/secure-coding/managing-code-scanning-alerts-for-your-repository#viewing-the-alerts-for-a-repository)."
  ///
  /// You must compress the SARIF-formatted analysis data that you want to
  /// upload, using `gzip`, and then encode it as a Base64 format string. For
  /// example:
  ///
  /// ```
  /// gzip -c analysis-data.sarif | base64 -w0
  /// ```
  ///
  /// SARIF upload supports a maximum number of entries per the following data
  /// objects, and an analysis will be rejected if any of these objects is
  /// above its maximum value. For some objects, there are additional values
  /// over which the entries will be ignored while keeping the most important
  /// entries whenever applicable.
  /// To get the most out of your analysis when it includes data above the
  /// supported limits, try to optimize the analysis configuration. For
  /// example, for the CodeQL tool, identify and remove the most noisy
  /// queries. For more information, see "[SARIF results exceed one or more
  /// limits](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif/results-exceed-limit)."
  ///
  ///
  /// | **SARIF data**                   | **Maximum values** | **Additional
  /// limits**                                                            |
  /// |----------------------------------|:------------------:|----------------------------------------------------------------------------------|
  /// | Runs per file                    |         20         |
  /// |
  /// | Results per run                  |       25,000       | Only the top
  /// 5,000 results will be included, prioritized by severity.            |
  /// | Rules per run                    |       25,000       |
  /// |
  /// | Tool extensions per run          |        100         |
  /// |
  /// | Thread Flow Locations per result |       10,000       | Only the top
  /// 1,000 Thread Flow Locations will be included, using prioritization. |
  /// | Location per result	             |       1,000        | Only 100
  /// locations will be included.
  /// |
  /// | Tags per rule	                   |         20         | Only 10 tags
  /// will be included.                                                   |
  ///
  ///
  /// The `202 Accepted` response includes an `id` value.
  /// You can use this ID to check the status of the upload by using it in the
  /// `/sarifs/{sarif_id}` endpoint.
  /// For more information, see "[Get information about a SARIF
  /// upload](/rest/code-scanning/code-scanning#get-information-about-a-sarif-upload)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  ///
  /// This endpoint is limited to 1,000 requests per hour for each user or app
  /// installation calling it.
  Future<CodeScanningSarifsReceipt> codeScanningUploadSarif(
    String owner,
    String repo,
    CodeScanningUploadSarifRequest codeScanningUploadSarifRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/code-scanning/sarifs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: codeScanningUploadSarifRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningSarifsReceipt.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get information about a SARIF upload
  /// Gets information about a SARIF upload, including the status and the URL
  /// of the analysis that was uploaded so that you can retrieve details of
  /// the analysis. For more information, see "[Get a code scanning analysis
  /// for a
  /// repository](/rest/code-scanning/code-scanning#get-a-code-scanning-analysis-for-a-repository)."
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `security_events` scope to use this endpoint with private or public
  /// repositories, or the `public_repo` scope to use this endpoint with only
  /// public repositories.
  Future<CodeScanningSarifsStatus> codeScanningGetSarif(
    String owner,
    String repo,
    String sarifId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{sarif_id}', Uri.encodeComponent(sarifId)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeScanningSarifsStatus.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
