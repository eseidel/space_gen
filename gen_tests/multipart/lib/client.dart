import 'package:multipart/api.dart';

class Multipart {
  Multipart({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
