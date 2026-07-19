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
import 'package:github/messages/teams_add_or_update_membership_for_user_in_org_request.dart';
import 'package:github/messages/teams_add_or_update_membership_for_user_legacy_request.dart';
import 'package:github/messages/teams_add_or_update_project_permissions_in_org_request.dart';
import 'package:github/messages/teams_add_or_update_project_permissions_legacy_request.dart';
import 'package:github/messages/teams_add_or_update_repo_permissions_in_org_request.dart';
import 'package:github/messages/teams_add_or_update_repo_permissions_legacy_request.dart';
import 'package:github/messages/teams_create_discussion_comment_in_org_request.dart';
import 'package:github/messages/teams_create_discussion_comment_legacy_request.dart';
import 'package:github/messages/teams_create_discussion_in_org_request.dart';
import 'package:github/messages/teams_create_discussion_legacy_request.dart';
import 'package:github/messages/teams_create_request.dart';
import 'package:github/messages/teams_update_discussion_comment_in_org_request.dart';
import 'package:github/messages/teams_update_discussion_comment_legacy_request.dart';
import 'package:github/messages/teams_update_discussion_in_org_request.dart';
import 'package:github/messages/teams_update_discussion_legacy_request.dart';
import 'package:github/messages/teams_update_in_org_request.dart';
import 'package:github/messages/teams_update_legacy_request.dart';
import 'package:github/models/direction_param.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/organization_invitation.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/team.dart';
import 'package:github/models/team_discussion.dart';
import 'package:github/models/team_discussion_comment.dart';
import 'package:github/models/team_full.dart';
import 'package:github/models/team_membership.dart';
import 'package:github/models/team_project.dart';
import 'package:github/models/team_repository.dart';
import 'package:github/models/teams_list_members_in_org_parameter2.dart';
import 'package:github/models/teams_list_members_legacy_parameter1.dart';
import 'package:meta/meta.dart';

sealed class TeamsCheckPermissionsForRepoInOrgResponse {
  const TeamsCheckPermissionsForRepoInOrgResponse();
}

@immutable
final class TeamsCheckPermissionsForRepoInOrgResponse200
    extends TeamsCheckPermissionsForRepoInOrgResponse {
  const TeamsCheckPermissionsForRepoInOrgResponse200(this.value);

  final TeamRepository value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCheckPermissionsForRepoInOrgResponse200 &&
        value == other.value;
  }
}

@immutable
final class TeamsCheckPermissionsForRepoInOrgResponse204
    extends TeamsCheckPermissionsForRepoInOrgResponse {
  const TeamsCheckPermissionsForRepoInOrgResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is TeamsCheckPermissionsForRepoInOrgResponse204;
}

sealed class TeamsCheckPermissionsForRepoLegacyResponse {
  const TeamsCheckPermissionsForRepoLegacyResponse();
}

@immutable
final class TeamsCheckPermissionsForRepoLegacyResponse200
    extends TeamsCheckPermissionsForRepoLegacyResponse {
  const TeamsCheckPermissionsForRepoLegacyResponse200(this.value);

  final TeamRepository value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TeamsCheckPermissionsForRepoLegacyResponse200 &&
        value == other.value;
  }
}

@immutable
final class TeamsCheckPermissionsForRepoLegacyResponse204
    extends TeamsCheckPermissionsForRepoLegacyResponse {
  const TeamsCheckPermissionsForRepoLegacyResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) =>
      other is TeamsCheckPermissionsForRepoLegacyResponse204;
}

