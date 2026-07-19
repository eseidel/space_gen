enum FindPetsByStatusParameter0 {
  available._('available'),
  pending._('pending'),
  sold._('sold');

  const FindPetsByStatusParameter0._(this.value);

  /// Creates a FindPetsByStatusParameter0 from a json value.
  factory FindPetsByStatusParameter0.fromJson(String json) {
    return FindPetsByStatusParameter0.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown FindPetsByStatusParameter0 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FindPetsByStatusParameter0? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FindPetsByStatusParameter0.fromJson(json);
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
