enum BookingPaymentSourceOneOf1Object {
  bankAccount._('bank_account');

  const BookingPaymentSourceOneOf1Object._(this.value);

  /// Creates a BookingPaymentSourceOneOf1Object from a json value.
  factory BookingPaymentSourceOneOf1Object.fromJson(String json) {
    return BookingPaymentSourceOneOf1Object.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown BookingPaymentSourceOneOf1Object value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BookingPaymentSourceOneOf1Object? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentSourceOneOf1Object.fromJson(json);
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
