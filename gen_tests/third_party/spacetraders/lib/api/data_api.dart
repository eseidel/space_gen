import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_supply_chain200_response.dart';

/// The data endpoints contain actions that relate to the data that is stored in
/// the game. This is all the data that doesn't change over the course of a
/// reset (but might change between resets).
class DataApi {
  DataApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Describes trade relationships
  /// Describes which import and exports map to each other.
  Future<GetSupplyChain200Response> getSupplyChain() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/market/supply-chain',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetSupplyChain200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Subscribe to events
  /// Subscribe to departure events for a system.
  ///
  ///           ## WebSocket Events
  ///
  ///           The following events are available:
  ///
  /// - `systems.{systemSymbol}.departure`: A ship has departed from the
  /// system.
  ///
  ///           ## Subscribe using a message with the following format:
  ///
  ///           ```json
  ///           {
  ///             "action": "subscribe",
  ///             "systemSymbol": "{systemSymbol}"
  ///           }
  ///           ```
  ///
  ///           ## Unsubscribe using a message with the following format:
  ///
  ///           ```json
  ///           {
  ///             "action": "unsubscribe",
  ///             "systemSymbol": "{systemSymbol}"
  ///           }
  ///           ```
  Future<void> websocketDepartureEvents() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/socket.io',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }
  }
}
