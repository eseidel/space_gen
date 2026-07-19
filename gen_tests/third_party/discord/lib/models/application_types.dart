enum ApplicationTypes {
  guildRoleSubscriptions._(4);

  const ApplicationTypes._(this.value);

  /// Creates a ApplicationTypes from a json value.
  factory ApplicationTypes.fromJson(int json) {
    return ApplicationTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown ApplicationTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationTypes.fromJson(json);
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
