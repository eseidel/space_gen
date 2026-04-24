import 'package:null_type_property/api.dart';

class NullTyped {
  NullTyped({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
