enum ReposListCollaboratorsParameter2 {
  outside._('outside'),
  direct._('direct'),
  all._('all');

  const ReposListCollaboratorsParameter2._(this.value);

  /// Creates a ReposListCollaboratorsParameter2 from a json value.
  factory ReposListCollaboratorsParameter2.fromJson(String json) {
    return ReposListCollaboratorsParameter2.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposListCollaboratorsParameter2 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposListCollaboratorsParameter2? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposListCollaboratorsParameter2.fromJson(json);
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
