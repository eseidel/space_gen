enum ForumLayout {
  /// No default has been set for forum channel
  default_._(0),

  /// Display posts as a list
  list._(1),

  /// Display posts as a collection of tiles
  grid._(2);

  const ForumLayout._(this.value);

  /// Creates a ForumLayout from a json value.
  factory ForumLayout.fromJson(int json) {
    return ForumLayout.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown ForumLayout value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ForumLayout? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ForumLayout.fromJson(json);
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
