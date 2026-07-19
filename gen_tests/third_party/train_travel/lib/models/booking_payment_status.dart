/// The status of the payment, one of `pending`, `succeeded`, or `failed`.
enum BookingPaymentStatus {
  pending._('pending'),
  succeeded._('succeeded'),
  failed._('failed');

  const BookingPaymentStatus._(this.value);

  /// Creates a BookingPaymentStatus from a json value.
  factory BookingPaymentStatus.fromJson(String json) {
    return BookingPaymentStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown BookingPaymentStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static BookingPaymentStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return BookingPaymentStatus.fromJson(json);
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
