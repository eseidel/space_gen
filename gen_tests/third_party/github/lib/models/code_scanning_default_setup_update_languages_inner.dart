enum CodeScanningDefaultSetupUpdateLanguagesInner {
  actions._('actions'),
  cCpp._('c-cpp'),
  csharp._('csharp'),
  go._('go'),
  javaKotlin._('java-kotlin'),
  javascriptTypescript._('javascript-typescript'),
  python._('python'),
  ruby._('ruby'),
  swift._('swift');

  const CodeScanningDefaultSetupUpdateLanguagesInner._(this.value);

  /// Creates a CodeScanningDefaultSetupUpdateLanguagesInner from a json value.
  factory CodeScanningDefaultSetupUpdateLanguagesInner.fromJson(String json) {
    return CodeScanningDefaultSetupUpdateLanguagesInner.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CodeScanningDefaultSetupUpdateLanguagesInner value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CodeScanningDefaultSetupUpdateLanguagesInner? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodeScanningDefaultSetupUpdateLanguagesInner.fromJson(json);
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
