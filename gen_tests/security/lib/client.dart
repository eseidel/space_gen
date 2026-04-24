import 'package:security/api.dart';

class Security {
  Security({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
