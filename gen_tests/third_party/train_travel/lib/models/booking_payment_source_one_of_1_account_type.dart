/// The type of entity that holds the account. This can be either `individual`
/// or `company`.
enum BookingPaymentSourceOneOf1AccountType {
  individual._('individual'),
  company._('company');

  const BookingPaymentSourceOneOf1AccountType._(this.value);

  /// Creates a BookingPaymentSourceOneOf1AccountType from a json value.
  factory BookingPaymentSourceOneOf1AccountType.fromJson(String json) {
    return BookingPaymentSourceOneOf1AccountType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown BookingPaymentSourceOneOf1AccountType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BookingPaymentSourceOneOf1AccountType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentSourceOneOf1AccountType.fromJson(json);
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
