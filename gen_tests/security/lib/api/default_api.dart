import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:security/api_client.dart';
import 'package:security/api_exception.dart';
import 'package:security/model/user.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Inherits the global bearer requirement.
  Future<User> getMe() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/me',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'bearerAuth'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }

    if (response.body.isNotEmpty) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Public endpoint — explicitly overrides global security to require none.
  Future<void> getHealth() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/public/health',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }

  /// Uses an API key instead of the global bearer scheme.
  Future<void> rotateKey() async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/keys/rotate',
      authRequest: const ApiKeyAuth(
        name: 'X-Api-Key',
        secretName: 'apiKeyAuth',
        sendIn: ApiKeyLocation.header,
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }
}
