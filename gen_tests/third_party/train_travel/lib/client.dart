import 'package:train_travel/api.dart';

/// The API client: one property per group of endpoints, all sharing
/// [client].
class Train {
  /// Creates the client, sending requests through [client] or, when null,
  /// a default [ApiClient].
  Train({ApiClient? client}) : client = client ?? ApiClient();

  /// The client requests are sent through.
  final ApiClient client;

  /// The [BookingsApi] endpoints.
  BookingsApi get bookings => BookingsApi(client);

  /// The [PaymentsApi] endpoints.
  PaymentsApi get payments => PaymentsApi(client);

  /// The [StationsApi] endpoints.
  StationsApi get stations => StationsApi(client);

  /// The [TripsApi] endpoints.
  TripsApi get trips => TripsApi(client);
}
