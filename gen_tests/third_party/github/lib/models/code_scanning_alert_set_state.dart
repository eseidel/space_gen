// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Sets the state of the code scanning alert. You must provide
/// `dismissed_reason` when you set the state to `dismissed`.
enum CodeScanningAlertSetState {
  open._('open'),
  dismissed._('dismissed');

  const CodeScanningAlertSetState._(this.value);

  /// Creates a CodeScanningAlertSetState from a json value.
  factory CodeScanningAlertSetState.fromJson(String json) {
    return CodeScanningAlertSetState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertSetState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertSetState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertSetState.fromJson(json);
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
