import 'package:security/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class Security {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  Security({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [DefaultApi] endpoints.
  DefaultApi get defaultApi => DefaultApi(client);
}
