import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';

/// List emojis available to use on GitHub.
class EmojisApi {
  EmojisApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get emojis
  /// Lists all the emojis available to use on GitHub.
  Future<Map<String, String>> get() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/emojis',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value as String),
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
