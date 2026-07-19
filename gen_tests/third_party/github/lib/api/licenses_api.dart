// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:github/api_client.dart';
import 'package:github/api_exception.dart';
import 'package:github/models/code_scanning_ref.dart';
import 'package:github/models/license.dart';
import 'package:github/models/license_content.dart';
import 'package:github/models/license_simple.dart';

/// View various OSS licenses.
class LicensesApi {
  LicensesApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get all commonly used licenses
  /// Lists the most commonly used licenses on GitHub. For more information,
  /// see "[Licensing a repository
  /// ](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)."
  Future<List<LicenseSimple>> getAllCommonlyUsed({
    bool? featured,
    int? perPage = 30,
    int? page = 1,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/licenses',
      queryParameters: {
        if (featured != null) 'featured': [featured.toString()],
        if (perPage != null) 'per_page': [perPage.toString()],
        if (page != null) 'page': [page.toString()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<LicenseSimple>(
            (e) => LicenseSimple.fromJson(e as Map<String, dynamic>),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a license
  /// Gets information about a specific license. For more information, see
  /// "[Licensing a repository
  /// ](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository)."
  Future<License> get(String license) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/licenses/{license}'.replaceAll(
        '{license}',
        Uri.encodeComponent(license),
      ),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return License.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get the license for a repository
  /// This method returns the contents of the repository's license file, if
  /// one is detected.
  ///
  /// This endpoint supports the following custom media types. For more
  /// information, see "[Media
  /// types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
  ///
  /// - **`application/vnd.github.raw+json`**: Returns the raw contents of the
  /// license.
  /// - **`application/vnd.github.html+json`**: Returns the license contents
  /// in HTML. Markup languages are rendered to HTML using GitHub's
  /// open-source [Markup library](https://github.com/github/markup).
  Future<LicenseContent> getForRepo(
    String owner,
    String repo, {
    CodeScanningRef? ref,
  }) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/repos/{owner}/{repo}/license'
          .replaceAll('{owner}', Uri.encodeComponent(owner))
          .replaceAll('{repo}', Uri.encodeComponent(repo)),
      queryParameters: {
        if (ref != null) 'ref': [ref.toJson()],
      },
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return LicenseContent.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
