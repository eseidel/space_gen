import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:spacetraders/api_client.dart';
import 'package:spacetraders/api_exception.dart';
import 'package:spacetraders/messages/get_my_account200_response.dart';
import 'package:spacetraders/messages/register201_response.dart';
import 'package:spacetraders/messages/register_request.dart';

/// The accounts endpoints contain actions that relate to your spacetraders
/// account.
class AccountsApi {
  AccountsApi(ApiClient? client) : client = client ?? ApiClient();

  final ApiClient client;

  /// Get Account
  /// Fetch your account details.
  Future<GetMyAccount200Response> getMyAccount() async {
    final response = await client.invokeApi(
      method: Method.get,
      path: '/my/account',
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AgentToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return GetMyAccount200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }

  /// Register New Agent
  /// Creates a new agent and ties it to an account.
  /// The agent symbol must consist of a 3-14 character string, and will be
  /// used to represent your agent. This symbol will prefix the symbol of
  /// every ship you own. Agent symbols will be cast to all uppercase
  /// characters.
  ///
  /// This new agent will be tied to a starting faction of your choice, which
  /// determines your starting location, and will be granted an authorization
  /// token, a contract with their starting faction, a command ship that can
  /// fly across space with advanced capabilities, a small probe ship that can
  /// be used for reconnaissance, and 175,000 credits.
  ///
  /// > #### Keep your token safe and secure
  /// >
  /// > Keep careful track of where you store your token. You can generate a
  /// new token from our account dashboard, but if someone else gains access
  /// to your token they will be able to use it to make API requests on your
  /// behalf until the end of the reset.
  ///
  /// If you are new to SpaceTraders, It is recommended to register with the
  /// COSMIC faction, a faction that is well connected to the rest of the
  /// universe. After registering, you should try our interactive [quickstart
  /// guide](https://docs.spacetraders.io/quickstart/new-game) which will walk
  /// you through a few basic API requests in just a few minutes.
  Future<Register201Response> register(RegisterRequest registerRequest) async {
    final response = await client.invokeApi(
      method: Method.post,
      path: '/register',
      body: registerRequest.toJson(),
      authRequest: const HttpAuth(scheme: 'bearer', secretName: 'AccountToken'),
    );

    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException<Object?>(response.statusCode, response.body);
    }

    if (response.body.isNotEmpty) {
      return Register201Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException<Object?>.unhandled(response.statusCode);
  }
}
