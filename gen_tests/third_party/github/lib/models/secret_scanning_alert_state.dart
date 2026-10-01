// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Sets the state of the secret scanning alert. You must provide `resolution`
/// when you set the state to `resolved`.
enum SecretScanningAlertState {
  open._('open'),
  resolved._('resolved');

  const SecretScanningAlertState._(this.value);

  /// Creates a SecretScanningAlertState from a json value.
  factory SecretScanningAlertState.fromJson(String json) {
    return SecretScanningAlertState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown SecretScanningAlertState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static SecretScanningAlertState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningAlertState.fromJson(json);
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
