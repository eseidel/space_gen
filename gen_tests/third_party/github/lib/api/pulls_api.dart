// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/pull_request.dart';
import 'package:github/messages/pull_request_review_request.dart';
import 'package:github/messages/pulls_create_reply_for_review_comment_request.dart';
import 'package:github/messages/pulls_create_request.dart';
import 'package:github/messages/pulls_create_review_comment_request.dart';
import 'package:github/messages/pulls_create_review_request.dart';
import 'package:github/messages/pulls_dismiss_review_request.dart';
import 'package:github/messages/pulls_merge_request.dart';
import 'package:github/messages/pulls_remove_requested_reviewers_request.dart';
import 'package:github/messages/pulls_request_reviewers_request.dart';
import 'package:github/messages/pulls_submit_review_request.dart';
import 'package:github/messages/pulls_update_branch202_response.dart';
import 'package:github/messages/pulls_update_branch_request.dart';
import 'package:github/messages/pulls_update_request.dart';
import 'package:github/messages/pulls_update_review_comment_request.dart';
import 'package:github/messages/pulls_update_review_request.dart';
import 'package:github/models/commit.dart';
import 'package:github/models/diff_entry.dart';
import 'package:github/models/pull_request_merge_result.dart';
import 'package:github/models/pull_request_review.dart';
import 'package:github/models/pull_request_review_comment.dart';
import 'package:github/models/pull_request_simple.dart';
import 'package:github/models/pulls_list_parameter2.dart';
import 'package:github/models/pulls_list_parameter5.dart';
import 'package:github/models/pulls_list_parameter6.dart';
import 'package:github/models/pulls_list_review_comments_for_repo_parameter2.dart';
import 'package:github/models/pulls_list_review_comments_for_repo_parameter3.dart';
import 'package:github/models/pulls_list_review_comments_parameter4.dart';
import 'package:github/models/review_comment.dart';
import 'package:github/models/sort_param.dart';

