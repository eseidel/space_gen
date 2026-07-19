// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/projects_add_collaborator_request.dart';
import 'package:github/messages/projects_create_card_request.dart';
import 'package:github/messages/projects_create_column_request.dart';
import 'package:github/messages/projects_create_for_authenticated_user_request.dart';
import 'package:github/messages/projects_create_for_org_request.dart';
import 'package:github/messages/projects_create_for_repo_request.dart';
import 'package:github/messages/projects_move_card201_response.dart';
import 'package:github/messages/projects_move_card_request.dart';
import 'package:github/messages/projects_move_column201_response.dart';
import 'package:github/messages/projects_move_column_request.dart';
import 'package:github/messages/projects_update_card_request.dart';
import 'package:github/messages/projects_update_column_request.dart';
import 'package:github/messages/projects_update_request.dart';
import 'package:github/models/project.dart';
import 'package:github/models/project_card.dart';
import 'package:github/models/project_collaborator_permission.dart';
import 'package:github/models/project_column.dart';
import 'package:github/models/projects_list_cards_parameter1.dart';
import 'package:github/models/projects_list_collaborators_parameter1.dart';
import 'package:github/models/projects_list_for_org_parameter1.dart';
import 'package:github/models/projects_list_for_repo_parameter2.dart';
import 'package:github/models/projects_list_for_user_parameter1.dart';
import 'package:github/models/simple_user.dart';

/// Interact with GitHub Projects.
class ProjectsApi {
  ProjectsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List organization projects
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<Project>> listForOrg(
    String org, {
    ProjectsListForOrgParameter1? state = .open,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/projects'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Project>((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create an organization project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<Project> createForOrg(
    String org,
    ProjectsCreateForOrgRequest projectsCreateForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/projects'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: projectsCreateForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Project.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a project card
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectCard> getCard(int cardId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/columns/cards/{card_id}'.replaceAll(
        '{card_id}',
        '$cardId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectCard.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a project card
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> deleteCard(int cardId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/projects/columns/cards/{card_id}'.replaceAll(
        '{card_id}',
        '$cardId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an existing project card
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectCard> updateCard(
    int cardId, {
    ProjectsUpdateCardRequest? projectsUpdateCardRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/projects/columns/cards/{card_id}'.replaceAll(
        '{card_id}',
        '$cardId',
      ),
      body: projectsUpdateCardRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectCard.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Move a project card
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectsMoveCard201Response> moveCard(
    int cardId,
    ProjectsMoveCardRequest projectsMoveCardRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/projects/columns/cards/{card_id}/moves'.replaceAll(
        '{card_id}',
        '$cardId',
      ),
      body: projectsMoveCardRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectsMoveCard201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a project column
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectColumn> getColumn(int columnId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/columns/{column_id}'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectColumn.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a project column
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> deleteColumn(int columnId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/projects/columns/{column_id}'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an existing project column
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectColumn> updateColumn(
    int columnId,
    ProjectsUpdateColumnRequest projectsUpdateColumnRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/projects/columns/{column_id}'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
      body: projectsUpdateColumnRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectColumn.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List project cards
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<ProjectCard>> listCards(
    int columnId, {
    ProjectsListCardsParameter1? archivedState = .notArchived,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/columns/{column_id}/cards'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
      queryParameters: {
        if (archivedState != null) 'archived_state': [archivedState.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<ProjectCard>(
            (e) => ProjectCard.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a project card
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectCard> createCard(
    int columnId,
    ProjectsCreateCardRequest projectsCreateCardRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/projects/columns/{column_id}/cards'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
      body: projectsCreateCardRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectCard.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Move a project column
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectsMoveColumn201Response> moveColumn(
    int columnId,
    ProjectsMoveColumnRequest projectsMoveColumnRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/projects/columns/{column_id}/moves'.replaceAll(
        '{column_id}',
        '$columnId',
      ),
      body: projectsMoveColumnRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectsMoveColumn201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<Project> get(int projectId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/{project_id}'.replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Project.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> delete(int projectId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/projects/{project_id}'.replaceAll('{project_id}', '$projectId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<Project> update(
    int projectId, {
    ProjectsUpdateRequest? projectsUpdateRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/projects/{project_id}'.replaceAll('{project_id}', '$projectId'),
      body: projectsUpdateRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Project.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List project collaborators
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<SimpleUser>> listCollaborators(
    int projectId, {
    ProjectsListCollaboratorsParameter1? affiliation = .all,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/{project_id}/collaborators'.replaceAll(
        '{project_id}',
        '$projectId',
      ),
      queryParameters: {
        if (affiliation != null) 'affiliation': [affiliation.toJson()],
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

  /// Add project collaborator
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> addCollaborator(
    int projectId,
    String username, {
    ProjectsAddCollaboratorRequest? projectsAddCollaboratorRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/projects/{project_id}/collaborators/{username}'
          .replaceAll('{project_id}', '$projectId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
      body: projectsAddCollaboratorRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Remove user as a collaborator
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<void> removeCollaborator(int projectId, String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/projects/{project_id}/collaborators/{username}'
          .replaceAll('{project_id}', '$projectId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get project permission for a user
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectCollaboratorPermission> getPermissionForUser(
    int projectId,
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/{project_id}/collaborators/{username}/permission'
          .replaceAll('{project_id}', '$projectId')
          .replaceAll('{username}', Uri.encodeComponent(username)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectCollaboratorPermission.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List project columns
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<ProjectColumn>> listColumns(
    int projectId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/projects/{project_id}/columns'.replaceAll(
        '{project_id}',
        '$projectId',
      ),
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
          .map<ProjectColumn>(
            (e) => ProjectColumn.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a project column
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<ProjectColumn> createColumn(
    int projectId,
    ProjectsCreateColumnRequest projectsCreateColumnRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/projects/{project_id}/columns'.replaceAll(
        '{project_id}',
        '$projectId',
      ),
      body: projectsCreateColumnRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ProjectColumn.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List repository projects
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<Project>> listForRepo(
    String owner,
    String repo, {
    ProjectsListForRepoParameter2? state = .open,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/projects'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Project>((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a repository project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<Project> createForRepo(
    String owner,
    String repo,
    ProjectsCreateForRepoRequest projectsCreateForRepoRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/projects'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: projectsCreateForRepoRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Project.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a user project
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<Project> createForAuthenticatedUser(
    ProjectsCreateForAuthenticatedUserRequest
    projectsCreateForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/projects',
      body: projectsCreateForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Project.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List user projects
  /// > [!WARNING]
  /// > **Closing down notice:** Projects (classic) is being deprecated in
  /// favor of the new Projects experience.
  /// > See the
  /// [changelog](https://github.blog/changelog/2024-05-23-sunset-notice-projects-classic/)
  /// for more information.
  Future<List<Project>> listForUser(
    String username, {
    ProjectsListForUserParameter1? state = .open,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/projects'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (state != null) 'state': [state.toJson()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Project>((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
