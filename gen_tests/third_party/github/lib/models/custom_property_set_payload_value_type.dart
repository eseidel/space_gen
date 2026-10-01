// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
/// The type of the value for the property
/// Example: `'single_select'`
enum CustomPropertySetPayloadValueType {
  string._('string'),
  singleSelect._('single_select'),
  multiSelect._('multi_select'),
  trueFalse._('true_false');

  const CustomPropertySetPayloadValueType._(this.value);

  /// Creates a CustomPropertySetPayloadValueType from a json value.
  factory CustomPropertySetPayloadValueType.fromJson(String json) {
    return CustomPropertySetPayloadValueType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CustomPropertySetPayloadValueType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CustomPropertySetPayloadValueType? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertySetPayloadValueType.fromJson(json);
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
