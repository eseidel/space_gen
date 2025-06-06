import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/model/get_error_codes200_response.dart';
import 'package:spacetraders/model/get_status200_response.dart';

class GlobalApi {
  GlobalApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<GetStatus200Response> getStatus() async {
    final response = await client.invokeApi(method: Method.get, path: '/');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetStatus200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getStatus',
    );
  }

  Future<GetErrorCodes200Response> getErrorCodes() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/error-codes',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetErrorCodes200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(
      response.statusCode,
      'Unhandled response from $getErrorCodes',
    );
  }
}
