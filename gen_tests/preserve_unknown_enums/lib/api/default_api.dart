import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:preserve_unknown_enums/api_client.dart';
import 'package:preserve_unknown_enums/api_exception.dart';
import 'package:preserve_unknown_enums/model/item.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<Item> getItem() async {
    final response = await client.invokeApi(method: Method.get, path: '/item');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Item.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
