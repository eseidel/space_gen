/// Three-letter [ISO currency
/// code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase.
enum BookingPaymentCurrency {
  bam._('bam'),
  bgn._('bgn'),
  chf._('chf'),
  eur._('eur'),
  gbp._('gbp'),
  nok._('nok'),
  sek._('sek'),
  try_._('try');

  const BookingPaymentCurrency._(this.value);

  /// Creates a BookingPaymentCurrency from a json value.
  factory BookingPaymentCurrency.fromJson(String json) {
    return BookingPaymentCurrency.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown BookingPaymentCurrency value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BookingPaymentCurrency? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentCurrency.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
