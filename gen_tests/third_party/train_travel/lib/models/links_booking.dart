import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';

/// {@template links_booking}
/// The link to the booking resource.
/// {@endtemplate}
@immutable
class LinksBooking {
  /// {@macro links_booking}
  const LinksBooking({this.booking});

  /// Converts a `Map<String, dynamic>` to a [LinksBooking].
  factory LinksBooking.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LinksBooking',
      json,
      () => LinksBooking(booking: maybeParseUri(json['booking'] as String?)),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LinksBooking? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LinksBooking.fromJson(json);
  }

  /// Example:
  /// `'https://api.example.com/bookings/1725ff48-ab45-4bb5-9d02-88745177dedb'`
  final Uri? booking;

  /// Converts a [LinksBooking] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'booking': booking?.toString()};
  }

  @override
  int get hashCode => booking.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LinksBooking && booking == other.booking;
  }
}
