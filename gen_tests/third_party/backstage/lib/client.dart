import 'package:backstage/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class Catalog {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  Catalog({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [EntityApi] endpoints.
  EntityApi get entity => EntityApi(client);

  /// The [LocationsApi] endpoints.
  LocationsApi get locations => LocationsApi(client);
}
