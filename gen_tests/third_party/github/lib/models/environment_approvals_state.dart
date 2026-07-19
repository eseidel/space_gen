/// Whether deployment to the environment(s) was approved or rejected or pending
/// (with comments)
/// Example: `'approved'`
enum EnvironmentApprovalsState {
  approved._('approved'),
  rejected._('rejected'),
  pending._('pending');

  const EnvironmentApprovalsState._(this.value);

  /// Creates a EnvironmentApprovalsState from a json value.
  factory EnvironmentApprovalsState.fromJson(String json) {
    return EnvironmentApprovalsState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown EnvironmentApprovalsState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static EnvironmentApprovalsState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return EnvironmentApprovalsState.fromJson(json);
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