/// Interact with GitHub Teams.
class TeamsApi {
  TeamsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List teams
  /// Lists all teams in an organization that are visible to the authenticated
  /// user.
  Future<List<Team>> list(
    String org, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams'.replaceAll('{org}', Uri.encodeComponent(org)),
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
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a team
  /// To create a team, the authenticated user must be a member or owner of
  /// `{org}`. By default, organization members can create teams. Organization
  /// owners can limit team creation to organization owners. For more
  /// information, see "[Setting team creation
  /// permissions](https://docs.github.com/articles/setting-team-creation-permissions-in-your-organization)."
  ///
  /// When you create a new team, you automatically become a team maintainer
  /// without explicitly adding yourself to the optional array of
  /// `maintainers`. For more information, see "[About
  /// teams](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/about-teams)".
  Future<TeamFull> create(
    String org,
    TeamsCreateRequest teamsCreateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/teams'.replaceAll('{org}', Uri.encodeComponent(org)),
      body: teamsCreateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a team by name
  /// Gets a team using the team's `slug`. To create the `slug`, GitHub
  /// replaces special characters in the `name` string, changes all words to
  /// lowercase, and replaces spaces with a `-` separator. For example, `"My TEam Näme"`
  /// would become `my-team-name`.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}`.
  Future<TeamFull> getByName(String org, String teamSlug) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a team
  /// To delete a team, the authenticated user must be an organization owner
  /// or team maintainer.
  ///
  /// If you are an organization owner, deleting a parent team will delete all
  /// of its child teams as well.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `DELETE /organizations/{org_id}/team/{team_id}`.
  Future<void> deleteInOrg(String org, String teamSlug) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a team
  /// To edit a team, the authenticated user must either be an organization
  /// owner or a team maintainer.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `PATCH /organizations/{org_id}/team/{team_id}`.
  Future<TeamFull> updateInOrg(
    String org,
    String teamSlug, {
    TeamsUpdateInOrgRequest? teamsUpdateInOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/teams/{team_slug}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
      body: teamsUpdateInOrgRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List discussions
  /// List all discussions on a team's page.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/discussions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<TeamDiscussion>> listDiscussionsInOrg(
    String org,
    String teamSlug, {
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
    String? pinned,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/discussions'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
      queryParameters: {
        if (direction != null) 'direction': [direction.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (pinned != null) 'pinned': [pinned],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<TeamDiscussion>(
            (e) => TeamDiscussion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a discussion
  /// Creates a new discussion post on a team's page.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `POST /organizations/{org_id}/team/{team_id}/discussions`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussion> createDiscussionInOrg(
    String org,
    String teamSlug,
    TeamsCreateDiscussionInOrgRequest teamsCreateDiscussionInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/teams/{team_slug}/discussions'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
      body: teamsCreateDiscussionInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a discussion
  /// Get a specific discussion on a team's page.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<TeamDiscussion> getDiscussionInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{discussion_number}', '$discussionNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a discussion
  /// Delete a discussion from a team's page.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `DELETE /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteDiscussionInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{discussion_number}', '$discussionNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a discussion
  /// Edits the title and body text of a discussion post. Only the parameters
  /// you provide are updated.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `PATCH /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussion> updateDiscussionInOrg(
    String org,
    String teamSlug,
    int discussionNumber, {
    TeamsUpdateDiscussionInOrgRequest? teamsUpdateDiscussionInOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{discussion_number}', '$discussionNumber'),
      body: teamsUpdateDiscussionInOrgRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List discussion comments
  /// List all comments on a team discussion.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<TeamDiscussionComment>> listDiscussionCommentsInOrg(
    String org,
    String teamSlug,
    int discussionNumber, {
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber'),
      queryParameters: {
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
          .map<TeamDiscussionComment>(
            (e) => TeamDiscussionComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a discussion comment
  /// Creates a new comment on a team discussion.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `POST /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> createDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    TeamsCreateDiscussionCommentInOrgRequest
    teamsCreateDiscussionCommentInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber'),
      body: teamsCreateDiscussionCommentInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a discussion comment
  /// Get a specific comment on a team discussion.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> getDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a discussion comment
  /// Deletes a comment on a team discussion.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `DELETE /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a discussion comment
  /// Edits the body text of a discussion comment.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `PATCH /organizations/{org_id}/team/{team_id}/discussions/{discussion_number}/comments/{comment_number}`.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> updateDiscussionCommentInOrg(
    String org,
    String teamSlug,
    int discussionNumber,
    int commentNumber,
    TeamsUpdateDiscussionCommentInOrgRequest
    teamsUpdateDiscussionCommentInOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/orgs/{org}/teams/{team_slug}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{org}', Uri.encodeComponent(org))
              .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      body: teamsUpdateDiscussionCommentInOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List pending team invitations
  /// The return hash contains a `role` field which refers to the Organization
  /// Invitation role and will be one of the following values:
  /// `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or
  /// `reinstate`. If the invitee is not a GitHub member, the `login` field in
  /// the return hash will be `null`.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/invitations`.
  Future<List<OrganizationInvitation>> listPendingInvitationsInOrg(
    String org,
    String teamSlug, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/invitations'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
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
          .map<OrganizationInvitation>(
            (e) => OrganizationInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List team members
  /// Team members will include the members of child teams.
  ///
  /// To list members in a team, the team must be visible to the authenticated
  /// user.
  Future<List<SimpleUser>> listMembersInOrg(
    String org,
    String teamSlug, {
    TeamsListMembersInOrgParameter2? role = TeamsListMembersInOrgParameter2.all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/members'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
      queryParameters: {
        if (role != null) 'role': [role.toJson()],
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

  /// Get team membership for a user
  /// Team members will include the members of child teams.
  ///
  /// To get a user's membership with a team, the team must be visible to the
  /// authenticated user.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/memberships/{username}`.
  ///
  /// > [!NOTE]
  /// > The response contains the `state` of the membership and the member's
  /// `role`.
  ///
  /// The `role` for organization owners is set to `maintainer`. For more
  /// information about `maintainer` roles, see [Create a
  /// team](https://docs.github.com/rest/teams/teams#create-a-team).
  Future<TeamMembership> getMembershipForUserInOrg(
    String org,
    String teamSlug,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add or update team membership for a user
  /// Adds an organization member to a team. An authenticated organization
  /// owner or team maintainer can add organization members to a team.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  ///
  /// An organization owner can add someone who is not part of the team's
  /// organization to a team. When an organization owner adds someone to a
  /// team who is not an organization member, this endpoint will send an
  /// invitation to the person via email. This newly-created membership will
  /// be in the "pending" state until the person accepts the invitation, at
  /// which point the membership will transition to the "active" state and the
  /// user will be added as a member of the team.
  ///
  /// If the user is already a member of the team, this endpoint will update
  /// the role of the team member's role. To update the membership of a team
  /// member, the authenticated user must be an organization owner or a team
  /// maintainer.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `PUT /organizations/{org_id}/team/{team_id}/memberships/{username}`.
  Future<TeamMembership> addOrUpdateMembershipForUserInOrg(
    String org,
    String teamSlug,
    String username, {
    TeamsAddOrUpdateMembershipForUserInOrgRequest?
    teamsAddOrUpdateMembershipForUserInOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/teams/{team_slug}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: teamsAddOrUpdateMembershipForUserInOrgRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove team membership for a user
  /// To remove a membership between a user and a team, the authenticated user
  /// must have 'admin' permissions to the team or be an owner of the
  /// organization that the team is associated with. Removing team membership
  /// does not delete the user, it just removes their membership from the
  /// team.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `DELETE /organizations/{org_id}/team/{team_id}/memberships/{username}`.
  Future<void> removeMembershipForUserInOrg(
    String org,
    String teamSlug,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/teams/{team_slug}/memberships/{username}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List team projects
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<TeamProject>> listProjectsInOrg(
    String org,
    String teamSlug, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/projects'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
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
          .map<TeamProject>(
            (e) => TeamProject.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check team permissions for a project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<TeamProject> checkPermissionsForProjectInOrg(
    String org,
    String teamSlug,
    int projectId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/projects/{project_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamProject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add or update team project permissions
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> addOrUpdateProjectPermissionsInOrg(
    String org,
    String teamSlug,
    int projectId, {
    TeamsAddOrUpdateProjectPermissionsInOrgRequest?
    teamsAddOrUpdateProjectPermissionsInOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/teams/{team_slug}/projects/{project_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{project_id}', '$projectId'),
      body: teamsAddOrUpdateProjectPermissionsInOrgRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a project from a team
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> removeProjectInOrg(
    String org,
    String teamSlug,
    int projectId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/teams/{team_slug}/projects/{project_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List team repositories
  /// Lists a team's repositories visible to the authenticated user.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/repos`.
  Future<List<MinimalRepository>> listReposInOrg(
    String org,
    String teamSlug, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/repos'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
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
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check team permissions for a repository
  /// Checks whether a team has `admin`, `push`, `maintain`, `triage`, or
  /// `pull` permission for a repository. Repositories inherited through a
  /// parent team will also be checked.
  ///
  /// You can also get information about the specified repository, including
  /// what permissions the team grants on it, by passing the following custom
  /// [media
  /// type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/)
  /// via the `application/vnd.github.v3.repository+json` accept header.
  ///
  /// If a team doesn't have permission for the repository, you will receive a
  /// `404 Not Found` response status.
  ///
  /// If the repository is private, you must have at least `read` permission
  /// for that repository, and your token must have the `repo` or `admin:org`
  /// scope. Otherwise, you will receive a `404 Not Found` response status.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.
  Future<TeamsCheckPermissionsForRepoInOrgResponse>
  checkPermissionsForRepoInOrg(
    String org,
    String teamSlug,
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => TeamsCheckPermissionsForRepoInOrgResponse200(
        TeamRepository.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const TeamsCheckPermissionsForRepoInOrgResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Add or update team repository permissions
  /// To add a repository to a team or update the team's permission on a
  /// repository, the authenticated user must have admin access to the
  /// repository, and must be able to see the team. The repository must be
  /// owned by the organization, or a direct fork of a repository owned by the
  /// organization. You will get a `422 Unprocessable Entity` status if you
  /// attempt to add a repository to a team that is not owned by the
  /// organization. Note that, if you choose not to pass any parameters,
  /// you'll need to set `Content-Length` to zero when calling out to this
  /// endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `PUT /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.
  ///
  /// For more information about the permission levels, see "[Repository
  /// permission levels for an
  /// organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)".
  Future<void> addOrUpdateRepoPermissionsInOrg(
    String org,
    String teamSlug,
    String owner,
    String repo, {
    TeamsAddOrUpdateRepoPermissionsInOrgRequest?
    teamsAddOrUpdateRepoPermissionsInOrgRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: teamsAddOrUpdateRepoPermissionsInOrgRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a repository from a team
  /// If the authenticated user is an organization owner or a team maintainer,
  /// they can remove any repositories from the team. To remove a repository
  /// from a team as an organization member, the authenticated user must have
  /// admin access to the repository and must be able to see the team. This
  /// does not delete the repository, it just removes it from the team.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `DELETE /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.
  Future<void> removeRepoInOrg(
    String org,
    String teamSlug,
    String owner,
    String repo,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug))
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List child teams
  /// Lists the child teams of the team specified by `{team_slug}`.
  ///
  /// > [!NOTE]
  /// > You can also specify a team by `org_id` and `team_id` using the route
  /// `GET /organizations/{org_id}/team/{team_id}/teams`.
  Future<List<Team>> listChildInOrg(
    String org,
    String teamSlug, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/teams/{team_slug}/teams'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{team_slug}', Uri.encodeComponent(teamSlug)),
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
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a team (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the [Get a team by
  /// name](https://docs.github.com/rest/teams/teams#get-a-team-by-name)
  /// endpoint.
  Future<TeamFull> getLegacy(int teamId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}'.replaceAll('{team_id}', '$teamId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a team (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Delete a
  /// team](https://docs.github.com/rest/teams/teams#delete-a-team) endpoint.
  ///
  /// To delete a team, the authenticated user must be an organization owner
  /// or team maintainer.
  ///
  /// If you are an organization owner, deleting a parent team will delete all
  /// of its child teams as well.
  Future<void> deleteLegacy(int teamId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}'.replaceAll('{team_id}', '$teamId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a team (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Update a
  /// team](https://docs.github.com/rest/teams/teams#update-a-team) endpoint.
  ///
  /// To edit a team, the authenticated user must either be an organization
  /// owner or a team maintainer.
  ///
  /// > [!NOTE]
  /// > With nested teams, the `privacy` for parent teams cannot be `secret`.
  Future<TeamFull> updateLegacy(
    int teamId,
    TeamsUpdateLegacyRequest teamsUpdateLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/teams/{team_id}'.replaceAll('{team_id}', '$teamId'),
      body: teamsUpdateLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamFull.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List discussions (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List discussions`](https://docs.github.com/rest/teams/discussions#list-discussions)
  /// endpoint.
  ///
  /// List all discussions on a team's page.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<TeamDiscussion>> listDiscussionsLegacy(
    int teamId, {
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/discussions'.replaceAll('{team_id}', '$teamId'),
      queryParameters: {
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
          .map<TeamDiscussion>(
            (e) => TeamDiscussion.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`Create a discussion`](https://docs.github.com/rest/teams/discussions#create-a-discussion)
  /// endpoint.
  ///
  /// Creates a new discussion post on a team's page.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussion> createDiscussionLegacy(
    int teamId,
    TeamsCreateDiscussionLegacyRequest teamsCreateDiscussionLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/teams/{team_id}/discussions'.replaceAll('{team_id}', '$teamId'),
      body: teamsCreateDiscussionLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Get a
  /// discussion](https://docs.github.com/rest/teams/discussions#get-a-discussion)
  /// endpoint.
  ///
  /// Get a specific discussion on a team's page.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<TeamDiscussion> getDiscussionLegacy(
    int teamId,
    int discussionNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/discussions/{discussion_number}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`Delete a discussion`](https://docs.github.com/rest/teams/discussions#delete-a-discussion)
  /// endpoint.
  ///
  /// Delete a discussion from a team's page.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteDiscussionLegacy(int teamId, int discussionNumber) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}/discussions/{discussion_number}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a discussion (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Update a
  /// discussion](https://docs.github.com/rest/teams/discussions#update-a-discussion)
  /// endpoint.
  ///
  /// Edits the title and body text of a discussion post. Only the parameters
  /// you provide are updated.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussion> updateDiscussionLegacy(
    int teamId,
    int discussionNumber, {
    TeamsUpdateDiscussionLegacyRequest? teamsUpdateDiscussionLegacyRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/teams/{team_id}/discussions/{discussion_number}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
      body: teamsUpdateDiscussionLegacyRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussion.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List discussion comments (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [List discussion
  /// comments](https://docs.github.com/rest/teams/discussion-comments#list-discussion-comments)
  /// endpoint.
  ///
  /// List all comments on a team discussion.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<List<TeamDiscussionComment>> listDiscussionCommentsLegacy(
    int teamId,
    int discussionNumber, {
    DirectionParam? direction = DirectionParam.desc,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/discussions/{discussion_number}/comments'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
      queryParameters: {
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
          .map<TeamDiscussionComment>(
            (e) => TeamDiscussionComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Create a discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#create-a-discussion-comment)
  /// endpoint.
  ///
  /// Creates a new comment on a team discussion.
  ///
  /// This endpoint triggers
  /// [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
  /// Creating content too quickly using this endpoint may result in secondary
  /// rate limiting. For more information, see "[Rate limits for the
  /// API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
  /// and "[Best practices for using the REST
  /// API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> createDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    TeamsCreateDiscussionCommentLegacyRequest
    teamsCreateDiscussionCommentLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/teams/{team_id}/discussions/{discussion_number}/comments'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{discussion_number}', '$discussionNumber'),
      body: teamsCreateDiscussionCommentLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Get a discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#get-a-discussion-comment)
  /// endpoint.
  ///
  /// Get a specific comment on a team discussion.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> getDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    int commentNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path:
          '/teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{team_id}', '$teamId')
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Delete a discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#delete-a-discussion-comment)
  /// endpoint.
  ///
  /// Deletes a comment on a team discussion.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<void> deleteDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    int commentNumber,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path:
          '/teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{team_id}', '$teamId')
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a discussion comment (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Update a discussion
  /// comment](https://docs.github.com/rest/teams/discussion-comments#update-a-discussion-comment)
  /// endpoint.
  ///
  /// Edits the body text of a discussion comment.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:discussion` scope to use this endpoint.
  Future<TeamDiscussionComment> updateDiscussionCommentLegacy(
    int teamId,
    int discussionNumber,
    int commentNumber,
    TeamsUpdateDiscussionCommentLegacyRequest
    teamsUpdateDiscussionCommentLegacyRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path:
          '/teams/{team_id}/discussions/{discussion_number}/comments/{comment_number}'
              .replaceAll('{team_id}', '$teamId')
              .replaceAll('{discussion_number}', '$discussionNumber')
              .replaceAll('{comment_number}', '$commentNumber'),
      body: teamsUpdateDiscussionCommentLegacyRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamDiscussionComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List pending team invitations (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List pending team invitations`](https://docs.github.com/rest/teams/members#list-pending-team-invitations)
  /// endpoint.
  ///
  /// The return hash contains a `role` field which refers to the Organization
  /// Invitation role and will be one of the following values:
  /// `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or
  /// `reinstate`. If the invitee is not a GitHub member, the `login` field in
  /// the return hash will be `null`.
  Future<List<OrganizationInvitation>> listPendingInvitationsLegacy(
    int teamId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/invitations'.replaceAll('{team_id}', '$teamId'),
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
          .map<OrganizationInvitation>(
            (e) => OrganizationInvitation.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List team members (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List team members`](https://docs.github.com/rest/teams/members#list-team-members)
  /// endpoint.
  ///
  /// Team members will include the members of child teams.
  Future<List<SimpleUser>> listMembersLegacy(
    int teamId, {
    TeamsListMembersLegacyParameter1? role =
        TeamsListMembersLegacyParameter1.all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/members'.replaceAll('{team_id}', '$teamId'),
      queryParameters: {
        if (role != null) 'role': [role.toJson()],
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

  /// Get team member (Legacy)
  /// The "Get team member" endpoint (described below) is closing down.
  ///
  /// We recommend using the [Get team membership for a
  /// user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user)
  /// endpoint instead. It allows you to get both active and pending
  /// memberships.
  ///
  /// To list members in a team, the team must be visible to the authenticated
  /// user.
  Future<void> getMemberLegacy(int teamId, String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/members/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Add team member (Legacy)
  /// The "Add team member" endpoint (described below) is closing down.
  ///
  /// We recommend using the [Add or update team membership for a
  /// user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user)
  /// endpoint instead. It allows you to invite new organization members to
  /// your teams.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// To add someone to a team, the authenticated user must be an organization
  /// owner or a team maintainer in the team they're changing. The person
  /// being added to the team must be a member of the team's organization.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  ///
  /// Note that you'll need to set `Content-Length` to zero when calling out
  /// to this endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> addMemberLegacy(int teamId, String username) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/teams/{team_id}/members/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove team member (Legacy)
  /// The "Remove team member" endpoint (described below) is closing down.
  ///
  /// We recommend using the [Remove team membership for a
  /// user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user)
  /// endpoint instead. It allows you to remove both active and pending
  /// memberships.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// To remove a team member, the authenticated user must have 'admin'
  /// permissions to the team or be an owner of the org that the team is
  /// associated with. Removing a team member does not delete the user, it
  /// just removes them from the team.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  Future<void> removeMemberLegacy(int teamId, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}/members/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get team membership for a user (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Get team membership for a
  /// user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user)
  /// endpoint.
  ///
  /// Team members will include the members of child teams.
  ///
  /// To get a user's membership with a team, the team must be visible to the
  /// authenticated user.
  ///
  /// **Note:**
  /// The response contains the `state` of the membership and the member's
  /// `role`.
  ///
  /// The `role` for organization owners is set to `maintainer`. For more
  /// information about `maintainer` roles, see [Create a
  /// team](https://docs.github.com/rest/teams/teams#create-a-team).
  Future<TeamMembership> getMembershipForUserLegacy(
    int teamId,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/memberships/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add or update team membership for a user (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Add or update team membership for a
  /// user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user)
  /// endpoint.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// If the user is already a member of the team's organization, this
  /// endpoint will add the user to the team. To add a membership between an
  /// organization member and a team, the authenticated user must be an
  /// organization owner or a team maintainer.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  ///
  /// If the user is unaffiliated with the team's organization, this endpoint
  /// will send an invitation to the user via email. This newly-created
  /// membership will be in the "pending" state until the user accepts the
  /// invitation, at which point the membership will transition to the
  /// "active" state and the user will be added as a member of the team. To
  /// add a membership between an unaffiliated user and a team, the
  /// authenticated user must be an organization owner.
  ///
  /// If the user is already a member of the team, this endpoint will update
  /// the role of the team member's role. To update the membership of a team
  /// member, the authenticated user must be an organization owner or a team
  /// maintainer.
  Future<TeamMembership> addOrUpdateMembershipForUserLegacy(
    int teamId,
    String username, {
    TeamsAddOrUpdateMembershipForUserLegacyRequest?
    teamsAddOrUpdateMembershipForUserLegacyRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/teams/{team_id}/memberships/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: teamsAddOrUpdateMembershipForUserLegacyRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamMembership.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Remove team membership for a user (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Remove team membership for a
  /// user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user)
  /// endpoint.
  ///
  /// Team synchronization is available for organizations using GitHub
  /// Enterprise Cloud. For more information, see [GitHub's
  /// products](https://docs.github.com/github/getting-started-with-github/githubs-products)
  /// in the GitHub Help documentation.
  ///
  /// To remove a membership between a user and a team, the authenticated user
  /// must have 'admin' permissions to the team or be an owner of the
  /// organization that the team is associated with. Removing team membership
  /// does not delete the user, it just removes their membership from the
  /// team.
  ///
  /// > [!NOTE]
  /// > When you have team synchronization set up for a team with your
  /// organization's identity provider (IdP), you will see an error if you
  /// attempt to use the API for making changes to the team's membership. If
  /// you have access to manage group membership in your IdP, you can manage
  /// GitHub team membership through your identity provider, which
  /// automatically adds and removes team members in an organization. For more
  /// information, see "[Synchronizing teams between your identity provider
  /// and
  /// GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
  Future<void> removeMembershipForUserLegacy(
    int teamId,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}/memberships/{username}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List team projects (Legacy)
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<TeamProject>> listProjectsLegacy(
    int teamId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/projects'.replaceAll('{team_id}', '$teamId'),
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
          .map<TeamProject>(
            (e) => TeamProject.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check team permissions for a project (Legacy)
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<TeamProject> checkPermissionsForProjectLegacy(
    int teamId,
    int projectId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/projects/{project_id}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return TeamProject.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add or update team project permissions (Legacy)
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> addOrUpdateProjectPermissionsLegacy(
    int teamId,
    int projectId, {
    TeamsAddOrUpdateProjectPermissionsLegacyRequest?
    teamsAddOrUpdateProjectPermissionsLegacyRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/teams/{team_id}/projects/{project_id}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{project_id}', '$projectId'),
      body: teamsAddOrUpdateProjectPermissionsLegacyRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a project from a team (Legacy)
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> removeProjectLegacy(int teamId, int projectId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}/projects/{project_id}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List team repositories (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [List team
  /// repositories](https://docs.github.com/rest/teams/teams#list-team-repositories)
  /// endpoint.
  Future<List<MinimalRepository>> listReposLegacy(
    int teamId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/repos'.replaceAll('{team_id}', '$teamId'),
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
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check team permissions for a repository (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Check team permissions for a
  /// repository](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository)
  /// endpoint.
  ///
  /// > [!NOTE]
  /// > Repositories inherited through a parent team will also be checked.
  ///
  /// You can also get information about the specified repository, including
  /// what permissions the team grants on it, by passing the following custom
  /// [media
  /// type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/)
  /// via the `Accept` header:
  Future<TeamsCheckPermissionsForRepoLegacyResponse>
  checkPermissionsForRepoLegacy(int teamId, String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/repos/{owner}/{repo}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => TeamsCheckPermissionsForRepoLegacyResponse200(
        TeamRepository.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      204 => const TeamsCheckPermissionsForRepoLegacyResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// Add or update team repository permissions (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new "[Add or update team repository
  /// permissions](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions)"
  /// endpoint.
  ///
  /// To add a repository to a team or update the team's permission on a
  /// repository, the authenticated user must have admin access to the
  /// repository, and must be able to see the team. The repository must be
  /// owned by the organization, or a direct fork of a repository owned by the
  /// organization. You will get a `422 Unprocessable Entity` status if you
  /// attempt to add a repository to a team that is not owned by the
  /// organization.
  ///
  /// Note that, if you choose not to pass any parameters, you'll need to set
  /// `Content-Length` to zero when calling out to this endpoint. For more
  /// information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> addOrUpdateRepoPermissionsLegacy(
    int teamId,
    String owner,
    String repo, {
    TeamsAddOrUpdateRepoPermissionsLegacyRequest?
    teamsAddOrUpdateRepoPermissionsLegacyRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/teams/{team_id}/repos/{owner}/{repo}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: teamsAddOrUpdateRepoPermissionsLegacyRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove a repository from a team (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [Remove a repository from a
  /// team](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team)
  /// endpoint.
  ///
  /// If the authenticated user is an organization owner or a team maintainer,
  /// they can remove any repositories from the team. To remove a repository
  /// from a team as an organization member, the authenticated user must have
  /// admin access to the repository and must be able to see the team. NOTE:
  /// This does not delete the repository, it just removes it from the team.
  Future<void> removeRepoLegacy(int teamId, String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/teams/{team_id}/repos/{owner}/{repo}'
          .replaceAll('{team_id}', '$teamId')
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List child teams (Legacy)
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** This endpoint route is closing down
  /// and will be removed from the Teams API. We recommend migrating your
  /// existing code to use the new [`List child teams`](https://docs.github.com/rest/teams/teams#list-child-teams)
  /// endpoint.
  Future<List<Team>> listChildLegacy(
    int teamId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/teams/{team_id}/teams'.replaceAll('{team_id}', '$teamId'),
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
          .map<Team>((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List teams for the authenticated user
  /// List all of the teams across all of the organizations to which the
  /// authenticated
  /// user belongs.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`,
  /// `repo`, or `read:org` scope to use this endpoint.
  ///
  /// When using a fine-grained personal access token, the resource owner of
  /// the token must be a single organization, and the response will only
  /// include the teams from that organization.
  Future<List<TeamFull>> listForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/teams',
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
          .map<TeamFull>((e) => TeamFull.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
