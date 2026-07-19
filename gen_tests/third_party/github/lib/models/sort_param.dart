enum SortParam {
  created._('created'),
  updated._('updated');

  const SortParam._(this.value);

  /// Creates a SortParam from a json value.
  factory SortParam.fromJson(String json) {
    return SortParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown SortParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SortParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SortParam.fromJson(json);
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
