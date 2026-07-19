enum CreateLocationParameter1 {
  refresh._('refresh'),
  reject._('reject');

  const CreateLocationParameter1._(this.value);

  /// Creates a CreateLocationParameter1 from a json value.
  factory CreateLocationParameter1.fromJson(String json) {
    return CreateLocationParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CreateLocationParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CreateLocationParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CreateLocationParameter1.fromJson(json);
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
