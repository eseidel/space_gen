import 'package:form_urlencoded/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class FormUrlEncoded {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  FormUrlEncoded({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [DefaultApi] endpoints.
  DefaultApi get defaultApi => DefaultApi(client);
}
