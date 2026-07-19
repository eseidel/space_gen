import 'package:meta/meta.dart';
import 'package:train_travel/model_helpers.dart';
import 'package:train_travel/models/booking_payment_currency.dart';
import 'package:train_travel/models/booking_payment_source.dart';
import 'package:train_travel/models/booking_payment_status.dart';

/// {@template booking_payment}
/// A payment for a booking.
/// {@endtemplate}
@immutable
class BookingPayment {
  /// {@macro booking_payment}
  const BookingPayment({
    this.id,
    this.amount,
    this.currency,
    this.source,
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a [BookingPayment].
  factory BookingPayment.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BookingPayment',
      json,
      () => BookingPayment(
        id: json['id'] as String?,
        amount: (json['amount'] as num?)?.toDouble(),
        currency: BookingPaymentCurrency.maybeFromJson(
          json['currency'] as String?,
        ),
        source: BookingPaymentSource.maybeFromJson(
          json['source'] as Map<String, dynamic>?,
        ),
        status: BookingPaymentStatus.maybeFromJson(json['status'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BookingPayment? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BookingPayment.fromJson(json);
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

  /// Converts a [BookingPayment] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'currency': currency?.toJson(),
      'source': source?.toJson(),
      'status': status?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, amount, currency, source, status]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BookingPayment &&
        id == other.id &&
        amount == other.amount &&
        currency == other.currency &&
        source == other.source &&
        status == other.status;
  }
}
