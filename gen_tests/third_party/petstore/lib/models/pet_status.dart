/// pet status in the store
enum PetStatus {
  available._('available'),
  pending._('pending'),
  sold._('sold');

  const PetStatus._(this.value);

  /// Creates a PetStatus from a json value.
  factory PetStatus.fromJson(String json) {
    return PetStatus.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException('Unknown PetStatus value: $json'),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static PetStatus? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return PetStatus.fromJson(json);
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
