enum DirectionParam {
  asc._('asc'),
  desc._('desc');

  const DirectionParam._(this.value);

  /// Creates a DirectionParam from a json value.
  factory DirectionParam.fromJson(String json) {
    return DirectionParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown DirectionParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DirectionParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DirectionParam.fromJson(json);
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
