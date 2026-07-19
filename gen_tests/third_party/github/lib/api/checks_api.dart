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
import 'package:github/messages/checks_create_request.dart';
import 'package:github/messages/checks_create_suite_request.dart';
import 'package:github/messages/checks_list_for_ref200_response.dart';
import 'package:github/messages/checks_list_for_suite200_response.dart';
import 'package:github/messages/checks_list_suites_for_ref200_response.dart';
import 'package:github/messages/checks_set_suites_preferences_request.dart';
import 'package:github/messages/checks_update_request.dart';
import 'package:github/models/check_annotation.dart';
import 'package:github/models/check_run.dart';
import 'package:github/models/check_suite.dart';
import 'package:github/models/check_suite_preference.dart';
import 'package:github/models/checks_list_for_ref_parameter5.dart';
import 'package:github/models/checks_list_for_suite_parameter5.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/status_param.dart';

/// Rich interactions with checks run by your integrations.
class ChecksApi {
  ChecksApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Create a check run
  /// Creates a new check run for a specific commit in a repository.
  ///
  /// To create a check run, you must use a GitHub App. OAuth apps and
  /// authenticated users are not able to create a check suite.
  ///
  /// In a check suite, GitHub limits the number of check runs with the same
  /// name to 1000. Once these check runs exceed 1000, GitHub will start to
  /// automatically delete older check runs.
  ///
  /// > [!NOTE]
  /// > The Checks API only looks for pushes in the repository where the check
  /// suite or check run were created. Pushes to a branch in a forked
  /// repository are not detected and return an empty `pull_requests` array.
  Future<CheckRun> create(
    String owner,
    String repo,
    ChecksCreateRequest checksCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/check-runs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: checksCreateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckRun.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a check run
  /// Gets a single check run using its `id`.
  ///
  /// > [!NOTE]
  /// > The Checks API only looks for pushes in the repository where the check
  /// suite or check run were created. Pushes to a branch in a forked
  /// repository are not detected and return an empty `pull_requests` array.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  Future<CheckRun> get(String owner, String repo, int checkRunId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/check-runs/{check_run_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_run_id}', '$checkRunId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckRun.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a check run
  /// Updates a check run for a specific commit in a repository.
  ///
  /// > [!NOTE]
  /// > The endpoints to manage checks only look for pushes in the repository
  /// where the check suite or check run were created. Pushes to a branch in a
  /// forked repository are not detected and return an empty `pull_requests`
  /// array.
  ///
  /// OAuth apps and personal access tokens (classic) cannot use this
  /// endpoint.
  Future<CheckRun> update(
    String owner,
    String repo,
    int checkRunId,
    ChecksUpdateRequest checksUpdateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/check-runs/{check_run_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_run_id}', '$checkRunId'),
      body: checksUpdateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckRun.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List check run annotations
  /// Lists annotations for a check run using the annotation `id`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  Future<List<CheckAnnotation>> listAnnotations(
    String owner,
    String repo,
    int checkRunId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/check-runs/{check_run_id}/annotations'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_run_id}', '$checkRunId'),
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
          .map<CheckAnnotation>(
            (e) => CheckAnnotation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Rerequest a check run
  /// Triggers GitHub to rerequest an existing check run, without pushing new
  /// code to a repository. This endpoint will trigger the [`check_run`
  /// webhook](https://docs.github.com/webhooks/event-payloads/#check_run)
  /// event with the action `rerequested`. When a check run is `rerequested`,
  /// the `status` of the check suite it belongs to is reset to `queued` and
  /// the `conclusion` is cleared. The check run itself is not updated. GitHub
  /// apps recieving the [`check_run`
  /// webhook](https://docs.github.com/webhooks/event-payloads/#check_run)
  /// with the `rerequested` action should then decide if the check run should
  /// be reset or updated and call the [update `check_run`
  /// endpoint](https://docs.github.com/rest/checks/runs#update-a-check-run)
  /// to update the check_run if desired.
  ///
  /// For more information about how to re-run GitHub Actions jobs, see
  /// "[Re-run a job from a workflow
  /// run](https://docs.github.com/rest/actions/workflow-runs#re-run-a-job-from-a-workflow-run)".
  Future<EmptyObject> rerequestRun(
    String owner,
    String repo,
    int checkRunId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_run_id}', '$checkRunId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a check suite
  /// Creates a check suite manually. By default, check suites are
  /// automatically created when you create a [check
  /// run](https://docs.github.com/rest/checks/runs). You only need to use
  /// this endpoint for manually creating check suites when you've disabled
  /// automatic creation using "[Update repository preferences for check
  /// suites](https://docs.github.com/rest/checks/suites#update-repository-preferences-for-check-suites)".
  ///
  /// > [!NOTE]
  /// > The Checks API only looks for pushes in the repository where the check
  /// suite or check run were created. Pushes to a branch in a forked
  /// repository are not detected and return an empty `pull_requests` array
  /// and a `null` value for `head_branch`.
  ///
  /// OAuth apps and personal access tokens (classic) cannot use this
  /// endpoint.
  Future<CheckSuite> createSuite(
    String owner,
    String repo,
    ChecksCreateSuiteRequest checksCreateSuiteRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/check-suites'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: checksCreateSuiteRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckSuite.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update repository preferences for check suites
  /// Changes the default automatic flow when creating check suites. By
  /// default, a check suite is automatically created each time code is pushed
  /// to a repository. When you disable the automatic creation of check
  /// suites, you can manually [Create a check
  /// suite](https://docs.github.com/rest/checks/suites#create-a-check-suite).
  /// You must have admin permissions in the repository to set preferences for
  /// check suites.
  Future<CheckSuitePreference> setSuitesPreferences(
    String owner,
    String repo,
    ChecksSetSuitesPreferencesRequest checksSetSuitesPreferencesRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/check-suites/preferences'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: checksSetSuitesPreferencesRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckSuitePreference.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a check suite
  /// Gets a single check suite using its `id`.
  ///
  /// > [!NOTE]
  /// > The Checks API only looks for pushes in the repository where the check
  /// suite or check run were created. Pushes to a branch in a forked
  /// repository are not detected and return an empty `pull_requests` array
  /// and a `null` value for `head_branch`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  Future<CheckSuite> getSuite(
    String owner,
    String repo,
    int checkSuiteId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/check-suites/{check_suite_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_suite_id}', '$checkSuiteId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CheckSuite.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List check runs in a check suite
  /// Lists check runs for a check suite using its `id`.
  ///
  /// > [!NOTE]
  /// > The endpoints to manage checks only look for pushes in the repository
  /// where the check suite or check run were created. Pushes to a branch in a
  /// forked repository are not detected and return an empty `pull_requests`
  /// array.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  Future<ChecksListForSuite200Response> listForSuite(
    String owner,
    String repo,
    int checkSuiteId, {
    String? checkName,
    StatusParam? status,
    ChecksListForSuiteParameter5? filter = ChecksListForSuiteParameter5.latest,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_suite_id}', '$checkSuiteId'),
      queryParameters: {
        if (checkName != null) 'check_name': [checkName],
        if (status != null) 'status': [status.toJson()],
        if (filter != null) 'filter': [filter.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ChecksListForSuite200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Rerequest a check suite
  /// Triggers GitHub to rerequest an existing check suite, without pushing
  /// new code to a repository. This endpoint will trigger the [`check_suite`
  /// webhook](https://docs.github.com/webhooks/event-payloads/#check_suite)
  /// event with the action `rerequested`. When a check suite is
  /// `rerequested`, its `status` is reset to `queued` and the `conclusion` is
  /// cleared.
  Future<EmptyObject> rerequestSuite(
    String owner,
    String repo,
    int checkSuiteId,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{check_suite_id}', '$checkSuiteId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return EmptyObject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List check runs for a Git reference
  /// Lists check runs for a commit ref. The `ref` can be a SHA, branch name,
  /// or a tag name.
  ///
  /// > [!NOTE]
  /// > The endpoints to manage checks only look for pushes in the repository
  /// where the check suite or check run were created. Pushes to a branch in a
  /// forked repository are not detected and return an empty `pull_requests`
  /// array.
  ///
  /// If there are more than 1000 check suites on a single git reference, this
  /// endpoint will limit check runs to the 1000 most recent check suites. To
  /// iterate over all possible check runs, use the [List check suites for a
  /// Git
  /// reference](https://docs.github.com/rest/reference/checks#list-check-suites-for-a-git-reference)
  /// endpoint and provide the `check_suite_id` parameter to the [List check
  /// runs in a check
  /// suite](https://docs.github.com/rest/reference/checks#list-check-runs-in-a-check-suite)
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  Future<ChecksListForRef200Response> listForRef(
    String owner,
    String repo,
    String ref, {
    String? checkName,
    StatusParam? status,
    ChecksListForRefParameter5? filter = ChecksListForRefParameter5.latest,
    int? perPage = 30,
    int? page = 1,
    int? appId,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{ref}/check-runs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      queryParameters: {
        if (checkName != null) 'check_name': [checkName],
        if (status != null) 'status': [status.toJson()],
        if (filter != null) 'filter': [filter.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (appId != null) 'app_id': [appId.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ChecksListForRef200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List check suites for a Git reference
  /// Lists check suites for a commit `ref`. The `ref` can be a SHA, branch
  /// name, or a tag name.
  ///
  /// > [!NOTE]
  /// > The endpoints to manage checks only look for pushes in the repository
  /// where the check suite or check run were created. Pushes to a branch in a
  /// forked repository are not detected and return an empty `pull_requests`
  /// array and a `null` value for `head_branch`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint on a private repository.
  /// [appId] example: `1`
  Future<ChecksListSuitesForRef200Response> listSuitesForRef(
    String owner,
    String repo,
    String ref, {
    int? appId,
    String? checkName,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/commits/{ref}/check-suites'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      queryParameters: {
        if (appId != null) 'app_id': [appId.toString()],
        if (checkName != null) 'check_name': [checkName],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ChecksListSuitesForRef200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
