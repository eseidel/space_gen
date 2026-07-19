/// State of a code scanning alert.
enum CodeScanningAlertStateQuery {
  open._('open'),
  closed._('closed'),
  dismissed._('dismissed'),
  fixed._('fixed');

  const CodeScanningAlertStateQuery._(this.value);

  /// Creates a CodeScanningAlertStateQuery from a json value.
  factory CodeScanningAlertStateQuery.fromJson(String json) {
    return CodeScanningAlertStateQuery.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAlertStateQuery value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAlertStateQuery? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAlertStateQuery.fromJson(json);
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
