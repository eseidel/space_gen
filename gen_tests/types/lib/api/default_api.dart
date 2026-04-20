import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:types/api_client.dart';
import 'package:types/api_exception.dart';
import 'package:types/model/types200_response.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get types
  Future<Types200Response> types() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/types',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }

    if (response.body.isNotEmpty) {
      return Types200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
