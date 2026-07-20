import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_faction200_response.dart';
import 'package:spacetraders/messages/get_factions200_response.dart';
import 'package:spacetraders/messages/get_my_factions200_response.dart';

/// The factions endpoints contain actions that relate to factions. Factions are
/// organizations or sentient beings that are actively competing for control of
/// the universe.
class FactionsApi {
  FactionsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// List factions
  /// Return a paginated list of all the factions in the game.
  Future<GetFactions200Response> getFactions({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/factions',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const OneOfAuth([
        NoAuth(),
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Faction details
  /// View the details of a faction.
  Future<GetFaction200Response> getFaction(String factionSymbol) async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/factions/{factionSymbol}'.replaceAll(
        '{factionSymbol}',
        Uri.encodeComponent(factionSymbol),
      ),
      authRequest: const AllOfAuth([
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
        HttpAuth(scheme: 'bearer', secretName: 'AccountToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetFaction200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Get My Factions
  /// Retrieve factions with which the agent has reputation.
  Future<GetMyFactions200Response> getMyFactions({
    int? page = 1,
    int? limit = 10,
  }) async {
    page?.validate(min: 1);
    limit?.validate(min: 1, max: 20);

    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/factions',
      queryParameters: {
        if (page != null) 'page': [page.toString()],
        if (limit != null) 'limit': [limit.toString()],
      },
      authRequest: const AllOfAuth([
        HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
        HttpAuth(scheme: 'bearer', secretName: 'AccountToken'),
      ]),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyFactions200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
