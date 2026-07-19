// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/messages/users_add_email_for_authenticated_user_request.dart';
import 'package:github/messages/users_add_social_account_for_authenticated_user_request.dart';
import 'package:github/messages/users_create_gpg_key_for_authenticated_user_request.dart';
import 'package:github/messages/users_create_public_ssh_key_for_authenticated_user_request.dart';
import 'package:github/messages/users_create_ssh_signing_key_for_authenticated_user_request.dart';
import 'package:github/messages/users_delete_attestations_bulk_request.dart';
import 'package:github/messages/users_delete_email_for_authenticated_user_request.dart';
import 'package:github/messages/users_delete_social_account_for_authenticated_user_request.dart';
import 'package:github/messages/users_get_authenticated200_response.dart';
import 'package:github/messages/users_list_attestations200_response.dart';
import 'package:github/messages/users_set_primary_email_visibility_for_authenticated_user_request.dart';
import 'package:github/messages/users_update_authenticated_request.dart';
import 'package:github/models/email.dart';
import 'package:github/models/empty_object.dart';
import 'package:github/models/gpg_key.dart';
import 'package:github/models/hovercard.dart';
import 'package:github/models/key.dart';
import 'package:github/models/key_simple.dart';
import 'package:github/models/private_user.dart';
import 'package:github/models/simple_user.dart';
import 'package:github/models/social_account.dart';
import 'package:github/models/ssh_signing_key.dart';
import 'package:github/models/users_get_context_for_user_parameter1.dart';
import 'package:meta/meta.dart';

sealed class UsersListAttestationsResponse {
  const UsersListAttestationsResponse();
}

@immutable
final class UsersListAttestationsResponse200
    extends UsersListAttestationsResponse {
  const UsersListAttestationsResponse200(this.value);

  final UsersListAttestations200Response value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersListAttestationsResponse200 && value == other.value;
  }
}

@immutable
final class UsersListAttestationsResponse201
    extends UsersListAttestationsResponse {
  const UsersListAttestationsResponse201(this.value);

  final EmptyObject value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UsersListAttestationsResponse201 && value == other.value;
  }
}

@immutable
final class UsersListAttestationsResponse204
    extends UsersListAttestationsResponse {
  const UsersListAttestationsResponse204();

  @override
  int get hashCode => 204;

  @override
  bool operator ==(Object other) => other is UsersListAttestationsResponse204;
}

