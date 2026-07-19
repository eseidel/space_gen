/// Who can edit the values of the property
/// Example: `'org_actors'`
enum CustomPropertySetPayloadValuesEditableBy {
  orgActors._('org_actors'),
  orgAndRepoActors._('org_and_repo_actors');

  const CustomPropertySetPayloadValuesEditableBy._(this.value);

  /// Creates a CustomPropertySetPayloadValuesEditableBy from a json value.
  factory CustomPropertySetPayloadValuesEditableBy.fromJson(String json) {
    return CustomPropertySetPayloadValuesEditableBy.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CustomPropertySetPayloadValuesEditableBy value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CustomPropertySetPayloadValuesEditableBy? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CustomPropertySetPayloadValuesEditableBy.fromJson(json);
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
