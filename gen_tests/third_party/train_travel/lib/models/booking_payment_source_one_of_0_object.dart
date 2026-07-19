enum BookingPaymentSourceOneOf0Object {
  card._('card');

  const BookingPaymentSourceOneOf0Object._(this.value);

  /// Creates a BookingPaymentSourceOneOf0Object from a json value.
  factory BookingPaymentSourceOneOf0Object.fromJson(String json) {
    return BookingPaymentSourceOneOf0Object.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown BookingPaymentSourceOneOf0Object value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BookingPaymentSourceOneOf0Object? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentSourceOneOf0Object.fromJson(json);
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
