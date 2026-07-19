// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/issues_add_assignees_request.dart';
import 'package:github/messages/issues_add_labels_request.dart';
import 'package:github/messages/issues_add_sub_issue_request.dart';
import 'package:github/messages/issues_create_comment_request.dart';
import 'package:github/messages/issues_create_label_request.dart';
import 'package:github/messages/issues_create_milestone_request.dart';
import 'package:github/messages/issues_create_request.dart';
import 'package:github/messages/issues_lock_request.dart';
import 'package:github/messages/issues_remove_assignees_request.dart';
import 'package:github/messages/issues_remove_sub_issue_request.dart';
import 'package:github/messages/issues_reprioritize_sub_issue_request.dart';
import 'package:github/messages/issues_set_labels_request.dart';
import 'package:github/messages/issues_update_comment_request.dart';
import 'package:github/messages/issues_update_label_request.dart';
import 'package:github/messages/issues_update_milestone_request.dart';
import 'package:github/messages/issues_update_request.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/issue.dart';
import 'package:github/models/issue_comment.dart';
import 'package:github/models/issue_event.dart';
import 'package:github/models/issue_event_for_issue.dart';
import 'package:github/models/issues_list_comments_for_repo_parameter3.dart';
import 'package:github/models/issues_list_for_authenticated_user_parameter0.dart';
import 'package:github/models/issues_list_for_authenticated_user_parameter1.dart';
import 'package:github/models/issues_list_for_authenticated_user_parameter3.dart';
import 'package:github/models/issues_list_for_org_parameter1.dart';
import 'package:github/models/issues_list_for_org_parameter2.dart';
import 'package:github/models/issues_list_for_org_parameter5.dart';
import 'package:github/models/issues_list_for_repo_parameter3.dart';
import 'package:github/models/issues_list_for_repo_parameter9.dart';
import 'package:github/models/issues_list_milestones_parameter2.dart';
import 'package:github/models/issues_list_milestones_parameter3.dart';
import 'package:github/models/issues_list_milestones_parameter4.dart';
import 'package:github/models/issues_list_parameter0.dart';
import 'package:github/models/issues_list_parameter1.dart';
import 'package:github/models/issues_list_parameter3.dart';
import 'package:github/models/label.dart';
import 'package:github/models/milestone.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/sort_param.dart';
import 'package:github/models/timeline_issue_events.dart';

