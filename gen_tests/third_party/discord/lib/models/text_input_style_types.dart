enum TextInputStyleTypes {
  /// Single-line input
  short._(1),

  /// Multi-line input
  paragraph._(2);

  const TextInputStyleTypes._(this.value);

  /// Creates a TextInputStyleTypes from a json value.
  factory TextInputStyleTypes.fromJson(int json) {
    return TextInputStyleTypes.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown TextInputStyleTypes value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static TextInputStyleTypes? maybeFromJson(int? json) {
    if (json == null) {
      return null;
    }
    return TextInputStyleTypes.fromJson(json);
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final int value;

  /// Converts the enum to its json value.
  int toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value.toString();
}
