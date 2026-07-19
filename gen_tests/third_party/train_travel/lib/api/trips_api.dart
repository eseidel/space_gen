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
import 'package:train_travel/messages/get_trips200_response.dart';

/// Timetables and routes for train trips between stations, including pricing
/// and availability.
class TripsApi {
  TripsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get available train trips
  /// Returns a list of available train trips between the specified origin and
  /// destination stations on the given date, and allows for filtering by
  /// bicycle and dog allowances.
  /// [page] example: `1`
  /// [limit] example: `10`
  /// [origin] example: `'efdbb9d1-02c2-4bc3-afb7-6788d8782b1e'`
  /// [destination] example: `'b2e783e1-c824-4d63-b37a-d8d698862f1d'`
  /// [date] example: `'2024-02-01T09:00:00Z'`
  Future<GetTrips200Response> getTrips(
    String origin,
    String destination,
    DateTime date, {
    int? page = 1,
    int? limit = 10,
    bool? bicycles = false,
    bool? dogs = false,
  }) async {
    page?.validateMinimum(1);
    limit?.validateMaximum(100);
    limit?.validateMinimum(1);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/trips',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
        'origin': [origin],
        'destination': [destination],
        'date': [date.toIso8601String()],
        if (bicycles != null) 'bicycles': [bicycles.toString()],
        if (dogs != null) 'dogs': [dogs.toString()],
      },
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'OAuth2'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetTrips200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
