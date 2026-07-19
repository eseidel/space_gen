import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_error_codes200_response.dart';
import 'package:spacetraders/messages/get_status200_response.dart';

/// The global endpoints contain actions that relate to the game server itself.
/// This includes announcements, leaderboards, and server resets. It also
/// includes endpoints that don't fit into the other categories.
class GlobalApi {
  GlobalApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Server status
  /// Return the status of the game server.
  /// This also includes a few global elements, such as announcements, server
  /// reset dates and leaderboards.
  Future<GetStatus200Response> getStatus() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/',
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetStatus200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Error code list
  /// Return a list of all possible error codes thrown by the game server.
  Future<GetErrorCodes200Response> getErrorCodes() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/error-codes',
      authRequest: const NoAuth(),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetErrorCodes200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
