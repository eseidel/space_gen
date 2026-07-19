/// **Closing down notice**. The permission that new repositories will be added
/// to the team with when none is specified.
enum TeamsUpdateLegacyRequestPermission {
  pull._('pull'),
  push._('push'),
  admin._('admin');

  const TeamsUpdateLegacyRequestPermission._(this.value);

  /// Creates a TeamsUpdateLegacyRequestPermission from a json value.
  factory TeamsUpdateLegacyRequestPermission.fromJson(String json) {
    return TeamsUpdateLegacyRequestPermission.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown TeamsUpdateLegacyRequestPermission value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TeamsUpdateLegacyRequestPermission? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return TeamsUpdateLegacyRequestPermission.fromJson(json);
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
