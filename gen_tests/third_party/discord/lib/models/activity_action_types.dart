enum ActivityActionTypes {
  join._(1),
  spectate._(2),
  listen._(3),
  joinRequest._(5),
  streamRequest._(6);

  const ActivityActionTypes._(this.value);

  /// Creates a ActivityActionTypes from a json value.
  factory ActivityActionTypes.fromJson(int json) {
    return ActivityActionTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ActivityActionTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActivityActionTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ActivityActionTypes.fromJson(json);
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
