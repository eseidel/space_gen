enum CodeScanningDefaultSetupLanguagesInner {
  actions._('actions'),
  cCpp._('c-cpp'),
  csharp._('csharp'),
  go._('go'),
  javaKotlin._('java-kotlin'),
  javascriptTypescript._('javascript-typescript'),
  javascript._('javascript'),
  python._('python'),
  ruby._('ruby'),
  typescript._('typescript'),
  swift._('swift');

  const CodeScanningDefaultSetupLanguagesInner._(this.value);

  /// Creates a CodeScanningDefaultSetupLanguagesInner from a json value.
  factory CodeScanningDefaultSetupLanguagesInner.fromJson(String json) {
    return CodeScanningDefaultSetupLanguagesInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupLanguagesInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupLanguagesInner? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupLanguagesInner.fromJson(json);
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
