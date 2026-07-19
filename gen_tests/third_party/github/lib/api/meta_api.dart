// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/date.dart';
import 'package:github/models/api_overview.dart';
import 'package:github/models/root.dart';

/// Endpoints that give information about the API.
class MetaApi {
  MetaApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// GitHub API Root
  /// Get Hypermedia links to resources accessible in GitHub's REST API
  Future<Root> root() async {
    final response = await client.invokeApi(method: Method.get, path: '/');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Root.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get GitHub meta information
  /// Returns meta information about GitHub, including a list of GitHub's IP
  /// addresses. For more information, see "[About GitHub's IP
  /// addresses](https://docs.github.com/articles/about-github-s-ip-addresses/)."
  ///
  /// The API's response also includes a list of GitHub's domain names.
  ///
  /// The values shown in the documentation's response are example values. You
  /// must always query the API directly to get the latest values.
  ///
  /// > [!NOTE]
  /// > This endpoint returns both IPv4 and IPv6 addresses. However, not all
  /// features support IPv6. You should refer to the specific documentation
  /// for each feature to determine if IPv6 is supported.
  Future<ApiOverview> get() async {
    final response = await client.invokeApi(method: Method.get, path: '/meta');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return ApiOverview.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get Octocat
  /// Get the octocat as ASCII art
  Future<String> getOctocat({String? s}) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/octocat',
      queryParameters: {
        if (s != null) 's': [s],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return response.body;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get all API versions
  /// Get all supported GitHub API versions.
  Future<List<Date>> getAllVersions() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/versions',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<Date>((e) => Date.fromJson(e as String))
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the Zen of GitHub
  /// Get a random sentence from the Zen of GitHub
  Future<String> getZen() async {
    final response = await client.invokeApi(method: Method.get, path: '/zen');

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return response.body;
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
