/// The rendering mode.
/// Example: `'markdown'`
enum MarkdownRenderRequestMode {
  markdown._('markdown'),
  gfm._('gfm');

  const MarkdownRenderRequestMode._(this.value);

  /// Creates a MarkdownRenderRequestMode from a json value.
  factory MarkdownRenderRequestMode.fromJson(String json) {
    return MarkdownRenderRequestMode.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown MarkdownRenderRequestMode value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static MarkdownRenderRequestMode? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return MarkdownRenderRequestMode.fromJson(json);
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
