import 'package:backstage/api.dart';

class Catalog {
  Catalog({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  EntityApi get entity => EntityApi(client);
  LocationsApi get locations => LocationsApi(client);
}
