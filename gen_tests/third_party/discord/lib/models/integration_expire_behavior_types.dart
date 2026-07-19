enum IntegrationExpireBehaviorTypes {
  /// Remove role
  removeRole._(0),

  /// Kick
  kick._(1);

  const IntegrationExpireBehaviorTypes._(this.value);

  /// Creates a IntegrationExpireBehaviorTypes from a json value.
  factory IntegrationExpireBehaviorTypes.fromJson(int json) {
    return IntegrationExpireBehaviorTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown IntegrationExpireBehaviorTypes value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static IntegrationExpireBehaviorTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return IntegrationExpireBehaviorTypes.fromJson(json);
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
