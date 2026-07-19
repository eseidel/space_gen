enum ApplicationCommandPermissionType {
  /// This permission is for a role.
  role._(1),

  /// This permission is for a user.
  user._(2),

  /// This permission is for a channel.
  channel._(3);

  const ApplicationCommandPermissionType._(this.value);

  /// Creates a ApplicationCommandPermissionType from a json value.
  factory ApplicationCommandPermissionType.fromJson(int json) {
    return ApplicationCommandPermissionType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationCommandPermissionType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationCommandPermissionType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationCommandPermissionType.fromJson(json);
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
