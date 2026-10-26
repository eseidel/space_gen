enum FindPetsByStatusStatus {
  available._('available'),
  pending._('pending'),
  sold._('sold');

  const FindPetsByStatusStatus._(this.value);

  /// Creates a FindPetsByStatusStatus from a json value.
  factory FindPetsByStatusStatus.fromJson(String json) {
    return FindPetsByStatusStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () =>
          throw FormatException('Unknown FindPetsByStatusStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static FindPetsByStatusStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return FindPetsByStatusStatus.fromJson(json);
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
