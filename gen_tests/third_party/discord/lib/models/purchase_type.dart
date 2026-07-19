enum PurchaseType {
  guildProduct._(0);

  const PurchaseType._(this.value);

  /// Creates a PurchaseType from a json value.
  factory PurchaseType.fromJson(int json) {
    return PurchaseType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PurchaseType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PurchaseType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return PurchaseType.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
