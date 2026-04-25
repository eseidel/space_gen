import 'dart:async';
import 'dart:io';
import 'package:unsupported_auth/api_client.dart';
import 'package:unsupported_auth/api_exception.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Requires an oauth2 scheme — pass-through bearer.
  Future<void> oauth2Protected() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oauth2-protected',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'oauth2Scheme'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Requires an openIdConnect scheme — pass-through bearer.
  Future<void> oidcProtected() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/oidc-protected',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'oidcScheme'),
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
