/// Values whose sanitized identifiers collide — `in stock` and `in-stock` both
/// reduce to the same identifier. The generated enum must disambiguate rather
/// than declare it twice.
enum StockStatus {
  in_stock._('in stock'),
  in_stock2._('in-stock'),
  out_of_stock._('out of stock');

  const StockStatus._(this.value);

  /// Creates a StockStatus from a json value.
  factory StockStatus.fromJson(String json) {
    return StockStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown StockStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static StockStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return StockStatus.fromJson(json);
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
