// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:train_travel/api_client.dart';
import 'package:train_travel/api_exception.dart';
import 'package:train_travel/messages/get_stations200_response.dart';

/// Find and filter train stations across Europe, including their location
/// and local timezone.
class StationsApi {
  StationsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get a list of train stations
  /// Returns a paginated and searchable list of all train stations.
  /// [page] example: `1`
  /// [limit] example: `10`
  /// [coordinates] example: `'52.5200,13.4050'`
  /// [country] example: `'DE'`
  Future<GetStations200Response> getStations({
    int? page = 1,
    int? limit = 10,
    String? coordinates,
    String? search,
    String? country,
  }) async {
    page?.validateMinimum(1);
    limit?.validateMaximum(100);
    limit?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/stations',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
        if (coordinates != null) 'coordinates': [coordinates],
        if (search != null) 'search': [search],
        if (country != null) 'country': [country],
      },
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetStations200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
