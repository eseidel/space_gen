import 'package:unsupported_auth/api.dart';

class Unsupported {
  Unsupported({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
