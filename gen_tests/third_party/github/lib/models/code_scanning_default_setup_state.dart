/// Code scanning default setup has been configured or not.
enum CodeScanningDefaultSetupState {
  configured._('configured'),
  notConfigured._('not-configured');

  const CodeScanningDefaultSetupState._(this.value);

  /// Creates a CodeScanningDefaultSetupState from a json value.
  factory CodeScanningDefaultSetupState.fromJson(String json) {
    return CodeScanningDefaultSetupState.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupState value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupState? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupState.fromJson(json);
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
