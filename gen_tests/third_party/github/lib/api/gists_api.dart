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
import 'package:github/messages/gists_create_comment_request.dart';
import 'package:github/messages/gists_create_request.dart';
import 'package:github/messages/gists_update_comment_request.dart';
import 'package:github/messages/gists_update_request.dart';
import 'package:github/models/base_gist.dart';
import 'package:github/models/gist_comment.dart';
import 'package:github/models/gist_commit.dart';
import 'package:github/models/gist_simple.dart';

/// View, modify your gists.
class GistsApi {
  GistsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List gists for the authenticated user
  /// Lists the authenticated user's gists or if called anonymously, this
  /// endpoint returns all public gists:
  Future<List<BaseGist>> list({
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists',
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
          .map<BaseGist>((e) => BaseGist.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a gist
  /// Allows you to add a new gist with one or more files.
  ///
  /// > [!NOTE]
  /// > Don't name your files "gistfile" with a numerical suffix. This is the
  /// format of the automatic naming scheme that Gist uses internally.
  Future<GistSimple> create(GistsCreateRequest gistsCreateRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/gists',
      body: gistsCreateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public gists
  /// List public gists sorted by most recently updated to least recently
  /// updated.
  ///
  /// Note: With
  /// [pagination](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api),
  /// you can fetch up to 3000 gists. For example, you can fetch 100 pages
  /// with 30 gists per page or 30 pages with 100 gists per page.
  Future<List<BaseGist>> listPublic({
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/public',
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
          .map<BaseGist>((e) => BaseGist.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List starred gists
  /// List the authenticated user's starred gists:
  Future<List<BaseGist>> listStarred({
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/starred',
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
          .map<BaseGist>((e) => BaseGist.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a gist
  /// Gets a specified gist.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistSimple> get(String gistId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a gist
  ///
  Future<void> delete(String gistId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/gists/{gist_id}'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a gist
  /// Allows you to update a gist's description and to update, delete, or
  /// rename gist files. Files
  /// from the previous version of the gist that aren't explicitly changed
  /// during an edit
  /// are unchanged.
  ///
  /// At least one of `description` or `files` is required.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistSimple> update(
    String gistId,
    GistsUpdateRequest gistsUpdateRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/gists/{gist_id}'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
      body: gistsUpdateRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List gist comments
  /// Lists the comments on a gist.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<List<GistComment>> listComments(
    String gistId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/comments'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
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
          .map<GistComment>(
            (e) => GistComment.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a gist comment
  /// Creates a comment on a gist.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistComment> createComment(
    String gistId,
    GistsCreateCommentRequest gistsCreateCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/gists/{gist_id}/comments'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
      body: gistsCreateCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a gist comment
  /// Gets a comment on a gist.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistComment> getComment(String gistId, int commentId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/comments/{comment_id}'
          .replaceAll('{gist_id}', Uri.encodeComponent(gistId))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a gist comment
  ///
  Future<void> deleteComment(String gistId, int commentId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/gists/{gist_id}/comments/{comment_id}'
          .replaceAll('{gist_id}', Uri.encodeComponent(gistId))
          .replaceAll('{comment_id}', '$commentId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a gist comment
  /// Updates a comment on a gist.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistComment> updateComment(
    String gistId,
    int commentId,
    GistsUpdateCommentRequest gistsUpdateCommentRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/gists/{gist_id}/comments/{comment_id}'
          .replaceAll('{gist_id}', Uri.encodeComponent(gistId))
          .replaceAll('{comment_id}', '$commentId'),
      body: gistsUpdateCommentRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistComment.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List gist commits
  ///
  Future<List<GistCommit>> listCommits(
    String gistId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/commits'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
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
          .map<GistCommit>(
            (e) => GistCommit.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List gist forks
  ///
  Future<List<GistSimple>> listForks(
    String gistId, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/forks'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
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
          .map<GistSimple>(
            (e) => GistSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Fork a gist
  ///
  Future<BaseGist> fork(String gistId) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/gists/{gist_id}/forks'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return BaseGist.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a gist is starred
  ///
  Future<void> checkIsStarred(String gistId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/star'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Star a gist
  /// Note that you'll need to set `Content-Length` to zero when calling out
  /// to this endpoint. For more information, see "[HTTP
  /// method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  Future<void> star(String gistId) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/gists/{gist_id}/star'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unstar a gist
  ///
  Future<void> unstar(String gistId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/gists/{gist_id}/star'.replaceAll(
        '{gist_id}',
        Uri.encodeComponent(gistId),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a gist revision
  /// Gets a specified gist revision.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw markdown. This
  /// is the default if you do not pass any specific media type.
  /// - **`application/vnd.github.base64+json`**: Returns the base64-encoded
  /// contents. This can be useful if your gist contains any invalid UTF-8
  /// sequences.
  Future<GistSimple> getRevision(String gistId, String sha) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gists/{gist_id}/{sha}'
          .replaceAll('{gist_id}', Uri.encodeComponent(gistId))
          .replaceAll('{sha}', Uri.encodeComponent(sha)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GistSimple.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List gists for a user
  /// Lists public gists for the specified user:
  Future<List<BaseGist>> listForUser(
    String username, {
    DateTime? since,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/gists'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
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
          .map<BaseGist>((e) => BaseGist.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
