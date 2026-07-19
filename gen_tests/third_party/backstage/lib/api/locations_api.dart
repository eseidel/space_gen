import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:backstage/api_client.dart';
import 'package:backstage/api_exception.dart';
import 'package:backstage/messages/analyze_location_request.dart';
import 'package:backstage/messages/analyze_location_response.dart';
import 'package:backstage/messages/create_location201_response.dart';
import 'package:backstage/messages/create_location_request.dart';
import 'package:backstage/messages/get_locations_by_query_request.dart';
import 'package:backstage/messages/locations_query_response.dart';
import 'package:backstage/models/create_location_parameter1.dart';
import 'package:backstage/models/error.dart';
import 'package:backstage/models/get_locations200_response_inner.dart';
import 'package:backstage/models/location.dart';
import 'package:backstage/models/location_input.dart';

/// Endpoints with tag Locations
class LocationsApi {
  LocationsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get all locations
  Future<List<GetLocations200ResponseInner>> getLocations() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/locations',
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return (jsonDecode(response.body) as List)
          .map<GetLocations200ResponseInner>(
            (e) => GetLocations200ResponseInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList();
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Create a location for a given target.
  Future<CreateLocation201Response> createLocation(
    CreateLocationRequest createLocationRequest, {
    String? dryRun,
    CreateLocationParameter1? onConflict,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/locations',
      queryParameters: {
        if (dryRun != null) 'dryRun': [dryRun],
        if (onConflict != null) 'onConflict': [onConflict.toJson()],
      },
      body: createLocationRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return CreateLocation201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Query for locations
  Future<LocationsQueryResponse> getLocationsByQuery({
    GetLocationsByQueryRequest? getLocationsByQueryRequest,
  }) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/locations/by-query',
      body: getLocationsByQueryRequest?.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return LocationsQueryResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get a location by id.
  Future<Location> getLocation(String id) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/locations/{id}'.replaceAll('{id}', Uri.encodeComponent(id)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return Location.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Update the type and target of an existing location by id.
  Future<Location> updateLocation(
    String id,
    LocationInput locationInput,
  ) async {
    final response = await client.invokeApi(
      method: Method.put,
      path: '/locations/{id}'.replaceAll('{id}', Uri.encodeComponent(id)),
      body: locationInput.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return Location.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Delete a location by id.
  Future<void> deleteLocation(String id) async {
    final response = await client.invokeApi(
      method: Method.delete,
      path: '/locations/{id}'.replaceAll('{id}', Uri.encodeComponent(id)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }
  }

  /// Get a location for entity.
  Future<Location> getLocationByEntity(
    String kind,
    String namespace,
    String name,
  ) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/locations/by-entity/{kind}/{namespace}/{name}'
          .replaceAll('{kind}', Uri.encodeComponent(kind))
          .replaceAll('{namespace}', Uri.encodeComponent(namespace))
          .replaceAll('{name}', Uri.encodeComponent(name)),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return Location.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Validate a given location.
  Future<AnalyzeLocationResponse> analyzeLocation(
    AnalyzeLocationRequest analyzeLocationRequest,
  ) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/analyze-location',
      body: analyzeLocationRequest.toJson(),
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'JWT'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Error>(
        response.statusCode,
        response.body,
        body: Error.fromJson(jsonDecode(response.body) as Map<String, dynamic>),
      );
    }

    if (response.body.isNotEmpty) {
      return AnalyzeLocationResponse.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
