import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:const_property/api_client.dart';
import 'package:const_property/api_exception.dart';
import 'package:const_property/model/list_resp.dart';
import 'package:const_property/model/marker.dart';

/// Endpoints with tag Default
class DefaultApi {
  DefaultApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List
  Future<ListResp> getList() async {
    final response = await client.invokeApi(method: Method.get, path: '/list');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ListResp.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Marker
  Future<Marker> getMarker() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/marker',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Marker.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
