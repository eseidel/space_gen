import 'package:train_travel/api.dart';

class Train {
  Train({ApiClient? client}) : client = client ?? ApiClient();

  final ApiClient client;

  BookingsApi get bookings => BookingsApi(client);
  PaymentsApi get payments => PaymentsApi(client);
  StationsApi get stations => StationsApi(client);
  TripsApi get trips => TripsApi(client);
}
