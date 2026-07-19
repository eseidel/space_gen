enum OrderParam {
  desc._('desc'),
  asc._('asc');

  const OrderParam._(this.value);

  /// Creates a OrderParam from a json value.
  factory OrderParam.fromJson(String json) {
    return OrderParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown OrderParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrderParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrderParam.fromJson(json);
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
