import 'package:spacetraders/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class SpaceTraders {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  SpaceTraders({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [AccountsApi] endpoints.
  AccountsApi get accounts => AccountsApi(client);

  /// The [AgentsApi] endpoints.
  AgentsApi get agents => AgentsApi(client);

  /// The [ContractsApi] endpoints.
  ContractsApi get contracts => ContractsApi(client);

  /// The [DataApi] endpoints.
  DataApi get data => DataApi(client);

  /// The [FactionsApi] endpoints.
  FactionsApi get factions => FactionsApi(client);

  /// The [FleetApi] endpoints.
  FleetApi get fleet => FleetApi(client);

  /// The [GlobalApi] endpoints.
  GlobalApi get global => GlobalApi(client);

  /// The [SystemsApi] endpoints.
  SystemsApi get systems => SystemsApi(client);
}
