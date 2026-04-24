import 'dart:async';
import 'dart:io';
import 'package:void_error_response/api_client.dart';
import 'package:void_error_response/api_exception.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Returns OK on success; every error response declares no body.
  Future<void> ping() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/ping',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }
  }
}
