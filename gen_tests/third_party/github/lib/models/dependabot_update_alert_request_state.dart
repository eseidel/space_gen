// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The state of the Dependabot alert.
/// A `dismissed_reason` must be provided when setting the state to `dismissed`.
enum DependabotUpdateAlertRequestState {
  dismissed._('dismissed'),
  open._('open');

  const DependabotUpdateAlertRequestState._(this.value);

  /// Creates a DependabotUpdateAlertRequestState from a json value.
  factory DependabotUpdateAlertRequestState.fromJson(String json) {
    return DependabotUpdateAlertRequestState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotUpdateAlertRequestState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotUpdateAlertRequestState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DependabotUpdateAlertRequestState.fromJson(json);
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
