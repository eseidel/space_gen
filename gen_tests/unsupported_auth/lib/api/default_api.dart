import 'dart:async';
import 'dart:io';
import 'package:unsupported_auth/api_client.dart';
import 'package:unsupported_auth/api_exception.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Operation requires an oauth2 scheme we don't implement.
  Future<void> oauth2Protected() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2-protected',
      authRequest: const NoAuth(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Operation requires an openIdConnect scheme.
  Future<void> oidcProtected() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oidc-protected',
      authRequest: const NoAuth(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Operation requires mutualTLS.
  Future<void> mtlsProtected() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/mtls-protected',
      authRequest: const NoAuth(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }
}
