/// The language targeted by the CodeQL query
enum CodeScanningVariantAnalysisLanguage {
  cpp._('cpp'),
  csharp._('csharp'),
  go._('go'),
  java._('java'),
  javascript._('javascript'),
  python._('python'),
  ruby._('ruby'),
  rust._('rust'),
  swift._('swift');

  const CodeScanningVariantAnalysisLanguage._(this.value);

  /// Creates a CodeScanningVariantAnalysisLanguage from a json value.
  factory CodeScanningVariantAnalysisLanguage.fromJson(String json) {
    return CodeScanningVariantAnalysisLanguage.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningVariantAnalysisLanguage value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningVariantAnalysisLanguage? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningVariantAnalysisLanguage.fromJson(json);
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
