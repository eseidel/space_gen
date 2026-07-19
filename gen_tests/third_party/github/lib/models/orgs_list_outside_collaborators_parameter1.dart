enum OrgsListOutsideCollaboratorsParameter1 {
  n2faDisabled._('2fa_disabled'),
  n2faInsecure._('2fa_insecure'),
  all._('all');

  const OrgsListOutsideCollaboratorsParameter1._(this.value);

  /// Creates a OrgsListOutsideCollaboratorsParameter1 from a json value.
  factory OrgsListOutsideCollaboratorsParameter1.fromJson(String json) {
    return OrgsListOutsideCollaboratorsParameter1.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListOutsideCollaboratorsParameter1 value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListOutsideCollaboratorsParameter1? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListOutsideCollaboratorsParameter1.fromJson(json);
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
