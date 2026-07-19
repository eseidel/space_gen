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
import 'package:github/messages/reactions_create_for_commit_comment_request.dart';
import 'package:github/messages/reactions_create_for_issue_comment_request.dart';
import 'package:github/messages/reactions_create_for_issue_request.dart';
import 'package:github/messages/reactions_create_for_pull_request_review_comment_request.dart';
import 'package:github/messages/reactions_create_for_release_request.dart';
import 'package:github/messages/reactions_create_for_team_discussion_comment_in_org_request.dart';
import 'package:github/messages/reactions_create_for_team_discussion_comment_legacy_request.dart';
import 'package:github/messages/reactions_create_for_team_discussion_in_org_request.dart';
import 'package:github/messages/reactions_create_for_team_discussion_legacy_request.dart';
import 'package:github/models/reaction.dart';
import 'package:github/models/reactions_list_for_commit_comment_parameter3.dart';
import 'package:github/models/reactions_list_for_issue_comment_parameter3.dart';
import 'package:github/models/reactions_list_for_issue_parameter3.dart';
import 'package:github/models/reactions_list_for_pull_request_review_comment_parameter3.dart';
import 'package:github/models/reactions_list_for_release_parameter3.dart';
import 'package:github/models/reactions_list_for_team_discussion_comment_in_org_parameter4.dart';
import 'package:github/models/reactions_list_for_team_discussion_comment_legacy_parameter3.dart';
import 'package:github/models/reactions_list_for_team_discussion_in_org_parameter3.dart';
import 'package:github/models/reactions_list_for_team_discussion_legacy_parameter2.dart';

