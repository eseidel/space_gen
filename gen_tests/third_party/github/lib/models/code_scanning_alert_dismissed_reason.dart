// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// **Required when the state is dismissed.** The reason for dismissing or
/// closing the alert.
enum CodeScanningAlertDismissedReason {
  falsePositive._('false positive'),
  wontFix._("won't fix"),
  usedInTests._('used in tests');

  const CodeScanningAlertDismissedReason._(this.value);

  /// Creates a CodeScanningAlertDismissedReason from a json value.
  factory CodeScanningAlertDismissedReason.fromJson(String json) {
    return CodeScanningAlertDismissedReason.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertDismissedReason value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertDismissedReason? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertDismissedReason.fromJson(json);
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
