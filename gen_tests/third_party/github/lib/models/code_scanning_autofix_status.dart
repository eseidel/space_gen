/// The status of an autofix.
enum CodeScanningAutofixStatus {
  pending._('pending'),
  error._('error'),
  success._('success'),
  outdated._('outdated');

  const CodeScanningAutofixStatus._(this.value);

  /// Creates a CodeScanningAutofixStatus from a json value.
  factory CodeScanningAutofixStatus.fromJson(String json) {
    return CodeScanningAutofixStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningAutofixStatus value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningAutofixStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningAutofixStatus.fromJson(json);
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
