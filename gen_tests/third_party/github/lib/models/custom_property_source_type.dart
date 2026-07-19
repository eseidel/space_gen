/// The source type of the property
/// Example: `'organization'`
enum CustomPropertySourceType {
  organization._('organization'),
  enterprise._('enterprise');

  const CustomPropertySourceType._(this.value);

  /// Creates a CustomPropertySourceType from a json value.
  factory CustomPropertySourceType.fromJson(String json) {
    return CustomPropertySourceType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CustomPropertySourceType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CustomPropertySourceType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertySourceType.fromJson(json);
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
