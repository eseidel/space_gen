// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
    final response = await client.invokeApi(method: Method.get, path: '/types');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Types200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