/// Interact with and view information about users and also current user.
class UsersApi {
  UsersApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get the authenticated user
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope in order for the response to include private profile information.
  Future<UsersGetAuthenticated200Response> getAuthenticated() async {
    final response = await client.invokeApi(method: Method.get, path: '/user');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return UsersGetAuthenticated200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the authenticated user
  /// **Note:** If your email is set to private and you send an `email`
  /// parameter as part of this request to update your profile, your privacy
  /// settings are still enforced: the email address will not be displayed on
  /// your public profile or via the API.
  Future<PrivateUser> updateAuthenticated({
    UsersUpdateAuthenticatedRequest? usersUpdateAuthenticatedRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/user',
      body: usersUpdateAuthenticatedRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return PrivateUser.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List users blocked by the authenticated user
  /// List the users you've blocked on your personal account.
  Future<List<SimpleUser>> listBlockedByAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/blocks',
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

  /// Check if a user is blocked by the authenticated user
  /// Returns a 204 if the given user is blocked by the authenticated user.
  /// Returns a 404 if the given user is not blocked by the authenticated
  /// user, or if the given user account has been identified as spam by
  /// GitHub.
  Future<void> checkBlocked(String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/blocks/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Block a user
  /// Blocks the given user and returns a 204. If the authenticated user
  /// cannot block the given user a 422 is returned.
  Future<void> block(String username) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/blocks/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unblock a user
  /// Unblocks the given user and returns a 204.
  Future<void> unblock(String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/blocks/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Set primary email visibility for the authenticated user
  /// Sets the visibility for your primary email addresses.
  Future<List<Email>> setPrimaryEmailVisibilityForAuthenticatedUser(
    UsersSetPrimaryEmailVisibilityForAuthenticatedUserRequest
    usersSetPrimaryEmailVisibilityForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.patch,
      path: '/user/email/visibility',
      body: usersSetPrimaryEmailVisibilityForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Email>((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List email addresses for the authenticated user
  /// Lists all of your email addresses, and specifies which one is visible
  /// to the public.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `user:email` scope to use this endpoint.
  Future<List<Email>> listEmailsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/emails',
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
          .map<Email>((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add an email address for the authenticated user
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<List<Email>> addEmailForAuthenticatedUser({
    UsersAddEmailForAuthenticatedUserRequest?
    usersAddEmailForAuthenticatedUserRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/emails',
      body: usersAddEmailForAuthenticatedUserRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Email>((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an email address for the authenticated user
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<void> deleteEmailForAuthenticatedUser({
    UsersDeleteEmailForAuthenticatedUserRequest?
    usersDeleteEmailForAuthenticatedUserRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/emails',
      body: usersDeleteEmailForAuthenticatedUserRequest?.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List followers of the authenticated user
  /// Lists the people following the authenticated user.
  Future<List<SimpleUser>> listFollowersForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/followers',
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

  /// List the people the authenticated user follows
  /// Lists the people who the authenticated user follows.
  Future<List<SimpleUser>> listFollowedByAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/following',
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

  /// Check if a person is followed by the authenticated user
  ///
  Future<void> checkPersonIsFollowedByAuthenticated(String username) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/following/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Follow a user
  /// Note that you'll need to set `Content-Length` to zero when calling out
  /// to this endpoint. For more information, see "[HTTP
  /// verbs](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `user:follow` scope to use this endpoint.
  Future<void> follow(String username) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/user/following/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Unfollow a user
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `user:follow` scope to use this endpoint.
  Future<void> unfollow(String username) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/following/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List GPG keys for the authenticated user
  /// Lists the current user's GPG keys.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:gpg_key` scope to use this endpoint.
  Future<List<GpgKey>> listGpgKeysForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/gpg_keys',
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
          .map<GpgKey>((e) => GpgKey.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a GPG key for the authenticated user
  /// Adds a GPG key to the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:gpg_key` scope to use this endpoint.
  Future<GpgKey> createGpgKeyForAuthenticatedUser(
    UsersCreateGpgKeyForAuthenticatedUserRequest
    usersCreateGpgKeyForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/gpg_keys',
      body: usersCreateGpgKeyForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GpgKey.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a GPG key for the authenticated user
  /// View extended details for a single GPG key.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:gpg_key` scope to use this endpoint.
  Future<GpgKey> getGpgKeyForAuthenticatedUser(int gpgKeyId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/gpg_keys/{gpg_key_id}'.replaceAll(
        '{gpg_key_id}',
        '$gpgKeyId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GpgKey.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a GPG key for the authenticated user
  /// Removes a GPG key from the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:gpg_key` scope to use this endpoint.
  Future<void> deleteGpgKeyForAuthenticatedUser(int gpgKeyId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/gpg_keys/{gpg_key_id}'.replaceAll(
        '{gpg_key_id}',
        '$gpgKeyId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List public SSH keys for the authenticated user
  /// Lists the public SSH keys for the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:public_key` scope to use this endpoint.
  Future<List<Key>> listPublicSshKeysForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/keys',
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
          .map<Key>((e) => Key.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a public SSH key for the authenticated user
  /// Adds a public SSH key to the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:gpg_key` scope to use this endpoint.
  Future<Key> createPublicSshKeyForAuthenticatedUser(
    UsersCreatePublicSshKeyForAuthenticatedUserRequest
    usersCreatePublicSshKeyForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/keys',
      body: usersCreatePublicSshKeyForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Key.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a public SSH key for the authenticated user
  /// View extended details for a single public SSH key.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:public_key` scope to use this endpoint.
  Future<Key> getPublicSshKeyForAuthenticatedUser(int keyId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/keys/{key_id}'.replaceAll('{key_id}', '$keyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Key.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a public SSH key for the authenticated user
  /// Removes a public SSH key from the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:public_key` scope to use this endpoint.
  Future<void> deletePublicSshKeyForAuthenticatedUser(int keyId) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/keys/{key_id}'.replaceAll('{key_id}', '$keyId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List public email addresses for the authenticated user
  /// Lists your publicly visible email address, which you can set with the
  /// [Set primary email visibility for the authenticated
  /// user](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user)
  /// endpoint.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `user:email` scope to use this endpoint.
  Future<List<Email>> listPublicEmailsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/public_emails',
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
          .map<Email>((e) => Email.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List social accounts for the authenticated user
  /// Lists all of your social accounts.
  Future<List<SocialAccount>> listSocialAccountsForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/social_accounts',
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
          .map<SocialAccount>(
            (e) => SocialAccount.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Add social accounts for the authenticated user
  /// Add one or more social accounts to the authenticated user's profile.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<List<SocialAccount>> addSocialAccountForAuthenticatedUser(
    UsersAddSocialAccountForAuthenticatedUserRequest
    usersAddSocialAccountForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/social_accounts',
      body: usersAddSocialAccountForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<SocialAccount>(
            (e) => SocialAccount.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete social accounts for the authenticated user
  /// Deletes one or more social accounts from the authenticated user's
  /// profile.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `user`
  /// scope to use this endpoint.
  Future<void> deleteSocialAccountForAuthenticatedUser(
    UsersDeleteSocialAccountForAuthenticatedUserRequest
    usersDeleteSocialAccountForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/social_accounts',
      body: usersDeleteSocialAccountForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List SSH signing keys for the authenticated user
  /// Lists the SSH signing keys for the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:ssh_signing_key` scope to use this endpoint.
  Future<List<SshSigningKey>> listSshSigningKeysForAuthenticatedUser({
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/ssh_signing_keys',
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
          .map<SshSigningKey>(
            (e) => SshSigningKey.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a SSH signing key for the authenticated user
  /// Creates an SSH signing key for the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `write:ssh_signing_key` scope to use this endpoint.
  Future<SshSigningKey> createSshSigningKeyForAuthenticatedUser(
    UsersCreateSshSigningKeyForAuthenticatedUserRequest
    usersCreateSshSigningKeyForAuthenticatedUserRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/user/ssh_signing_keys',
      body: usersCreateSshSigningKeyForAuthenticatedUserRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SshSigningKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get an SSH signing key for the authenticated user
  /// Gets extended details for an SSH signing key.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `read:ssh_signing_key` scope to use this endpoint.
  Future<SshSigningKey> getSshSigningKeyForAuthenticatedUser(
    int sshSigningKeyId,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/ssh_signing_keys/{ssh_signing_key_id}'.replaceAll(
        '{ssh_signing_key_id}',
        '$sshSigningKeyId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return SshSigningKey.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete an SSH signing key for the authenticated user
  /// Deletes an SSH signing key from the authenticated user's GitHub account.
  ///
  /// OAuth app tokens and personal access tokens (classic) need the
  /// `admin:ssh_signing_key` scope to use this endpoint.
  Future<void> deleteSshSigningKeyForAuthenticatedUser(
    int sshSigningKeyId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/user/ssh_signing_keys/{ssh_signing_key_id}'.replaceAll(
        '{ssh_signing_key_id}',
        '$sshSigningKeyId',
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Get a user using their ID
  /// Provides publicly available information about someone with a GitHub
  /// account. This method takes their durable user `ID` instead of their
  /// `login`, which can change over time.
  ///
  /// If you are requesting information about an [Enterprise Managed
  /// User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users),
  /// or a GitHub App bot that is installed in an organization that uses
  /// Enterprise Managed Users, your requests must be authenticated as a user
  /// or GitHub App that has access to the organization to view that account's
  /// information. If you are not authorized, the request will return a `404 Not Found`
  /// status.
  ///
  /// The `email` key in the following response is the publicly visible email
  /// address from your GitHub [profile
  /// page](https://github.com/settings/profile). When setting up your
  /// profile, you can select a primary email address to be public which
  /// provides an email entry for this endpoint. If you do not set a public
  /// email address for `email`, then it will have a value of `null`. You only
  /// see publicly visible email addresses when authenticated with GitHub. For
  /// more information, see
  /// [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).
  ///
  /// The Emails API enables you to list all of your email addresses, and
  /// toggle a primary email to be visible publicly. For more information, see
  /// [Emails API](https://docs.github.com/rest/users/emails).
  Future<UsersGetAuthenticated200Response> getById(int accountId) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/user/{account_id}'.replaceAll('{account_id}', '$accountId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return UsersGetAuthenticated200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List users
  /// Lists all users, in the order that they signed up on GitHub. This list
  /// includes personal user accounts and organization accounts.
  ///
  /// Note: Pagination is powered exclusively by the `since` parameter. Use
  /// the [Link
  /// header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers)
  /// to get the URL for the next page of users.
  Future<List<SimpleUser>> list({int? since, int? perPage = 30}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users',
      queryParameters: {
        if (since != null) 'since': [since.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
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

  /// Get a user
  /// Provides publicly available information about someone with a GitHub
  /// account.
  ///
  /// If you are requesting information about an [Enterprise Managed
  /// User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users),
  /// or a GitHub App bot that is installed in an organization that uses
  /// Enterprise Managed Users, your requests must be authenticated as a user
  /// or GitHub App that has access to the organization to view that account's
  /// information. If you are not authorized, the request will return a `404 Not Found`
  /// status.
  ///
  /// The `email` key in the following response is the publicly visible email
  /// address from your GitHub [profile
  /// page](https://github.com/settings/profile). When setting up your
  /// profile, you can select a primary email address to be public which
  /// provides an email entry for this endpoint. If you do not set a public
  /// email address for `email`, then it will have a value of `null`. You only
  /// see publicly visible email addresses when authenticated with GitHub. For
  /// more information, see
  /// [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).
  ///
  /// The Emails API enables you to list all of your email addresses, and
  /// toggle a primary email to be visible publicly. For more information, see
  /// [Emails API](https://docs.github.com/rest/users/emails).
  Future<UsersGetAuthenticated200Response> getByUsername(
    String username,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return UsersGetAuthenticated200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete attestations in bulk
  /// Delete artifact attestations in bulk by either subject digests or unique
  /// ID.
  Future<void> deleteAttestationsBulk(
    String username,
    UsersDeleteAttestationsBulkRequest usersDeleteAttestationsBulkRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/users/{username}/attestations/delete-request'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      body: usersDeleteAttestationsBulkRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete attestations by subject digest
  /// Delete an artifact attestation by subject digest.
  Future<void> deleteAttestationsBySubjectDigest(
    String username,
    String subjectDigest,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/users/{username}/attestations/digest/{subject_digest}'
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{subject_digest}', Uri.encodeComponent(subjectDigest)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// Delete attestations by ID
  /// Delete an artifact attestation by unique ID that is associated with a
  /// repository owned by a user.
  Future<void> deleteAttestationsById(
    String username,
    int attestationId,
  ) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/users/{username}/attestations/{attestation_id}'
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{attestation_id}', '$attestationId'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List attestations
  /// List a collection of artifact attestations with a given subject digest
  /// that are associated with repositories owned by a user.
  ///
  /// The collection of attestations returned by this endpoint is filtered
  /// according to the authenticated user's permissions; if the authenticated
  /// user cannot read a repository, the attestations associated with that
  /// repository will not be included in the response. In addition, when using
  /// a fine-grained access token the `attestations:read` permission is
  /// required.
  ///
  /// **Please note:** in order to offer meaningful security benefits, an
  /// attestation's signature and timestamps **must** be cryptographically
  /// verified, and the identity of the attestation signer **must** be
  /// validated. Attestations can be verified using the [GitHub CLI
  /// `attestation verify`
  /// command](https://cli.github.com/manual/gh_attestation_verify). For more
  /// information, see [our guide on how to use artifact attestations to
  /// establish a build's
  /// provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds).
  Future<UsersListAttestationsResponse> listAttestations(
    String username,
    String subjectDigest, {
    int? perPage = 30,
    String? before,
    String? after,
    String? predicateType,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/attestations/{subject_digest}'
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{subject_digest}', Uri.encodeComponent(subjectDigest)),
      queryParameters: {
        if (perPage != null) 'per_page': [perPage.toString()],
        if (before != null) 'before': [before],
        if (after != null) 'after': [after],
        if (predicateType != null) 'predicate_type': [predicateType],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    return switch (response.statusCode) {
      200 => UsersListAttestationsResponse200(
        UsersListAttestations200Response.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>,
        ),
      ),
      201 => UsersListAttestationsResponse201(
        EmptyObject.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      ),
      204 => const UsersListAttestationsResponse204(),
      _ => throw ApiException<Object?>.unhandled(response.statusCode),
    };
  }

  /// List followers of a user
  /// Lists the people following the specified user.
  Future<List<SimpleUser>> listFollowersForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/followers'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List the people a user follows
  /// Lists the people who the specified user follows.
  Future<List<SimpleUser>> listFollowingForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/following'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<SimpleUser>(
            (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Check if a user follows another user
  ///
  Future<void> checkFollowingForUser(String username, String targetUser) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/following/{target_user}'
          .replaceAll('{username}', Uri.encodeComponent(username))
          .replaceAll('{target_user}', Uri.encodeComponent(targetUser)),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }

  /// List GPG keys for a user
  /// Lists the GPG keys for a user. This information is accessible by anyone.
  Future<List<GpgKey>> listGpgKeysForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/gpg_keys'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<GpgKey>((e) => GpgKey.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get contextual information for a user
  /// Provides hovercard information. You can find out more about someone in
  /// relation to their pull requests, issues, repositories, and
  /// organizations.
  ///
  /// The `subject_type` and `subject_id` parameters provide context for the
  /// person's hovercard, which returns more information than without the
  /// parameters. For example, if you wanted to find out more about `octocat`
  /// who owns the `Spoon-Knife` repository, you would use a `subject_type`
  /// value of `repository` and a `subject_id` value of `1300192` (the ID of
  /// the `Spoon-Knife` repository).
  ///
  /// OAuth app tokens and personal access tokens (classic) need the `repo`
  /// scope to use this endpoint.
  Future<Hovercard> getContextForUser(
    String username, {
    UsersGetContextForUserParameter1? subjectType,
    String? subjectId,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/hovercard'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
      ),
      queryParameters: {
        if (subjectType != null) 'subject_type': [subjectType.toJson()],
        if (subjectId != null) 'subject_id': [subjectId],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Hovercard.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List public keys for a user
  /// Lists the _verified_ public SSH keys for a user. This is accessible by
  /// anyone.
  Future<List<KeySimple>> listPublicKeysForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/keys'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<KeySimple>((e) => KeySimple.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List social accounts for a user
  /// Lists social media accounts for a user. This endpoint is accessible by
  /// anyone.
  Future<List<SocialAccount>> listSocialAccountsForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/social_accounts'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<SocialAccount>(
            (e) => SocialAccount.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// List SSH signing keys for a user
  /// Lists the SSH signing keys for a user. This operation is accessible by
  /// anyone.
  Future<List<SshSigningKey>> listSshSigningKeysForUser(
    String username, {
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/users/{username}/ssh_signing_keys'.replaceAll(
        '{username}',
        Uri.encodeComponent(username),
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
          .map<SshSigningKey>(
            (e) => SshSigningKey.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
