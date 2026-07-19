import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/code_of_conduct.dart';

/// Insight into codes of conduct for your communities.
class CodesOfConductApi {
  CodesOfConductApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get all codes of conduct
  /// Returns array of all GitHub's codes of conduct.
  Future<List<CodeOfConduct>> codesOfConductGetAllCodesOfConduct() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/codes_of_conduct',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<CodeOfConduct>(
            (e) => CodeOfConduct.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a code of conduct
  /// Returns information about the specified GitHub code of conduct.
  Future<CodeOfConduct> codesOfConductGetConductCode(String key) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/codes_of_conduct/{key}'.replaceAll(
        '{key}',
        Uri.encodeComponent(key),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return CodeOfConduct.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
