enum UpdatePreferencesRequestVisibility {
  public._('public'),
  private._('private'),
  unlisted._('unlisted');

  const UpdatePreferencesRequestVisibility._(this.value);

  /// Creates a UpdatePreferencesRequestVisibility from a json value.
  factory UpdatePreferencesRequestVisibility.fromJson(String json) {
    return UpdatePreferencesRequestVisibility.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown UpdatePreferencesRequestVisibility value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static UpdatePreferencesRequestVisibility? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return UpdatePreferencesRequestVisibility.fromJson(json);
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
