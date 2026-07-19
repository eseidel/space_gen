enum ThreadSearchTagSetting {
  /// The thread tags must contain all tags in the search query
  matchAll._('match_all'),

  /// The thread tags must contain at least one of tags in the search query
  matchSome._('match_some');

  const ThreadSearchTagSetting._(this.value);

  /// Creates a ThreadSearchTagSetting from a json value.
  factory ThreadSearchTagSetting.fromJson(String json) {
    return ThreadSearchTagSetting.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ThreadSearchTagSetting value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ThreadSearchTagSetting? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ThreadSearchTagSetting.fromJson(json);
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
