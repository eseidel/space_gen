enum StageInstancesPrivacyLevels {
  /// The Stage instance is visible publicly. (deprecated)
  public._(1),

  /// The Stage instance is visible publicly. (deprecated)
  guildOnly._(2);

  const StageInstancesPrivacyLevels._(this.value);

  /// Creates a StageInstancesPrivacyLevels from a json value.
  factory StageInstancesPrivacyLevels.fromJson(int json) {
    return StageInstancesPrivacyLevels.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown StageInstancesPrivacyLevels value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static StageInstancesPrivacyLevels? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return StageInstancesPrivacyLevels.fromJson(json);
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
