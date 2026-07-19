enum GuildNsfwContentLevel {
  default_._(0),
  explicit._(1),
  safe._(2),
  ageRestricted._(3);

  const GuildNsfwContentLevel._(this.value);

  /// Creates a GuildNsfwContentLevel from a json value.
  factory GuildNsfwContentLevel.fromJson(int json) {
    return GuildNsfwContentLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown GuildNsfwContentLevel value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GuildNsfwContentLevel? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return GuildNsfwContentLevel.fromJson(json);
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
