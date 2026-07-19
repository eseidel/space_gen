import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/booking_payment_currency.dart';
import 'package:train_travel/models/booking_payment_source.dart';
import 'package:train_travel/models/booking_payment_status.dart';
import 'package:train_travel/models/links_booking.dart';

@immutable
class CreateBookingPayment200Response {
  const CreateBookingPayment200Response({
    this.id,
    this.amount,
    this.currency,
    this.source,
    this.status,
    this.links,
  });

  /// Converts a `Map<String, dynamic>` to a [CreateBookingPayment200Response].
  factory CreateBookingPayment200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CreateBookingPayment200Response',
      json,
      () => CreateBookingPayment200Response(
        id: json['id'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        currency: BookingPaymentCurrency.maybeFromJson(
          json['currency'] as String?,
        ),
        source: BookingPaymentSource.maybeFromJson(
          json['source'] as Map<String, dynamic>?,
        ),
        status: BookingPaymentStatus.maybeFromJson(json['status'] as String?),
        links: LinksBooking.maybeFromJson(
          json['links'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateBookingPayment200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CreateBookingPayment200Response.fromJson(json);
  }

  /// Unique identifier for the payment. This will be a unique identifier for
  /// the payment, and is used to reference the payment in other objects.
  final String? id;

  /// Amount intended to be collected by this payment. A positive decimal
  /// figure describing the amount to be collected.
  /// Example: `49.99`
  final double? amount;

  /// Three-letter [ISO currency
  /// code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
  final BookingPaymentCurrency? currency;

  /// The payment source to take the payment from. This can be a card or a
  /// bank account. Some of these properties will be hidden on read to protect
  /// PII leaking.
  final BookingPaymentSource? source;

  /// The status of the payment, one of `pending`, `succeeded`, or `failed`.
  final BookingPaymentStatus? status;

  /// The link to the booking resource.
  final LinksBooking? links;

  /// Converts a [CreateBookingPayment200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'amount': ?amount,
      'currency': ?currency?.toJson(),
      'source': ?source?.toJson(),
      'status': ?status?.toJson(),
      'links': ?links?.toJson(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, amount, currency, source, status, links]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CreateBookingPayment200Response &&
        id == other.id &&
        amount == other.amount &&
        currency == other.currency &&
        source == other.source &&
        status == other.status &&
        links == other.links;
  }
}
