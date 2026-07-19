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
import 'package:github/messages/credentials_revoke_request.dart';

/// Revoke compromised or leaked GitHub credentials.
class CredentialsApi {
  CredentialsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Revoke a list of credentials
  /// Submit a list of credentials to be revoked. This endpoint is intended to
  /// revoke credentials the caller does not own and may have found exposed on
  /// GitHub.com or elsewhere. It can also be used for credentials associated
  /// with an old user account that you no longer have access to. Credential
  /// owners will be notified of the revocation.
  ///
  /// This endpoint currently accepts the following credential types:
  /// - Personal access tokens (classic)
  /// - Fine-grained personal access tokens
  ///
  /// Revoked credentials may impact users on GitHub Free, Pro, & Team and
  /// GitHub Enterprise Cloud, and GitHub Enterprise Cloud with Enterprise
  /// Managed Users.
  /// GitHub cannot reactivate any credentials that have been revoked; new
  /// credentials will need to be generated.
  ///
  /// To prevent abuse, this API is limited to only 60 unauthenticated
  /// requests per hour and a max of 1000 tokens per API request.
  ///
  /// > [!NOTE]
  /// > Any authenticated requests will return a 403.
  Future<dynamic> revoke(
    CredentialsRevokeRequest credentialsRevokeRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/credentials/revoke',
      body: credentialsRevokeRequest.toJson(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return jsonDecode(response.body);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
