// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/gitignore_template.dart';

/// View gitignore templates
class GitignoreApi {
  GitignoreApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get all gitignore templates
  /// List all templates available to pass as an option when [creating a
  /// repository](https://docs.github.com/rest/repos/repos#create-a-repository-for-the-authenticated-user).
  Future<List<String>> getAllTemplates() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gitignore/templates',
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List).cast<String>();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a gitignore template
  /// Get the content of a gitignore template.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw .gitignore
  /// contents.
  Future<GitignoreTemplate> getTemplate(String name) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/gitignore/templates/{name}'.replaceAll(
        '{name}',
        Uri.encodeComponent(name),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GitignoreTemplate.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
