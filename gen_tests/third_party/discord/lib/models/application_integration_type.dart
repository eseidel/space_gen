enum ApplicationIntegrationType {
  /// For Guild install.
  guildInstall._(0),

  /// For User install.
  userInstall._(1);

  const ApplicationIntegrationType._(this.value);

  /// Creates a ApplicationIntegrationType from a json value.
  factory ApplicationIntegrationType.fromJson(int json) {
    return ApplicationIntegrationType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ApplicationIntegrationType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ApplicationIntegrationType? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return ApplicationIntegrationType.fromJson(json);
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
