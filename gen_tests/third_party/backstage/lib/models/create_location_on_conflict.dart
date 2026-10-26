enum CreateLocationOnConflict {
  refresh._('refresh'),
  reject._('reject');

  const CreateLocationOnConflict._(this.value);

  /// Creates a CreateLocationOnConflict from a json value.
  factory CreateLocationOnConflict.fromJson(String json) {
    return CreateLocationOnConflict.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown CreateLocationOnConflict value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static CreateLocationOnConflict? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return CreateLocationOnConflict.fromJson(json);
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
