/// State of a code scanning alert.
enum CodeScanningAlertState {
  open._('open'),
  dismissed._('dismissed'),
  fixed._('fixed');

  const CodeScanningAlertState._(this.value);

  /// Creates a CodeScanningAlertState from a json value.
  factory CodeScanningAlertState.fromJson(String json) {
    return CodeScanningAlertState.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CodeScanningAlertState value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertState.fromJson(json);
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
