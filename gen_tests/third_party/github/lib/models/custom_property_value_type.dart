/// The type of the value for the property
/// Example: `'single_select'`
enum CustomPropertyValueType {
  string._('string'),
  singleSelect._('single_select'),
  multiSelect._('multi_select'),
  trueFalse._('true_false');

  const CustomPropertyValueType._(this.value);

  /// Creates a CustomPropertyValueType from a json value.
  factory CustomPropertyValueType.fromJson(String json) {
    return CustomPropertyValueType.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown CustomPropertyValueType value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CustomPropertyValueType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertyValueType.fromJson(json);
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
