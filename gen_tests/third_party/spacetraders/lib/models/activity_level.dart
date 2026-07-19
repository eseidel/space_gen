/// The activity level of a trade good. If the good is an import, this
/// represents how strong consumption is. If the good is an export, this
/// represents how strong the production is for the good. When activity is
/// strong, consumption or production is near maximum capacity. When activity is
/// weak, consumption or production is near minimum capacity.
enum ActivityLevel {
  weak._('WEAK'),
  growing._('GROWING'),
  strong._('STRONG'),
  restricted._('RESTRICTED');

  const ActivityLevel._(this.value);

  /// Creates a ActivityLevel from a json value.
  factory ActivityLevel.fromJson(String json) {
    return ActivityLevel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ActivityLevel value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActivityLevel? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActivityLevel.fromJson(json);
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
