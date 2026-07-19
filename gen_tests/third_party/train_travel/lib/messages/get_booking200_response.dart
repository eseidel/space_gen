import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/links_self.dart';

@immutable
class GetBooking200Response {
  const GetBooking200Response({
    this.id,
    this.tripId,
    this.passengerName,
    this.hasBicycle,
    this.hasDog,
    this.links,
  });

  /// Converts a `Map<String, dynamic>` to a [GetBooking200Response].
  factory GetBooking200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetBooking200Response',
      json,
      () => GetBooking200Response(
        id: json['id'] as String?,
        tripId: json['trip_id'] as String?,
        passengerName: json['passenger_name'] as String?,
        hasBicycle: json['has_bicycle'] as bool?,
        hasDog: json['has_dog'] as bool?,
        links: LinksSelf.maybeFromJson(json['links'] as Map<String, dynamic>?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetBooking200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetBooking200Response.fromJson(json);
  }

  /// Unique identifier for the booking
  /// Example: `'3f3e3e1-c824-4d63-b37a-d8d698862f1d'`
  final String? id;

  /// Identifier of the booked trip
  /// Example: `'4f4e4e1-c824-4d63-b37a-d8d698862f1d'`
  final String? tripId;

  /// Name of the passenger
  /// Example: `'John Doe'`
  final String? passengerName;

  /// Indicates whether the passenger has a bicycle.
  final bool? hasBicycle;

  /// Indicates whether the passenger has a dog.
  final bool? hasDog;

  /// The link to the current resource.
  final LinksSelf? links;

  /// Converts a [GetBooking200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'trip_id': ?tripId,
      'passenger_name': ?passengerName,
      'has_bicycle': ?hasBicycle,
      'has_dog': ?hasDog,
      'links': ?links?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, tripId, passengerName, hasBicycle, hasDog, links]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetBooking200Response &&
        id == other.id &&
        tripId == other.tripId &&
        passengerName == other.passengerName &&
        hasBicycle == other.hasBicycle &&
        hasDog == other.hasDog &&
        links == other.links;
  }
}
