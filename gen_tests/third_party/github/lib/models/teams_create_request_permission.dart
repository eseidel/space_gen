/// **Closing down notice**. The permission that new repositories will be added
/// to the team with when none is specified.
enum TeamsCreateRequestPermission {
  pull._('pull'),
  push._('push');

  const TeamsCreateRequestPermission._(this.value);

  /// Creates a TeamsCreateRequestPermission from a json value.
  factory TeamsCreateRequestPermission.fromJson(String json) {
    return TeamsCreateRequestPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsCreateRequestPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsCreateRequestPermission? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsCreateRequestPermission.fromJson(json);
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
