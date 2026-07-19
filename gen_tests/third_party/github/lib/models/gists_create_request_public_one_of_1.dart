/// Example: `'true'`
enum GistsCreateRequestPublicOneOf1 {
  true_._('true'),
  false_._('false');

  const GistsCreateRequestPublicOneOf1._(this.value);

  /// Creates a GistsCreateRequestPublicOneOf1 from a json value.
  factory GistsCreateRequestPublicOneOf1.fromJson(String json) {
    return GistsCreateRequestPublicOneOf1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown GistsCreateRequestPublicOneOf1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static GistsCreateRequestPublicOneOf1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return GistsCreateRequestPublicOneOf1.fromJson(json);
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
