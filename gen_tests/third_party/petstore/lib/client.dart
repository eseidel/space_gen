import 'package:petstore/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class Swagger {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  Swagger({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [PetApi] endpoints.
  PetApi get pet => PetApi(client);

  /// The [StoreApi] endpoints.
  StoreApi get store => StoreApi(client);

  /// The [UserApi] endpoints.
  UserApi get user => UserApi(client);
}
