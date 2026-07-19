// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/migrations_map_commit_author_request.dart';
import 'package:github/messages/migrations_set_lfs_preference_request.dart';
import 'package:github/messages/migrations_start_for_authenticated_user_request.dart';
import 'package:github/messages/migrations_start_for_org_request.dart';
import 'package:github/messages/migrations_start_import_request.dart';
import 'package:github/messages/migrations_update_import_request.dart';
import 'package:github/models/import.dart';
import 'package:github/models/migration.dart';
import 'package:github/models/migrations_get_status_for_org_parameter2_inner.dart';
import 'package:github/models/migrations_list_for_org_parameter3_inner.dart';
import 'package:github/models/minimal_repository.dart';
import 'package:github/models/porter_author.dart';
import 'package:github/models/porter_large_file.dart';

/// Move projects to or from GitHub.
class MigrationsApi {
  MigrationsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List organization migrations
  /// Lists the most recent migrations, including both exports (which can be
  /// started through the REST API) and imports (which cannot be started using
  /// the REST API).
  ///
  /// A list of `repositories` is only returned for export migrations.
  Future<List<Migration>> listForOrg(
    String org, {
    int? perPage = 30,
    int? page = 1,
    List<MigrationsListForOrgParameter3Inner>? exclude,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/migrations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
        if (exclude != null) 'exclude': exclude.map((e) => e.toJson()).toList(),
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Migration>((e) => Migration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Start an organization migration
  /// Initiates the generation of a migration archive.
  Future<Migration> startForOrg(
    String org,
    MigrationsStartForOrgRequest migrationsStartForOrgRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/orgs/{org}/migrations'.replaceAll(
        '{org}',
        Uri.encodeComponent(org),
      ),
      body: migrationsStartForOrgRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Migration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an organization migration status
  /// Fetches the status of a migration.
  ///
  /// The `state` of a migration can be one of the following values:
  ///
  /// *   `pending`, which means the migration hasn't started yet.
  /// *   `exporting`, which means the migration is in progress.
  /// *   `exported`, which means the migration finished successfully.
  /// *   `failed`, which means the migration failed.
  Future<Migration> getStatusForOrg(
    String org,
    int migrationId, {
    List<MigrationsGetStatusForOrgParameter2Inner>? exclude,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/migrations/{migration_id}'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{migration_id}', '$migrationId'),
      queryParameters: {
        if (exclude != null) 'exclude': exclude.map((e) => e.toJson()).toList(),
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Migration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Download an organization migration archive
  /// Fetches the URL to a migration archive.
  Future<void> downloadArchiveForOrg(String org, int migrationId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/migrations/{migration_id}/archive'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{migration_id}', '$migrationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete an organization migration archive
  /// Deletes a previous migration archive. Migration archives are
  /// automatically deleted after seven days.
  Future<void> deleteArchiveForOrg(String org, int migrationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/migrations/{migration_id}/archive'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{migration_id}', '$migrationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unlock an organization repository
  /// Unlocks a repository that was locked for migration. You should unlock
  /// each migrated repository and [delete
  /// them](https://docs.github.com/rest/repos/repos#delete-a-repository) when
  /// the migration is complete and you no longer need the source data.
  Future<void> unlockRepoForOrg(
    String org,
    int migrationId,
    String repoName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/orgs/{org}/migrations/{migration_id}/repos/{repo_name}/lock'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{migration_id}', '$migrationId')
          .replaceAll('{repo_name}', Uri.encodeComponent(repoName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories in an organization migration
  /// List all the repositories for this organization migration.
  Future<List<MinimalRepository>> listReposForOrg(
    String org,
    int migrationId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/orgs/{org}/migrations/{migration_id}/repositories'
          .replaceAll('{org}', Uri.encodeComponent(org))
          .replaceAll('{migration_id}', '$migrationId'),
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

  /// Get an import status
  /// View the progress of an import.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  ///
  /// **Import status**
  ///
  /// This section includes details about the possible values of the `status`
  /// field of the Import Progress response.
  ///
  /// An import that does not have errors will progress through these steps:
  ///
  /// *   `detecting` - the "detection" step of the import is in progress
  /// because the request did not include a `vcs` parameter. The import is
  /// identifying the type of source control present at the URL.
  /// *   `importing` - the "raw" step of the import is in progress. This is
  /// where commit data is fetched from the original repository. The import
  /// progress response will include `commit_count` (the total number of raw
  /// commits that will be imported) and `percent` (0 - 100, the current
  /// progress through the import).
  /// *   `mapping` - the "rewrite" step of the import is in progress. This is
  /// where SVN branches are converted to Git branches, and where author
  /// updates are applied. The import progress response does not include
  /// progress information.
  /// *   `pushing` - the "push" step of the import is in progress. This is
  /// where the importer updates the repository on GitHub. The import progress
  /// response will include `push_percent`, which is the percent value
  /// reported by `git push` when it is "Writing objects".
  /// *   `complete` - the import is complete, and the repository is ready on
  /// GitHub.
  ///
  /// If there are problems, you will see one of these in the `status` field:
  ///
  /// *   `auth_failed` - the import requires authentication in order to
  /// connect to the original repository. To update authentication for the
  /// import, please see the [Update an
  /// import](https://docs.github.com/rest/migrations/source-imports#update-an-import)
  /// section.
  /// *   `error` - the import encountered an error. The import progress
  /// response will include the `failed_step` and an error message. Contact
  /// [GitHub
  /// Support](https://support.github.com/contact?tags=dotcom-rest-api) for
  /// more information.
  /// *   `detection_needs_auth` - the importer requires authentication for
  /// the originating repository to continue detection. To update
  /// authentication for the import, please see the [Update an
  /// import](https://docs.github.com/rest/migrations/source-imports#update-an-import)
  /// section.
  /// *   `detection_found_nothing` - the importer didn't recognize any source
  /// control at the URL. To resolve, [Cancel the
  /// import](https://docs.github.com/rest/migrations/source-imports#cancel-an-import)
  /// and
  /// [retry](https://docs.github.com/rest/migrations/source-imports#start-an-import)
  /// with the correct URL.
  /// *   `detection_found_multiple` - the importer found several projects or
  /// repositories at the provided URL. When this is the case, the Import
  /// Progress response will also include a `project_choices` field with the
  /// possible project choices as values. To update project choice, please see
  /// the [Update an
  /// import](https://docs.github.com/rest/migrations/source-imports#update-an-import)
  /// section.
  ///
  /// **The project_choices field**
  ///
  /// When multiple projects are found at the provided URL, the response hash
  /// will include a `project_choices` field, the value of which is an array
  /// of hashes each representing a project choice. The exact key/value pairs
  /// of the project hashes will differ depending on the version control type.
  ///
  /// **Git LFS related fields**
  ///
  /// This section includes details about Git LFS related fields that may be
  /// present in the Import Progress response.
  ///
  /// *   `use_lfs` - describes whether the import has been opted in or out of
  /// using Git LFS. The value can be `opt_in`, `opt_out`, or `undecided` if
  /// no action has been taken.
  /// *   `has_large_files` - the boolean value describing whether files
  /// larger than 100MB were found during the `importing` step.
  /// *   `large_files_size` - the total size in gigabytes of files larger
  /// than 100MB found in the originating repository.
  /// *   `large_files_count` - the total number of files larger than 100MB
  /// found in the originating repository. To see a list of these files, make
  /// a "Get Large Files" request.
  Future<Import> getImportStatus(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/import'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Import.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Start an import
  /// Start a source import to a GitHub repository using GitHub Importer.
  /// Importing into a GitHub repository with GitHub Actions enabled is not
  /// supported and will
  /// return a status `422 Unprocessable Entity` response.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<Import> startImport(
    String owner,
    String repo,
    MigrationsStartImportRequest migrationsStartImportRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/repos/{owner}/{repo}/import'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: migrationsStartImportRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Import.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Cancel an import
  /// Stop an import for a repository.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<void> cancelImport(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/import'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update an import
  /// An import can be updated with credentials or a project choice by passing
  /// in the appropriate parameters in this API
  /// request. If no parameters are provided, the import will be restarted.
  ///
  /// Some servers (e.g. TFS servers) can have several projects at a single
  /// URL. In those cases the import progress will
  /// have the status `detection_found_multiple` and the Import Progress
  /// response will include a `project_choices` array.
  /// You can select the project to import by providing one of the objects in
  /// the `project_choices` array in the update request.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<Import> updateImport(
    String owner,
    String repo, {
    MigrationsUpdateImportRequest? migrationsUpdateImportRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/import'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: migrationsUpdateImportRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Import.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get commit authors
  /// Each type of source control system represents authors in a different
  /// way. For example, a Git commit author has a display name and an email
  /// address, but a Subversion commit author just has a username. The GitHub
  /// Importer will make the author information valid, but the author might
  /// not be correct. For example, it will change the bare Subversion username
  /// `hubot` into something like `hubot <hubot@12341234-abab-fefe-8787-fedcba987654>`.
  ///
  /// This endpoint and the [Map a commit
  /// author](https://docs.github.com/rest/migrations/source-imports#map-a-commit-author)
  /// endpoint allow you to provide correct Git author information.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<List<PorterAuthor>> getCommitAuthors(
    String owner,
    String repo, {
    int? since,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/import/authors'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (since != null) 'since': [since.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PorterAuthor>(
            (e) => PorterAuthor.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Map a commit author
  /// Update an author's identity for the import. Your application can
  /// continue updating authors any time before you push
  /// new commits to the repository.
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<PorterAuthor> mapCommitAuthor(
    String owner,
    String repo,
    int authorId, {
    MigrationsMapCommitAuthorRequest? migrationsMapCommitAuthorRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/import/authors/{author_id}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{author_id}', '$authorId'),
      body: migrationsMapCommitAuthorRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PorterAuthor.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get large files
  /// List files larger than 100MB found during the import
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<List<PorterLargeFile>> getLargeFiles(String owner, String repo) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/import/large_files'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<PorterLargeFile>(
            (e) => PorterLargeFile.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update Git LFS preference
  /// You can import repositories from Subversion, Mercurial, and TFS that
  /// include files larger than 100MB. This ability
  /// is powered by [Git LFS](https://git-lfs.com).
  ///
  /// You can learn more about our LFS feature and working with large files
  /// [on our help
  /// site](https://docs.github.com/repositories/working-with-files/managing-large-files).
  ///
  /// > [!WARNING]
  /// > **Endpoint closing down notice:** Due to very low levels of usage and
  /// available alternatives, this endpoint is closing down and will no longer
  /// be available from 00:00 UTC on April 12, 2024. For more details and
  /// alternatives, see the
  /// [changelog](https://gh.io/source-imports-api-deprecation).
  Future<Import> setLfsPreference(
    String owner,
    String repo,
    MigrationsSetLfsPreferenceRequest migrationsSetLfsPreferenceRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/import/lfs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: migrationsSetLfsPreferenceRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Import.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List user migrations
  /// Lists all migrations a user has started.
  Future<List<Migration>> listForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/migrations',
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
          .map<Migration>((e) => Migration.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Start a user migration
  /// Initiates the generation of a user migration archive.
  Future<Migration> startForAuthenticatedUser(
    MigrationsStartForAuthenticatedUserRequest
    migrationsStartForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/migrations',
      body: migrationsStartForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Migration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a user migration status
  /// Fetches a single user migration. The response includes the `state` of
  /// the migration, which can be one of the following values:
  ///
  /// *   `pending` - the migration hasn't started yet.
  /// *   `exporting` - the migration is in progress.
  /// *   `exported` - the migration finished successfully.
  /// *   `failed` - the migration failed.
  ///
  /// Once the migration has been `exported` you can [download the migration
  /// archive](https://docs.github.com/rest/migrations/users#download-a-user-migration-archive).
  Future<Migration> getStatusForAuthenticatedUser(
    int migrationId, {
    List<String>? exclude,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/migrations/{migration_id}'.replaceAll(
        '{migration_id}',
        '$migrationId',
      ),
      queryParameters: {if (exclude != null) 'exclude': exclude},
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Migration.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Download a user migration archive
  /// Fetches the URL to download the migration archive as a `tar.gz` file.
  /// Depending on the resources your repository uses, the migration archive
  /// can contain JSON files with data for these objects:
  ///
  /// *   attachments
  /// *   bases
  /// *   commit\_comments
  /// *   issue\_comments
  /// *   issue\_events
  /// *   issues
  /// *   milestones
  /// *   organizations
  /// *   projects
  /// *   protected\_branches
  /// *   pull\_request\_reviews
  /// *   pull\_requests
  /// *   releases
  /// *   repositories
  /// *   review\_comments
  /// *   schema
  /// *   users
  ///
  /// The archive will also contain an `attachments` directory that includes
  /// all attachment files uploaded to GitHub.com and a `repositories`
  /// directory that contains the repository's Git data.
  Future<void> getArchiveForAuthenticatedUser(int migrationId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/migrations/{migration_id}/archive'.replaceAll(
        '{migration_id}',
        '$migrationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete a user migration archive
  /// Deletes a previous migration archive. Downloadable migration archives
  /// are automatically deleted after seven days. Migration metadata, which is
  /// returned in the [List user
  /// migrations](https://docs.github.com/rest/migrations/users#list-user-migrations)
  /// and [Get a user migration
  /// status](https://docs.github.com/rest/migrations/users#get-a-user-migration-status)
  /// endpoints, will continue to be available even after an archive is
  /// deleted.
  Future<void> deleteArchiveForAuthenticatedUser(int migrationId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/migrations/{migration_id}/archive'.replaceAll(
        '{migration_id}',
        '$migrationId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unlock a user repository
  /// Unlocks a repository. You can lock repositories when you [start a user
  /// migration](https://docs.github.com/rest/migrations/users#start-a-user-migration).
  /// Once the migration is complete you can unlock each repository to begin
  /// using it again or [delete the
  /// repository](https://docs.github.com/rest/repos/repos#delete-a-repository)
  /// if you no longer need the source data. Returns a status of `404 Not Found`
  /// if the repository is not locked.
  Future<void> unlockRepoForAuthenticatedUser(
    int migrationId,
    String repoName,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/migrations/{migration_id}/repos/{repo_name}/lock'
          .replaceAll('{migration_id}', '$migrationId')
          .replaceAll('{repo_name}', Uri.encodeComponent(repoName)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List repositories for a user migration
  /// Lists all the repositories for this user migration.
  Future<List<MinimalRepository>> listReposForAuthenticatedUser(
    int migrationId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/migrations/{migration_id}/repositories'.replaceAll(
        '{migration_id}',
        '$migrationId',
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
          .map<MinimalRepository>(
            (e) => MinimalRepository.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
