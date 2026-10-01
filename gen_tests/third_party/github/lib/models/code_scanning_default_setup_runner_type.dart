// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// Runner type to be used.
enum CodeScanningDefaultSetupRunnerType {
  standard._('standard'),
  labeled._('labeled');

  const CodeScanningDefaultSetupRunnerType._(this.value);

  /// Creates a CodeScanningDefaultSetupRunnerType from a json value.
  factory CodeScanningDefaultSetupRunnerType.fromJson(String json) {
    return CodeScanningDefaultSetupRunnerType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupRunnerType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupRunnerType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupRunnerType.fromJson(json);
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
