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
import 'package:github/messages/git_create_blob_request.dart';
import 'package:github/messages/git_create_commit_request.dart';
import 'package:github/messages/git_create_ref_request.dart';
import 'package:github/messages/git_create_tag_request.dart';
import 'package:github/messages/git_create_tree_request.dart';
import 'package:github/messages/git_update_ref_request.dart';
import 'package:github/models/blob.dart';
import 'package:github/models/git_commit.dart';
import 'package:github/models/git_ref.dart';
import 'package:github/models/git_tag.dart';
import 'package:github/models/git_tree.dart';
import 'package:github/models/short_blob.dart';

/// Raw Git functionality.
class GitApi {
  GitApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Create a blob
  ///
  Future<ShortBlob> createBlob(
    String owner,
    String repo,
    GitCreateBlobRequest gitCreateBlobRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/git/blobs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: gitCreateBlobRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ShortBlob.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a blob
  /// The `content` in the response will always be Base64 encoded.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw blob data.
  /// - **`application/vnd.github+json`**: Returns a JSON representation of
  /// the blob with `content` as a base64 encoded string. This is the default
  /// if no media type is specified.
  ///
  /// **Note** This endpoint supports blobs up to 100 megabytes in size.
  Future<Blob> getBlob(String owner, String repo, String fileSha) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/blobs/{file_sha}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{file_sha}', Uri.encodeComponent(fileSha)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Blob.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a commit
  /// Creates a new Git [commit
  /// object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).
  ///
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in the table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<GitCommit> createCommit(
    String owner,
    String repo,
    GitCreateCommitRequest gitCreateCommitRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/git/commits'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: gitCreateCommitRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitCommit.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a commit object
  /// Gets a Git [commit
  /// object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).
  ///
  /// To get the contents of a commit, see "[Get a
  /// commit](/rest/commits/commits#get-a-commit)."
  ///
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in the table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<GitCommit> getCommit(
    String owner,
    String repo,
    String commitSha,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/commits/{commit_sha}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{commit_sha}', Uri.encodeComponent(commitSha)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitCommit.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List matching references
  /// Returns an array of references from your Git database that match the
  /// supplied name. The `:ref` in the URL must be formatted as `heads/<branch name>`
  /// for branches and `tags/<tag name>` for tags. If the `:ref` doesn't exist
  /// in the repository, but existing refs start with `:ref`, they will be
  /// returned as an array.
  ///
  /// When you use this endpoint without providing a `:ref`, it will return an
  /// array of all the references from your Git database, including notes and
  /// stashes if they exist on the server. Anything in the namespace is
  /// returned, not just `heads` and `tags`.
  ///
  /// > [!NOTE]
  /// > You need to explicitly [request a pull
  /// request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to
  /// trigger a test merge commit, which checks the mergeability of pull
  /// requests. For more information, see "[Checking mergeability of pull
  /// requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".
  ///
  /// If you request matching references for a branch named `feature` but the
  /// branch `feature` doesn't exist, the response can still include other
  /// matching head refs that start with the word `feature`, such as
  /// `featureA` and `featureB`.
  /// [ref] example: `'heads/feature-a'`
  Future<List<GitRef>> listMatchingRefs(
    String owner,
    String repo,
    String ref,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/matching-refs/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GitRef>((e) => GitRef.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a reference
  /// Returns a single reference from your Git database. The `:ref` in the URL
  /// must be formatted as `heads/<branch name>` for branches and `tags/<tag name>`
  /// for tags. If the `:ref` doesn't match an existing ref, a `404` is
  /// returned.
  ///
  /// > [!NOTE]
  /// > You need to explicitly [request a pull
  /// request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to
  /// trigger a test merge commit, which checks the mergeability of pull
  /// requests. For more information, see "[Checking mergeability of pull
  /// requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)".
  /// [ref] example: `'heads/feature-a'`
  Future<GitRef> getRef(String owner, String repo, String ref) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/ref/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitRef.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a reference
  /// Creates a reference for your repository. You are unable to create new
  /// references for empty repositories, even if the commit SHA-1 hash used
  /// exists. Empty repositories are repositories without branches.
  Future<GitRef> createRef(
    String owner,
    String repo,
    GitCreateRefRequest gitCreateRefRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/git/refs'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: gitCreateRefRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitRef.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a reference
  /// Deletes the provided reference.
  /// [ref] example: `'heads/feature-a'`
  Future<void> deleteRef(String owner, String repo, String ref) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/repos/{owner}/{repo}/git/refs/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Update a reference
  /// Updates the provided reference to point to a new SHA. For more
  /// information, see "[Git
  /// References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)"
  /// in the Git documentation.
  /// [ref] example: `'heads/feature-a'`
  Future<GitRef> updateRef(
    String owner,
    String repo,
    String ref,
    GitUpdateRefRequest gitUpdateRefRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/repos/{owner}/{repo}/git/refs/{ref}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{ref}', Uri.encodeComponent(ref)),
      body: gitUpdateRefRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitRef.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a tag object
  /// Note that creating a tag object does not create the reference that makes
  /// a tag in Git. If you want to create an annotated tag in Git, you have to
  /// do this call to create the tag object, and then
  /// [create](https://docs.github.com/rest/git/refs#create-a-reference) the
  /// `refs/tags/[tag]` reference. If you want to create a lightweight tag,
  /// you only have to
  /// [create](https://docs.github.com/rest/git/refs#create-a-reference) the
  /// tag reference - this call would be unnecessary.
  ///
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<GitTag> createTag(
    String owner,
    String repo,
    GitCreateTagRequest gitCreateTagRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/git/tags'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: gitCreateTagRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitTag.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a tag
  /// **Signature verification object**
  ///
  /// The response will include a `verification` object that describes the
  /// result of verifying the commit's signature. The following fields are
  /// included in the `verification` object:
  ///
  /// | Name | Type | Description |
  /// | ---- | ---- | ----------- |
  /// | `verified` | `boolean` | Indicates whether GitHub considers the
  /// signature in this commit to be verified. |
  /// | `reason` | `string` | The reason for verified value. Possible values
  /// and their meanings are enumerated in table below. |
  /// | `signature` | `string` | The signature that was extracted from the
  /// commit. |
  /// | `payload` | `string` | The value that was signed. |
  /// | `verified_at` | `string` | The date the signature was verified by
  /// GitHub. |
  ///
  /// These are the possible values for `reason` in the `verification` object:
  ///
  /// | Value | Description |
  /// | ----- | ----------- |
  /// | `expired_key` | The key that made the signature is expired. |
  /// | `not_signing_key` | The "signing" flag is not among the usage flags in
  /// the GPG key that made the signature. |
  /// | `gpgverify_error` | There was an error communicating with the
  /// signature verification service. |
  /// | `gpgverify_unavailable` | The signature verification service is
  /// currently unavailable. |
  /// | `unsigned` | The object does not include a signature. |
  /// | `unknown_signature_type` | A non-PGP signature was found in the
  /// commit. |
  /// | `no_user` | No user was associated with the `committer` email address
  /// in the commit. |
  /// | `unverified_email` | The `committer` email address in the commit was
  /// associated with a user, but the email address is not verified on their
  /// account. |
  /// | `bad_email` | The `committer` email address in the commit is not
  /// included in the identities of the PGP key that made the signature. |
  /// | `unknown_key` | The key that made the signature has not been
  /// registered with any user's account. |
  /// | `malformed_signature` | There was an error parsing the signature. |
  /// | `invalid` | The signature could not be cryptographically verified
  /// using the key whose key-id was found in the signature. |
  /// | `valid` | None of the above errors applied, so the signature is
  /// considered to be verified. |
  Future<GitTag> getTag(String owner, String repo, String tagSha) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/tags/{tag_sha}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{tag_sha}', Uri.encodeComponent(tagSha)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitTag.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a tree
  /// The tree creation API accepts nested entries. If you specify both a tree
  /// and a nested path modifying that tree, this endpoint will overwrite the
  /// contents of the tree with the new path contents, and create a new tree
  /// structure.
  ///
  /// If you use this endpoint to add, delete, or modify the file contents in
  /// a tree, you will need to commit the tree and then update a branch to
  /// point to the commit. For more information see "[Create a
  /// commit](https://docs.github.com/rest/git/commits#create-a-commit)" and
  /// "[Update a
  /// reference](https://docs.github.com/rest/git/refs#update-a-reference)."
  ///
  /// Returns an error if you try to delete a file that does not exist.
  Future<GitTree> createTree(
    String owner,
    String repo,
    GitCreateTreeRequest gitCreateTreeRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/repos/{owner}/{repo}/git/trees'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      body: gitCreateTreeRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitTree.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a tree
  /// Returns a single tree using the SHA1 value or ref name for that tree.
  ///
  /// If `truncated` is `true` in the response then the number of items in the
  /// `tree` array exceeded our maximum limit. If you need to fetch more
  /// items, use the non-recursive method of fetching trees, and fetch one
  /// sub-tree at a time.
  ///
  /// > [!NOTE]
  /// > The limit for the `tree` array is 100,000 entries with a maximum size
  /// of 7 MB when using the `recursive` parameter.
  Future<GitTree> getTree(
    String owner,
    String repo,
    String treeSha, {
    String? recursive,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/git/trees/{tree_sha}'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo))
          .replaceAll('{tree_sha}', Uri.encodeComponent(treeSha)),
      queryParameters: {
        if (recursive != null) 'recursive': [recursive],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitTree.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