/// Interact with GitHub Pull Requests.
class PullsApi {
  PullsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List pull requests
  /// Lists pull requests in a specified repository.
  ///
  /// Draft pull requests are available in public repositories with GitHub
  /// Free and GitHub Free for organizations, GitHub Pro, and legacy
  /// per-repository billing
  /// plans, and in public and private repositories with GitHub Team and
  /// GitHub Enterprise
  /// Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
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
  Future<List<PullRequestSimple>> list(
    String owner,
    String repo, {
    PullsListParameter2? state = .open,
    String? head,
    String? base,
    PullsListParameter5? sort = .created,
    PullsListParameter6? direction,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (head != null) 'head': [head],
        if (base != null) 'base': [base],
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
          .map<PullRequestSimple>(
            (e) => PullRequestSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a pull request
  /// Draft pull requests are available in public repositories with GitHub
  /// Free and GitHub Free for organizations, GitHub Pro, and legacy
  /// per-repository billing plans, and in public and private repositories
  /// with GitHub Team and GitHub Enterprise Cloud. For more information, see
  /// [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// To open or update a pull request in a public repository, you must have
  /// write access to the head or the source branch. For organization-owned
  /// repositories, you must be a member of the organization that owns the
  /// repository to open or update a pull request.
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
  Future<PullRequest> create(
    String owner,
    String repo,
    PullsCreateRequest pullsCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: pullsCreateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequest.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List review comments in a repository
  /// Lists review comments for all pull requests in a repository. By default,
  /// review comments are in ascending order by ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<PullRequestReviewComment>> listReviewCommentsForRepo(
    String owner,
    String repo, {
    PullsListReviewCommentsForRepoParameter2? sort,
    PullsListReviewCommentsForRepoParameter3? direction,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/comments'
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
          .map<PullRequestReviewComment>(
            (e) => PullRequestReviewComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a review comment for a pull request
  /// Provides details for a specified review comment.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReviewComment> getReviewComment(
    String owner,
    String repo,
    int commentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReviewComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a review comment for a pull request
  /// Deletes a review comment.
  Future<void> deleteReviewComment(
    String owner,
    String repo,
    int commentId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/pulls/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a review comment for a pull request
  /// Edits the content of a specified review comment.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReviewComment> updateReviewComment(
    String owner,
    String repo,
    int commentId,
    PullsUpdateReviewCommentRequest pullsUpdateReviewCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/pulls/comments/{comment_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: pullsUpdateReviewCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReviewComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a pull request
  /// Draft pull requests are available in public repositories with GitHub
  /// Free and GitHub Free for organizations, GitHub Pro, and legacy
  /// per-repository billing plans, and in public and private repositories
  /// with GitHub Team and GitHub Enterprise Cloud. For more information, see
  /// [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// Lists details of a pull request by providing its number.
  ///
  /// When you get,
  /// [create](https://docs.github.com/rest/pulls/pulls/#create-a-pull-request),
  /// or
  /// [edit](https://docs.github.com/rest/pulls/pulls#update-a-pull-request) a
  /// pull request, GitHub creates a merge commit to test whether the pull
  /// request can be automatically merged into the base branch. This test
  /// commit is not added to the base branch or the head branch. You can
  /// review the status of the test commit using the `mergeable` key. For more
  /// information, see "[Checking mergeability of pull
  /// requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".
  ///
  /// The value of the `mergeable` attribute can be `true`, `false`, or
  /// `null`. If the value is `null`, then GitHub has started a background job
  /// to compute the mergeability. After giving the job time to complete,
  /// resubmit the request. When the job finishes, you will see a non-`null`
  /// value for the `mergeable` attribute in the response. If `mergeable` is
  /// `true`, then `merge_commit_sha` will be the SHA of the _test_ merge
  /// commit.
  ///
  /// The value of the `merge_commit_sha` attribute changes depending on the
  /// state of the pull request. Before merging a pull request, the
  /// `merge_commit_sha` attribute holds the SHA of the _test_ merge commit.
  /// After merging a pull request, the `merge_commit_sha` attribute changes
  /// depending on how you merged the pull request:
  ///
  /// *   If merged as a [merge
  /// commit](https://docs.github.com/articles/about-merge-methods-on-github/),
  /// `merge_commit_sha` represents the SHA of the merge commit.
  /// *   If merged via a
  /// [squash](https://docs.github.com/articles/about-merge-methods-on-github/#squashing-your-merge-commits),
  /// `merge_commit_sha` represents the SHA of the squashed commit on the base
  /// branch.
  /// *   If
  /// [rebased](https://docs.github.com/articles/about-merge-methods-on-github/#rebasing-and-merging-your-commits),
  /// `merge_commit_sha` represents the commit that the base branch was
  /// updated to.
  ///
  /// Pass the appropriate [media
  /// type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)
  /// to fetch diff and patch formats.
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
  /// - **`application/vnd.github.diff`**: For more information, see
  /// "[git-diff](https://git-scm.com/docs/git-diff)" in the Git
  /// documentation. If a diff is corrupt, contact us through the [GitHub
  /// Support portal](https://support.github.com/). Include the repository
  /// name and pull request ID in your message.
  Future<PullRequest> get(String owner, String repo, int pullNumber) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequest.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a pull request
  /// Draft pull requests are available in public repositories with GitHub
  /// Free and GitHub Free for organizations, GitHub Pro, and legacy
  /// per-repository billing plans, and in public and private repositories
  /// with GitHub Team and GitHub Enterprise Cloud. For more information, see
  /// [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// To open or update a pull request in a public repository, you must have
  /// write access to the head or the source branch. For organization-owned
  /// repositories, you must be a member of the organization that owns the
  /// repository to open or update a pull request.
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
  Future<PullRequest> update(
    String owner,
    String repo,
    int pullNumber, {
    PullsUpdateRequest? pullsUpdateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsUpdateRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequest.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List review comments on a pull request
  /// Lists all review comments for a specified pull request. By default,
  /// review comments
  /// are in ascending order by ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<PullRequestReviewComment>> listReviewComments(
    String owner,
    String repo,
    int pullNumber, {
    SortParam? sort = .created,
    PullsListReviewCommentsParameter4? direction,
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
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
          .map<PullRequestReviewComment>(
            (e) => PullRequestReviewComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a review comment for a pull request
  /// Creates a review comment on the diff of a specified pull request. To add
  /// a regular comment to a pull request timeline, see "[Create an issue
  /// comment](https://docs.github.com/rest/issues/comments#create-an-issue-comment)."
  ///
  /// If your comment applies to more than one line in the pull request diff,
  /// you should use the parameters `line`, `side`, and optionally
  /// `start_line` and `start_side` in your request.
  ///
  /// The `position` parameter is closing down. If you use `position`, the
  /// `line`, `side`, `start_line`, and `start_side` parameters are not
  /// required.
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
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReviewComment> createReviewComment(
    String owner,
    String repo,
    int pullNumber,
    PullsCreateReviewCommentRequest pullsCreateReviewCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/comments'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsCreateReviewCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReviewComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a reply for a review comment
  /// Creates a reply to a review comment for a pull request. For the
  /// `comment_id`, provide the ID of the review comment you are replying to.
  /// This must be the ID of a _top-level review comment_, not a reply to that
  /// comment. Replies to replies are not supported.
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
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReviewComment> createReplyForReviewComment(
    String owner,
    String repo,
    int pullNumber,
    int commentId,
    PullsCreateReplyForReviewCommentRequest
    pullsCreateReplyForReviewCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/pulls/{pull_number}/comments/{comment_id}/replies'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{pull_number}', '$pullNumber')
              .replaceAll('{comment_id}', '$commentId'),
      body: pullsCreateReplyForReviewCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReviewComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List commits on a pull request
  /// Lists a maximum of 250 commits for a pull request. To receive a complete
  /// commit list for pull requests with more than 250 commits, use the [List
  /// commits](https://docs.github.com/rest/commits/commits#list-commits)
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
  Future<List<Commit>> listCommits(
    String owner,
    String repo,
    int pullNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/commits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
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
          .map<Commit>((e) => Commit.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List pull requests files
  /// Lists the files in a specified pull request.
  ///
  /// > [!NOTE]
  /// > Responses include a maximum of 3000 files. The paginated response
  /// returns 30 files per page by default.
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
  Future<List<DiffEntry>> listFiles(
    String owner,
    String repo,
    int pullNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/files'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
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
          .map<DiffEntry>((e) => DiffEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a pull request has been merged
  /// Checks if a pull request has been merged into the base branch. The HTTP
  /// status of the response indicates whether or not the pull request has
  /// been merged; the response body is empty.
  Future<void> checkIfMerged(String owner, String repo, int pullNumber) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/merge'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Merge a pull request
  /// Merges a pull request into the base branch.
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  Future<PullRequestMergeResult> merge(
    String owner,
    String repo,
    int pullNumber, {
    PullsMergeRequest? pullsMergeRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/merge'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsMergeRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestMergeResult.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all requested reviewers for a pull request
  /// Gets the users or teams whose review is requested for a pull request.
  /// Once a requested reviewer submits a review, they are no longer
  /// considered a requested reviewer. Their review will instead be returned
  /// by the [List reviews for a pull
  /// request](https://docs.github.com/rest/pulls/reviews#list-reviews-for-a-pull-request)
  /// operation.
  Future<PullRequestReviewRequest> listRequestedReviewers(
    String owner,
    String repo,
    int pullNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReviewRequest.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Request reviewers for a pull request
  /// Requests reviews for a pull request from a given set of users and/or
  /// teams.
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  Future<PullRequestSimple> requestReviewers(
    String owner,
    String repo,
    int pullNumber, {
    PullsRequestReviewersRequest? pullsRequestReviewersRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsRequestReviewersRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove requested reviewers from a pull request
  /// Removes review requests from a pull request for a given set of users
  /// and/or teams.
  Future<PullRequestSimple> removeRequestedReviewers(
    String owner,
    String repo,
    int pullNumber,
    PullsRemoveRequestedReviewersRequest pullsRemoveRequestedReviewersRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsRemoveRequestedReviewersRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List reviews for a pull request
  /// Lists all reviews for a specified pull request. The list of reviews
  /// returns in chronological order.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<PullRequestReview>> listReviews(
    String owner,
    String repo,
    int pullNumber, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/reviews'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
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
          .map<PullRequestReview>(
            (e) => PullRequestReview.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a review for a pull request
  /// Creates a review on a specified pull request.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// Pull request reviews created in the `PENDING` state are not submitted
  /// and therefore do not include the `submitted_at` property in the
  /// response. To create a pending review for a pull request, leave the
  /// `event` parameter blank. For more information about submitting a
  /// `PENDING` review, see "[Submit a review for a pull
  /// request](https://docs.github.com/rest/pulls/reviews#submit-a-review-for-a-pull-request)."
  ///
  /// > [!NOTE]
  /// > To comment on a specific line in a file, you need to first determine
  /// the position of that line in the diff. To see a pull request diff, add
  /// the `application/vnd.github.v3.diff` media type to the `Accept` header
  /// of a call to the [Get a pull
  /// request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request)
  /// endpoint.
  ///
  /// The `position` value equals the number of lines down from the first "@@"
  /// hunk header in the file you want to add a comment. The line just below
  /// the "@@" line is position 1, the next line is position 2, and so on. The
  /// position in the diff continues to increase through lines of whitespace
  /// and additional hunks until the beginning of a new file.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> createReview(
    String owner,
    String repo,
    int pullNumber, {
    PullsCreateReviewRequest? pullsCreateReviewRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/reviews'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsCreateReviewRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a review for a pull request
  /// Retrieves a pull request review by its ID.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> getReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber')
          .replaceAll('{review_id}', '$reviewId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a review for a pull request
  /// Updates the contents of a specified review summary comment.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> updateReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId,
    PullsUpdateReviewRequest pullsUpdateReviewRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber')
          .replaceAll('{review_id}', '$reviewId'),
      body: pullsUpdateReviewRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a pending review for a pull request
  /// Deletes a pull request review that has not been submitted. Submitted
  /// reviews cannot be deleted.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> deletePendingReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber')
          .replaceAll('{review_id}', '$reviewId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List comments for a pull request review
  /// Lists comments for a specific pull request review.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<List<ReviewComment>> listCommentsForReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{pull_number}', '$pullNumber')
              .replaceAll('{review_id}', '$reviewId'),
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
          .map<ReviewComment>(
            (e) => ReviewComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Dismiss a review for a pull request
  /// Dismisses a specified review on a pull request.
  ///
  /// > [!NOTE]
  /// > To dismiss a pull request review on a [protected
  /// branch](https://docs.github.com/rest/branches/branch-protection), you
  /// must be a repository administrator or be included in the list of people
  /// or teams who can dismiss pull request reviews.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> dismissReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId,
    PullsDismissReviewRequest pullsDismissReviewRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path:
          '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/dismissals'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{pull_number}', '$pullNumber')
              .replaceAll('{review_id}', '$reviewId'),
      body: pullsDismissReviewRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Submit a review for a pull request
  /// Submits a pending review for a pull request. For more information about
  /// creating a pending review for a pull request, see "[Create a review for
  /// a pull
  /// request](https://docs.github.com/rest/pulls/reviews#create-a-review-for-a-pull-request)."
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw
  /// markdown body. Response will include `body`. This is the default if you
  /// do not pass any specific media type.
  /// - **`application/vnd.github-commitcomment.text+json`**: Returns a text
  /// only representation of the markdown body. Response will include
  /// `body_text`.
  /// - **`application/vnd.github-commitcomment.html+json`**: Returns HTML
  /// rendered from the body's markdown. Response will include `body_html`.
  /// - **`application/vnd.github-commitcomment.full+json`**: Returns raw,
  /// text, and HTML representations. Response will include `body`,
  /// `body_text`, and `body_html`.
  Future<PullRequestReview> submitReview(
    String owner,
    String repo,
    int pullNumber,
    int reviewId,
    PullsSubmitReviewRequest pullsSubmitReviewRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{pull_number}', '$pullNumber')
              .replaceAll('{review_id}', '$reviewId'),
      body: pullsSubmitReviewRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullRequestReview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update a pull request branch
  /// Updates the pull request branch with the latest upstream changes by
  /// merging HEAD from the base branch into the pull request branch.
  /// Note: If making a request on behalf of a GitHub App you must also have
  /// permissions to write the contents of the head repository.
  Future<PullsUpdateBranch202Response> updateBranch(
    String owner,
    String repo,
    int pullNumber, {
    PullsUpdateBranchRequest? pullsUpdateBranchRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/pulls/{pull_number}/update-branch'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{pull_number}', '$pullNumber'),
      body: pullsUpdateBranchRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PullsUpdateBranch202Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
