/// Threat model to be used for code scanning analysis. Use `remote` to analyze
/// only network sources and `remote_and_local` to include local sources like
/// filesystem access, command-line arguments, database reads, environment
/// variable and standard input.
enum CodeScanningDefaultSetupThreatModel {
  remote._('remote'),
  remoteAndLocal._('remote_and_local');

  const CodeScanningDefaultSetupThreatModel._(this.value);

  /// Creates a CodeScanningDefaultSetupThreatModel from a json value.
  factory CodeScanningDefaultSetupThreatModel.fromJson(String json) {
    return CodeScanningDefaultSetupThreatModel.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupThreatModel value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupThreatModel? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupThreatModel.fromJson(json);
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
