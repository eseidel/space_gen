// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The status of the runner.
/// Example: `'Ready'`
enum ActionsHostedRunnerStatus {
  ready._('Ready'),
  provisioning._('Provisioning'),
  shutdown._('Shutdown'),
  deleting._('Deleting'),
  stuck._('Stuck');

  const ActionsHostedRunnerStatus._(this.value);

  /// Creates a ActionsHostedRunnerStatus from a json value.
  factory ActionsHostedRunnerStatus.fromJson(String json) {
    return ActionsHostedRunnerStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ActionsHostedRunnerStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ActionsHostedRunnerStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ActionsHostedRunnerStatus.fromJson(json);
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
