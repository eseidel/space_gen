enum ApplicationExplicitContentFilterTypes {
  /// inherit guild content filter setting
  inherit._(0),

  /// interactions will always be scanned
  always._(1);

  const ApplicationExplicitContentFilterTypes._(this.value);

  /// Creates a ApplicationExplicitContentFilterTypes from a json value.
  factory ApplicationExplicitContentFilterTypes.fromJson(int json) {
    return ApplicationExplicitContentFilterTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationExplicitContentFilterTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationExplicitContentFilterTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationExplicitContentFilterTypes.fromJson(json);
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
