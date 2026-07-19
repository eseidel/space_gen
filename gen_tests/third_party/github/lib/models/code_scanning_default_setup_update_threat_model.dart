/// Threat model to be used for code scanning analysis. Use `remote` to analyze
/// only network sources and `remote_and_local` to include local sources like
/// filesystem access, command-line arguments, database reads, environment
/// variable and standard input.
enum CodeScanningDefaultSetupUpdateThreatModel {
  remote._('remote'),
  remoteAndLocal._('remote_and_local');

  const CodeScanningDefaultSetupUpdateThreatModel._(this.value);

  /// Creates a CodeScanningDefaultSetupUpdateThreatModel from a json value.
  factory CodeScanningDefaultSetupUpdateThreatModel.fromJson(String json) {
    return CodeScanningDefaultSetupUpdateThreatModel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupUpdateThreatModel value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupUpdateThreatModel? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupUpdateThreatModel.fromJson(json);
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
