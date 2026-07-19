enum SortStarredParam {
  created._('created'),
  updated._('updated');

  const SortStarredParam._(this.value);

  /// Creates a SortStarredParam from a json value.
  factory SortStarredParam.fromJson(String json) {
    return SortStarredParam.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown SortStarredParam value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SortStarredParam? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SortStarredParam.fromJson(json);
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
