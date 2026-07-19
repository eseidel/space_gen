import 'package:form_urlencoded/api.dart';

class FormUrlEncoded {
  FormUrlEncoded({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  DefaultApi get defaultApi => DefaultApi(client);
}
