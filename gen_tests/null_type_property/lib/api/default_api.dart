import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:null_type_property/api_client.dart';
import 'package:null_type_property/api_exception.dart';
import 'package:null_type_property/model/thing.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  Future<List<Thing>> listThings() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/things',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(
        response.statusCode,
        response.body,
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Thing>((e) => Thing.fromJson(e as Map<String, dynamic>))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
