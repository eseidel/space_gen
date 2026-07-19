/// The Copilot plan of the organization, or the parent enterprise, when
/// applicable.
enum CopilotSeatDetailsPlanType {
  business._('business'),
  enterprise._('enterprise'),
  unknown._('unknown');

  const CopilotSeatDetailsPlanType._(this.value);

  /// Creates a CopilotSeatDetailsPlanType from a json value.
  factory CopilotSeatDetailsPlanType.fromJson(String json) {
    return CopilotSeatDetailsPlanType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CopilotSeatDetailsPlanType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CopilotSeatDetailsPlanType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CopilotSeatDetailsPlanType.fromJson(json);
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
