enum TotalItemsParam {
  include._('include'),
  exclude._('exclude');

  const TotalItemsParam._(this.value);

  /// Creates a TotalItemsParam from a json value.
  factory TotalItemsParam.fromJson(String json) {
    return TotalItemsParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TotalItemsParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TotalItemsParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TotalItemsParam.fromJson(json);
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
