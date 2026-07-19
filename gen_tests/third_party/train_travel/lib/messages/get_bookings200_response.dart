import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/booking.dart';
import 'package:train_travel/models/get_bookings200_response_all_of_2_links.dart';

@immutable
class GetBookings200Response {
  const GetBookings200Response({this.data, this.links});

  /// Converts a `Map<String, dynamic>` to a [GetBookings200Response].
  factory GetBookings200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetBookings200Response',
      json,
      () => GetBookings200Response(
        data: (json['data'] as List?)
            ?.map<Booking>((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
        links: GetBookings200ResponseAllOf2Links.maybeFromJson(
          json['links'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetBookings200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetBookings200Response.fromJson(json);
  }

  final List<Booking>? data;
  final GetBookings200ResponseAllOf2Links? links;

  /// Converts a [GetBookings200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (data != null) 'data': data?.map((e) => e.toJson()).toList(),
      if (links != null) 'links': links?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), links]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetBookings200Response &&
        listsEqual(data, other.data) &&
        links == other.links;
  }
}