/// Interact with reactions to various GitHub entities.
class ReactionsApi {
  ReactionsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List reactions for a team discussion comment
  /// List the reactions to a [team discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<Reaction>> listForTeamDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber, {
    ReactionsListForTeamDiscussionCommentInOrgParameter4? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a team discussion comment
  /// Create a reaction to a [team discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).
  ///
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this team discussion comment.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `POST /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<Reaction> createForTeamDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber,
    ReactionsCreateForTeamDiscussionCommentInOrgRequest
    reactionsCreateForTeamDiscussionCommentInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      body: reactionsCreateForTeamDiscussionCommentInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete team discussion comment reaction
  /// > [!NOTE]
  /// > You can also specify a team or organization with `team_id` and
  /// `org_id` using the route `DELETE /organizations/:org_id/team/:team_id/discussions/:discussion_number/comments/:comment_number/reactions/:reaction_id`.
  ///
  /// Delete a reaction to a [team discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteForTeamDiscussionComment(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}/reactions/{reaction_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for a team discussion
  /// List the reactions to a [team
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<Reaction>> listForTeamDiscussionInOrg(
    String org,
    String teamSlug,
    int discussionNumber, {
    ReactionsListForTeamDiscussionInOrgParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a team discussion
  /// Create a reaction to a [team
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).
  ///
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this team discussion.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `POST /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<Reaction> createForTeamDiscussionInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    ReactionsCreateForTeamDiscussionInOrgRequest
    reactionsCreateForTeamDiscussionInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber'),
      body: reactionsCreateForTeamDiscussionInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete team discussion reaction
  /// > [!NOTE]
  /// > You can also specify a team or organization with `team_id` and
  /// `org_id` using the route `DELETE /organizations/:org_id/team/:team_id/discussions/:discussion_number/reactions/:reaction_id`.
  ///
  /// Delete a reaction to a [team
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteForTeamDiscussion(
    String org,
    String teamSlug,
    int discussionNumber,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/reactions/{reaction_id}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for a commit comment
  /// List the reactions to a [commit
  /// comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment).
  Future<List<Reaction>> listForCommitComment(
    String owner,
    String repo,
    int commentId, {
    ReactionsListForCommitCommentParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a commit comment
  /// Create a reaction to a [commit
  /// comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment).
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this commit comment.
  Future<Reaction> createForCommitComment(
    String owner,
    String repo,
    int commentId,
    ReactionsCreateForCommitCommentRequest
    reactionsCreateForCommitCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: reactionsCreateForCommitCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a commit comment reaction
  /// > [!NOTE]
  /// > You can also specify a repository by `repository_id` using the route
  /// `DELETE /repositories/:repository_id/comments/:comment_id/reactions/:reaction_id`.
  ///
  /// Delete a reaction to a [commit
  /// comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment).
  Future<void> deleteForCommitComment(
    String owner,
    String repo,
    int commentId,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{comment_id}', '$commentId')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for an issue comment
  /// List the reactions to an [issue
  /// comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment).
  Future<List<Reaction>> listForIssueComment(
    String owner,
    String repo,
    int commentId, {
    ReactionsListForIssueCommentParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for an issue comment
  /// Create a reaction to an [issue
  /// comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment).
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this issue comment.
  Future<Reaction> createForIssueComment(
    String owner,
    String repo,
    int commentId,
    ReactionsCreateForIssueCommentRequest reactionsCreateForIssueCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: reactionsCreateForIssueCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an issue comment reaction
  /// > [!NOTE]
  /// > You can also specify a repository by `repository_id` using the route
  /// `DELETE delete /repositories/:repository_id/issues/comments/:comment_id/reactions/:reaction_id`.
  ///
  /// Delete a reaction to an [issue
  /// comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment).
  Future<void> deleteForIssueComment(
    String owner,
    String repo,
    int commentId,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{comment_id}', '$commentId')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for an issue
  /// List the reactions to an
  /// [issue](https://docs.github.com/rest/issues/issues#get-an-issue).
  Future<List<Reaction>> listForIssue(
    String owner,
    String repo,
    int issueNumber, {
    ReactionsListForIssueParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for an issue
  /// Create a reaction to an
  /// [issue](https://docs.github.com/rest/issues/issues#get-an-issue). A
  /// response with an HTTP `200` status means that you already added the
  /// reaction type to this issue.
  Future<Reaction> createForIssue(
    String owner,
    String repo,
    int issueNumber,
    ReactionsCreateForIssueRequest reactionsCreateForIssueRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/issues/{issue_number}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{issue_number}', '$issueNumber'),
      body: reactionsCreateForIssueRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an issue reaction
  /// > [!NOTE]
  /// > You can also specify a repository by `repository_id` using the route
  /// `DELETE /repositories/:repository_id/issues/:issue_number/reactions/:reaction_id`.
  ///
  /// Delete a reaction to an
  /// [issue](https://docs.github.com/rest/issues/issues#get-an-issue).
  Future<void> deleteForIssue(
    String owner,
    String repo,
    int issueNumber,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{issue_number}', '$issueNumber')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for a pull request review comment
  /// List the reactions to a [pull request review
  /// comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request).
  Future<List<Reaction>> listForPullRequestReviewComment(
    String owner,
    String repo,
    int commentId, {
    ReactionsListForPullRequestReviewCommentParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a pull request review comment
  /// Create a reaction to a [pull request review
  /// comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request).
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this pull request review comment.
  Future<Reaction> createForPullRequestReviewComment(
    String owner,
    String repo,
    int commentId,
    ReactionsCreateForPullRequestReviewCommentRequest
    reactionsCreateForPullRequestReviewCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{comment_id}', '$commentId'),
      body: reactionsCreateForPullRequestReviewCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a pull request comment reaction
  /// > [!NOTE]
  /// > You can also specify a repository by `repository_id` using the route
  /// `DELETE /repositories/:repository_id/pulls/comments/:comment_id/reactions/:reaction_id.`
  ///
  /// Delete a reaction to a [pull request review
  /// comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request).
  Future<void> deleteForPullRequestComment(
    String owner,
    String repo,
    int commentId,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{comment_id}', '$commentId')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for a release
  /// List the reactions to a
  /// [release](https://docs.github.com/rest/releases/releases#get-a-release).
  Future<List<Reaction>> listForRelease(
    String owner,
    String repo,
    int releaseId, {
    ReactionsListForReleaseParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/releases/{release_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a release
  /// Create a reaction to a
  /// [release](https://docs.github.com/rest/releases/releases#get-a-release).
  /// A response with a `Status: 200 OK` means that you already added the
  /// reaction type to this release.
  Future<Reaction> createForRelease(
    String owner,
    String repo,
    int releaseId,
    ReactionsCreateForReleaseRequest reactionsCreateForReleaseRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/releases/{release_id}/reactions'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{release_id}', '$releaseId'),
      body: reactionsCreateForReleaseRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a release reaction
  /// > [!NOTE]
  /// > You can also specify a repository by `repository_id` using the route
  /// `DELETE delete /repositories/:repository_id/releases/:release_id/reactions/:reaction_id`.
  ///
  /// Delete a reaction to a
  /// [release](https://docs.github.com/rest/releases/releases#get-a-release).
  Future<void> deleteForRelease(
    String owner,
    String repo,
    int releaseId,
    int reactionId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}'
              .replaceAll('{owner}', Uri.encodeComponent(owner))
              .replaceAll('{repo}', Uri.encodeComponent(repo))
              .replaceAll('{release_id}', '$releaseId')
              .replaceAll('{reaction_id}', '$reactionId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List reactions for a team discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List reactions for a team discussion comment`](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion-comment)
  /// endpoint.
  ///
  /// List the reactions to a [team discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<Reaction>> listForTeamDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    int commentNumber, {
    ReactionsListForTeamDiscussionCommentLegacyParameter3? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}/reactions'
              .replaceAll('{team_id}', '$teamId')
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a team discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new "[Create reaction for a team discussion
  /// comment](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion-comment)"
  /// endpoint.
  ///
  /// Create a reaction to a [team discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment).
  ///
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this team discussion comment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<Reaction> createForTeamDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    int commentNumber,
    ReactionsCreateForTeamDiscussionCommentLegacyRequest
    reactionsCreateForTeamDiscussionCommentLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}/reactions'
              .replaceAll('{team_id}', '$teamId')
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      body: reactionsCreateForTeamDiscussionCommentLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List reactions for a team discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List reactions for a team discussion`](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-team-discussion)
  /// endpoint.
  ///
  /// List the reactions to a [team
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<Reaction>> listForTeamDiscussionLegacy(
    int teamId,
    int discussionNumber, {
    ReactionsListForTeamDiscussionLegacyParameter2? content,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/discussions/{discussion_number}/reactions'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
      queryParameters: {
        if (content != null) 'content': [content.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Reaction>((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create reaction for a team discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`Create reaction for a team discussion`](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-team-discussion)
  /// endpoint.
  ///
  /// Create a reaction to a [team
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion).
  ///
  /// A response with an HTTP `200` status means that you already added the
  /// reaction type to this team discussion.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<Reaction> createForTeamDiscussionLegacy(
    int teamId,
    int discussionNumber,
    ReactionsCreateForTeamDiscussionLegacyRequest
    reactionsCreateForTeamDiscussionLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/teams/{team_id}/discussions/{discussion_number}/reactions'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
      body: reactionsCreateForTeamDiscussionLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Reaction.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
