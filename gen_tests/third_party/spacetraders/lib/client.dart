import 'package:spacetraders/api.dart';

class SpaceTraders {
  SpaceTraders({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  AccountsApi get accounts => AccountsApi(client);
  AgentsApi get agents => AgentsApi(client);
  ContractsApi get contracts => ContractsApi(client);
  DataApi get data => DataApi(client);
  FactionsApi get factions => FactionsApi(client);
  FleetApi get fleet => FleetApi(client);
  GlobalApi get global => GlobalApi(client);
  SystemsApi get systems => SystemsApi(client);
}
