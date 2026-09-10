import 'package:preserve_unknown_enums/api.dart';

class Preserve {
  Preserve({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
