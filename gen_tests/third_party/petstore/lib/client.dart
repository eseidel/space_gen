import 'package:petstore/api.dart';

class Swagger {
  Swagger({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  PetApi get pet => PetApi(client);
  StoreApi get store => StoreApi(client);
  UserApi get user => UserApi(client);
}