/// Interact with GitHub Issues.
class IssuesApi {
  IssuesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List issues assigned to the authenticated user
  /// List issues assigned to the authenticated user across all visible
  /// repositories including owned repositories, member
  /// repositories, and organization repositories. You can use the `filter`
  /// query parameter to fetch issues that are not
  /// necessarily assigned to you.
  ///
  /// > [!NOTE]
  /// > GitHub's REST API considers every pull request an issue, but not every
  /// issue is a pull request. For this reason, "Issues" endpoints may return
  /// both issues and pull requests in the response. You can identify pull
  /// requests by the `pull_request` key. Be aware that the `id` of a pull
  /// request returned from "Issues" endpoints will be an _issue id_. To find
  /// out the pull request id, use the "[List pull
  /// requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)"
  /// endpoint.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<Issue>> list({
    IssuesListParameter0? filter = IssuesListParameter0.assigned,
    IssuesListParameter1? state = IssuesListParameter1.open,
    String? labels,
    IssuesListParameter3? sort = IssuesListParameter3.created,
    DirectionParam? direction = DirectionParam.desc,
    DateTime? since,
    bool? collab,
    bool? orgs,
    bool? owned,
    bool? pulls,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/issues',
      queryParameters: {
        if (filter != null) 'filter': [filter.toJson()],
        if (state != null) 'state': [state.toJson()],
        if (labels != null) 'labels': [labels],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (since != null) 'since': [since.toIso8601String()],
        if (collab != null) 'collab': [collab.toString()],
        if (orgs != null) 'orgs': [orgs.toString()],
        if (owned != null) 'owned': [owned.toString()],
        if (pulls != null) 'pulls': [pulls.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Issue>((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List organization issues assigned to the authenticated user
  /// List issues in an organization assigned to the authenticated user.
  ///
  /// > [!NOTE]
  /// > GitHub's REST API considers every pull request an issue, but not every
  /// issue is a pull request. For this reason, "Issues" endpoints may return
  /// both issues and pull requests in the response. You can identify pull
  /// requests by the `pull_request` key. Be aware that the `id` of a pull
  /// request returned from "Issues" endpoints will be an _issue id_. To find
  /// out the pull request id, use the "[List pull
  /// requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)"
  /// endpoint.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<Issue>> listForOrg(
    String org, {
    IssuesListForOrgParameter1? filter = IssuesListForOrgParameter1.assigned,
    IssuesListForOrgParameter2? state = IssuesListForOrgParameter2.open,
    String? labels,
    String? type,
    IssuesListForOrgParameter5? sort = IssuesListForOrgParameter5.created,
    DirectionParam? direction = DirectionParam.desc,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/issues'.replaceAll('{org}', Uri.encodeComponent(org)),
      queryParameters: {
        if (filter != null) 'filter': [filter.toJson()],
        if (state != null) 'state': [state.toJson()],
        if (labels != null) 'labels': [labels],
        if (type != null) 'type': [type],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (since != null) 'since': [since.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Issue>((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List assignees
  /// Lists the [available
  /// assignees](https://docs.github.com/articles/assigning-issues-and-pull-requests-to-other-github-users/)
  /// for issues in a repository.
  Future<List<SimpleUser>> listAssignees(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/assignees'
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
      return (jsonDecode(response.body) as List)
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a user can be assigned
  /// Checks if a user has permission to be assigned to an issue in this
  /// repository.
  ///
  /// If the `assignee` can be assigned to issues in the repository, a `204`
  /// header with no content is returned.
  ///
  /// Otherwise a `404` status code is returned.
  Future<void> checkUserCanBeAssigned(
    String owner,
    String repo,
    String assignee,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/assignees/{assignee}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{assignee}', Uri.encodeComponent(assignee)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repository issues
  /// List issues in a repository. Only open issues will be listed.
  ///
  /// > [!NOTE]
  /// > GitHub's REST API considers every pull request an issue, but not every
  /// issue is a pull request. For this reason, "Issues" endpoints may return
  /// both issues and pull requests in the response. You can identify pull
  /// requests by the `pull_request` key. Be aware that the `id` of a pull
  /// request returned from "Issues" endpoints will be an _issue id_. To find
  /// out the pull request id, use the "[List pull
  /// requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)"
  /// endpoint.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<Issue>> listForRepo(
    String owner,
    String repo, {
    String? milestone,
    IssuesListForRepoParameter3? state = IssuesListForRepoParameter3.open,
    String? assignee,
    String? type,
    String? creator,
    String? mentioned,
    String? labels,
    IssuesListForRepoParameter9? sort = IssuesListForRepoParameter9.created,
    DirectionParam? direction = DirectionParam.desc,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (milestone != null) 'milestone': [milestone],
        if (state != null) 'state': [state.toJson()],
        if (assignee != null) 'assignee': [assignee],
        if (type != null) 'type': [type],
        if (creator != null) 'creator': [creator],
        if (mentioned != null) 'mentioned': [mentioned],
        if (labels != null) 'labels': [labels],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (since != null) 'since': [since.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Issue>((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an issue
  /// Any user with pull access to a repository can create an issue. If
  /// [issues are disabled in the
  /// repository](https://docs.github.com/articles/disabling-issues/), the API
  /// returns a `410 Gone` status.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<Issue> create(
    String owner,
    String repo,
    IssuesCreateRequest issuesCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: issuesCreateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List issue comments for a repository
  /// You can use the REST API to list comments on issues and pull requests
  /// for a repository. Every pull request is an issue, but not every issue is
  /// a pull request.
  ///
  /// By default, issue comments are ordered by ascending ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<IssueComment>> listCommentsForRepo(
    String owner,
    String repo, {
    SortParam? sort = SortParam.created,
    IssuesListCommentsForRepoParameter3? direction,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (since != null) 'since': [since.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<IssueComment>(
            (e) => IssueComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an issue comment
  /// You can use the REST API to get comments on issues and pull requests.
  /// Every pull request is an issue, but not every issue is a pull request.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<IssueComment> getComment(
    String owner,
    String repo,
    int commentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an issue comment
  /// You can use the REST API to delete comments on issues and pull requests.
  /// Every pull request is an issue, but not every issue is a pull request.
  Future<void> deleteComment(String owner, String repo, int commentId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an issue comment
  /// You can use the REST API to update comments on issues and pull requests.
  /// Every pull request is an issue, but not every issue is a pull request.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<IssueComment> updateComment(
    String owner,
    String repo,
    int commentId,
    IssuesUpdateCommentRequest issuesUpdateCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/issues/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: issuesUpdateCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List issue events for a repository
  /// Lists events for a repository.
  Future<List<IssueEvent>> listEventsForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/events'
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
      return (jsonDecode(response.body) as List)
          .map<IssueEvent>(
            (e) => IssueEvent.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an issue event
  /// Gets a single event by the event id.
  Future<IssueEvent> getEvent(String owner, String repo, int eventId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/events/{event_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{event_id}', '$eventId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueEvent.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an issue
  /// The API returns a [`301 Moved Permanently`
  /// status](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api#follow-redirects)
  /// if the issue was
  /// [transferred](https://docs.github.com/articles/transferring-an-issue-to-another-repository/)
  /// to another repository. If
  /// the issue was transferred to or deleted from a repository where the
  /// authenticated user lacks read access, the API
  /// returns a `404 Not Found` status. If the issue was deleted from a
  /// repository where the authenticated user has read
  /// access, the API returns a `410 Gone` status. To receive webhook events
  /// for transferred and deleted issues, subscribe
  /// to the
  /// [`issues`](https://docs.github.com/webhooks/event-payloads/#issues)
  /// webhook.
  ///
  /// > [!NOTE]
  /// > GitHub's REST API considers every pull request an issue, but not every
  /// issue is a pull request. For this reason, "Issues" endpoints may return
  /// both issues and pull requests in the response. You can identify pull
  /// requests by the `pull_request` key. Be aware that the `id` of a pull
  /// request returned from "Issues" endpoints will be an _issue id_. To find
  /// out the pull request id, use the "[List pull
  /// requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)"
  /// endpoint.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<Issue> get(String owner, String repo, int issueNumber) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update an issue
  /// Issue owners and users with push access or Triage role can edit an
  /// issue.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<Issue> update(
    String owner,
    String repo,
    int issueNumber, {
    IssuesUpdateRequest? issuesUpdateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/issues/{issue_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesUpdateRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add assignees to an issue
  /// Adds up to 10 assignees to an issue. Users already assigned to an issue
  /// are not replaced.
  Future<Issue> addAssignees(
    String owner,
    String repo,
    int issueNumber, {
    IssuesAddAssigneesRequest? issuesAddAssigneesRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/assignees'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesAddAssigneesRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove assignees from an issue
  /// Removes one or more assignees from an issue.
  Future<Issue> removeAssignees(
    String owner,
    String repo,
    int issueNumber, {
    IssuesRemoveAssigneesRequest? issuesRemoveAssigneesRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/assignees'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesRemoveAssigneesRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a user can be assigned to a issue
  /// Checks if a user has permission to be assigned to a specific issue.
  ///
  /// If the `assignee` can be assigned to this issue, a `204` status code
  /// with no content is returned.
  ///
  /// Otherwise a `404` status code is returned.
  Future<void> checkUserCanBeAssignedToIssue(
    String owner,
    String repo,
    int issueNumber,
    String assignee,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber')
          .replaceAll('{assignee}', Uri.encodeComponent(assignee)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List issue comments
  /// You can use the REST API to list comments on issues and pull requests.
  /// Every pull request is an issue, but not every issue is a pull request.
  ///
  /// Issue comments are ordered by ascending ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<IssueComment>> listComments(
    String owner,
    String repo,
    int issueNumber, {
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      queryParameters: {
        if (since != null) 'since': [since.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<IssueComment>(
            (e) => IssueComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an issue comment
  /// You can use the REST API to create comments on issues and pull requests.
  /// Every pull request is an issue, but not every issue is a pull request.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting.
  /// For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<IssueComment> createComment(
    String owner,
    String repo,
    int issueNumber,
    IssuesCreateCommentRequest issuesCreateCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesCreateCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return IssueComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List issue events
  /// Lists all events for an issue.
  Future<List<IssueEventForIssue>> listEvents(
    String owner,
    String repo,
    int issueNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/events'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
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
          .map<IssueEventForIssue>(
            (e) => IssueEventForIssue.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List labels for an issue
  /// Lists all labels for an issue.
  Future<List<Label>> listLabelsOnIssue(
    String owner,
    String repo,
    int issueNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
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
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add labels to an issue
  /// Adds labels to an issue. If you provide an empty array of labels, all
  /// labels are removed from the issue.
  Future<List<Label>> addLabels(
    String owner,
    String repo,
    int issueNumber, {
    IssuesAddLabelsRequest? issuesAddLabelsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesAddLabelsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Set labels for an issue
  /// Removes any previous labels and sets the new labels for an issue.
  Future<List<Label>> setLabels(
    String owner,
    String repo,
    int issueNumber, {
    IssuesSetLabelsRequest? issuesSetLabelsRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesSetLabelsRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove all labels from an issue
  /// Removes all labels from an issue.
  Future<void> removeAllLabels(
    String owner,
    String repo,
    int issueNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a label from an issue
  /// Removes the specified label from the issue, and returns the remaining
  /// labels on the issue. This endpoint returns a `404 Not Found` status if
  /// the label does not exist.
  Future<List<Label>> removeLabel(
    String owner,
    String repo,
    int issueNumber,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/labels/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber')
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Lock an issue
  /// Users with push access can lock an issue or pull request's conversation.
  ///
  /// Note that, if you choose not to pass any parameters, you'll need to set
  /// `Content-Length` to zero when calling out to this endpoint. For more
  /// information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> lock(
    String owner,
    String repo,
    int issueNumber, {
    IssuesLockRequest? issuesLockRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/lock'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesLockRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unlock an issue
  /// Users with push access can unlock an issue's conversation.
  Future<void> unlock(String owner, String repo, int issueNumber) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/lock'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove sub-issue
  /// You can use the REST API to remove a sub-issue from an issue.
  /// Removing content too quickly using this endpoint may result in secondary
  /// rate limiting.
  /// For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass a
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<Issue> removeSubIssue(
    String owner,
    String repo,
    int issueNumber,
    IssuesRemoveSubIssueRequest issuesRemoveSubIssueRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/sub_issue'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesRemoveSubIssueRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List sub-issues
  /// You can use the REST API to list the sub-issues on an issue.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<Issue>> listSubIssues(
    String owner,
    String repo,
    int issueNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/sub_issues'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
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
          .map<Issue>((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add sub-issue
  /// You can use the REST API to add sub-issues to issues.
  ///
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting.
  /// For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<Issue> addSubIssue(
    String owner,
    String repo,
    int issueNumber,
    IssuesAddSubIssueRequest issuesAddSubIssueRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/sub_issues'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesAddSubIssueRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Reprioritize sub-issue
  /// You can use the REST API to reprioritize a sub-issue to a different
  /// position in the parent list.
  Future<Issue> reprioritizeSubIssue(
    String owner,
    String repo,
    int issueNumber,
    IssuesReprioritizeSubIssueRequest issuesReprioritizeSubIssueRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/sub_issues/priority'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: issuesReprioritizeSubIssueRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Issue.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List timeline events for an issue
  /// List all timeline events for an issue.
  Future<List<TimelineIssueEvents>> listEventsForTimeline(
    String owner,
    String repo,
    int issueNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/timeline'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
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
          .map<TimelineIssueEvents>(
            (e) => TimelineIssueEvents.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List labels for a repository
  /// Lists all labels for a repository.
  Future<List<Label>> listLabelsForRepo(
    String owner,
    String repo, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/labels'
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
      return (jsonDecode(response.body) as List)
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a label
  /// Creates a label for the specified repository with the given name and
  /// color. The name and color parameters are required. The color must be a
  /// valid [hexadecimal color code](http://www.color-hex.com/).
  Future<Label> createLabel(
    String owner,
    String repo,
    IssuesCreateLabelRequest issuesCreateLabelRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: issuesCreateLabelRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Label.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a label
  /// Gets a label using the given name.
  Future<Label> getLabel(String owner, String repo, String name) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/labels/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Label.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a label
  /// Deletes a label using the given label name.
  Future<void> deleteLabel(String owner, String repo, String name) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/labels/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a label
  /// Updates a label using the given label name.
  Future<Label> updateLabel(
    String owner,
    String repo,
    String name, {
    IssuesUpdateLabelRequest? issuesUpdateLabelRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/labels/{name}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      body: issuesUpdateLabelRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Label.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List milestones
  /// Lists milestones for a repository.
  Future<List<Milestone>> listMilestones(
    String owner,
    String repo, {
    IssuesListMilestonesParameter2? state = IssuesListMilestonesParameter2.open,
    IssuesListMilestonesParameter3? sort = IssuesListMilestonesParameter3.dueOn,
    IssuesListMilestonesParameter4? direction =
        IssuesListMilestonesParameter4.asc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/milestones'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Milestone>((e) => Milestone.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a milestone
  /// Creates a milestone.
  Future<Milestone> createMilestone(
    String owner,
    String repo,
    IssuesCreateMilestoneRequest issuesCreateMilestoneRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/milestones'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: issuesCreateMilestoneRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Milestone.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a milestone
  /// Gets a milestone using the given milestone number.
  Future<Milestone> getMilestone(
    String owner,
    String repo,
    int milestoneNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/milestones/{milestone_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{milestone_number}', '$milestoneNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Milestone.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a milestone
  /// Deletes a milestone using the given milestone number.
  Future<void> deleteMilestone(
    String owner,
    String repo,
    int milestoneNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/milestones/{milestone_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{milestone_number}', '$milestoneNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a milestone
  ///
  Future<Milestone> updateMilestone(
    String owner,
    String repo,
    int milestoneNumber, {
    IssuesUpdateMilestoneRequest? issuesUpdateMilestoneRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/milestones/{milestone_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{milestone_number}', '$milestoneNumber'),
      body: issuesUpdateMilestoneRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Milestone.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List labels for issues in a milestone
  /// Lists labels for issues in a milestone.
  Future<List<Label>> listLabelsForMilestone(
    String owner,
    String repo,
    int milestoneNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/milestones/{milestone_number}/labels'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{milestone_number}', '$milestoneNumber'),
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
          .map<Label>((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List user account issues assigned to the authenticated user
  /// List issues across owned and member repositories assigned to the
  /// authenticated user.
  ///
  /// > [!NOTE]
  /// > GitHub's REST API considers every pull request an issue, but not every
  /// issue is a pull request. For this reason, "Issues" endpoints may return
  /// both issues and pull requests in the response. You can identify pull
  /// requests by the `pull_request` key. Be aware that the `id` of a pull
  /// request returned from "Issues" endpoints will be an _issue id_. To find
  /// out the pull request id, use the "[List pull
  /// requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)"
  /// endpoint.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown body.
  /// Response will include `body`. This is the default if you do not pass any
  /// specific media type.
  /// - **`application/vnd.github.text+json`**: Returns a text only
  /// representation of the markdown body. Response will include `body_text`.
  /// - **`application/vnd.github.html+json`**: Returns HTML rendered from the
  /// body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github.full+json`**: Returns raw, text, and HTML
  /// representations. Response will include `body`, `body_text`, and
  /// `body_html`.
  Future<List<Issue>> listForAuthenticatedUser({
    IssuesListForAuthenticatedUserParameter0? filter =
        IssuesListForAuthenticatedUserParameter0.assigned,
    IssuesListForAuthenticatedUserParameter1? state =
        IssuesListForAuthenticatedUserParameter1.open,
    String? labels,
    IssuesListForAuthenticatedUserParameter3? sort =
        IssuesListForAuthenticatedUserParameter3.created,
    DirectionParam? direction = DirectionParam.desc,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/issues',
      queryParameters: {
        if (filter != null) 'filter': [filter.toJson()],
        if (state != null) 'state': [state.toJson()],
        if (labels != null) 'labels': [labels],
        if (sort != null) 'sort': [sort.toJson()],
        if (direction != null) 'direction': [direction.toJson()],
        if (since != null) 'since': [since.toIso8601String()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Issue>((e) => Issue.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
