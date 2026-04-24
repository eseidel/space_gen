import 'package:void_error_response/api.dart';

class Void {
  Void({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
