/// Whether to approve or reject deployment to the specified environments.
enum ReviewCustomGatesStateRequiredState {
  approved._('approved'),
  rejected._('rejected');

  const ReviewCustomGatesStateRequiredState._(this.value);

  /// Creates a ReviewCustomGatesStateRequiredState from a json value.
  factory ReviewCustomGatesStateRequiredState.fromJson(String json) {
    return ReviewCustomGatesStateRequiredState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReviewCustomGatesStateRequiredState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReviewCustomGatesStateRequiredState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReviewCustomGatesStateRequiredState.fromJson(json);
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
