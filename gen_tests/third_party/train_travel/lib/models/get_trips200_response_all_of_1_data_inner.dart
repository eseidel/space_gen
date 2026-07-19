import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

@immutable
class GetTrips200ResponseAllOf1DataInner {
  const GetTrips200ResponseAllOf1DataInner({
    this.id,
    this.origin,
    this.destination,
    this.departureTime,
    this.arrivalTime,
    this.operator_,
    this.price,
    this.bicyclesAllowed,
    this.dogsAllowed,
    this.self,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [GetTrips200ResponseAllOf1DataInner].
  factory GetTrips200ResponseAllOf1DataInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'GetTrips200ResponseAllOf1DataInner',
      json,
      () => GetTrips200ResponseAllOf1DataInner(
        id: json['id'] as String?,
        origin: json['origin'] as String?,
        destination: json['destination'] as String?,
        departureTime: maybeParseDateTime(json['departure_time'] as String?),
        arrivalTime: maybeParseDateTime(json['arrival_time'] as String?),
        operator_: json['operator'] as String?,
        price: (json['price'] as num?)?.toDouble(),
        bicyclesAllowed: json['bicycles_allowed'] as bool?,
        dogsAllowed: json['dogs_allowed'] as bool?,
        self: maybeParseUri(json['self'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetTrips200ResponseAllOf1DataInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetTrips200ResponseAllOf1DataInner.fromJson(json);
  }

  /// Unique identifier for the trip
  /// Example: `'4f4e4e1-c824-4d63-b37a-d8d698862f1d'`
  final String? id;

  /// The starting station of the trip
  /// Example: `'efdbb9d1-02c2-4bc3-afb7-6788d8782b1e'`
  /// Example: `'b2e783e1-c824-4d63-b37a-d8d698862f1d'`
  final String? origin;

  /// The destination station of the trip
  /// Example: `'b2e783e1-c824-4d63-b37a-d8d698862f1d'`
  /// Example: `'efdbb9d1-02c2-4bc3-afb7-6788d8782b1e'`
  final String? destination;

  /// The date and time when the trip departs
  /// Example: `'2024-02-01T10:00:00Z'`
  final DateTime? departureTime;

  /// The date and time when the trip arrives
  /// Example: `'2024-02-01T16:00:00Z'`
  final DateTime? arrivalTime;

  /// The name of the operator of the trip
  /// Example: `'Deutsche Bahn'`
  /// Example: `'SNCF'`
  final String? operator_;

  /// The cost of the trip
  /// Example: `50`
  final double? price;

  /// Indicates whether bicycles are allowed on the trip
  final bool? bicyclesAllowed;

  /// Indicates whether dogs are allowed on the trip
  final bool? dogsAllowed;
  final Uri? self;

  /// Converts a [GetTrips200ResponseAllOf1DataInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (origin != null) 'origin': origin,
      if (destination != null) 'destination': destination,
      if (departureTime != null)
        'departure_time': departureTime?.toIso8601String(),
      if (arrivalTime != null) 'arrival_time': arrivalTime?.toIso8601String(),
      if (operator_ != null) 'operator': operator_,
      if (price != null) 'price': price,
      if (bicyclesAllowed != null) 'bicycles_allowed': bicyclesAllowed,
      if (dogsAllowed != null) 'dogs_allowed': dogsAllowed,
      if (self != null) 'self': self?.toString(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    origin,
    destination,
    departureTime,
    arrivalTime,
    operator_,
    price,
    bicyclesAllowed,
    dogsAllowed,
    self,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetTrips200ResponseAllOf1DataInner &&
        id == other.id &&
        origin == other.origin &&
        destination == other.destination &&
        departureTime == other.departureTime &&
        arrivalTime == other.arrivalTime &&
        operator_ == other.operator_ &&
        price == other.price &&
        bicyclesAllowed == other.bicyclesAllowed &&
        dogsAllowed == other.dogsAllowed &&
        self == other.self;
  }
}
