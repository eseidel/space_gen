import 'package:types/api.dart';

class Types {
  Types({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
