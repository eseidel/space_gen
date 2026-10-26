enum OrgsListOutsideCollaboratorsFilter {
  n2faDisabled._('2fa_disabled'),
  n2faInsecure._('2fa_insecure'),
  all._('all');

  const OrgsListOutsideCollaboratorsFilter._(this.value);

  /// Creates a OrgsListOutsideCollaboratorsFilter from a json value.
  factory OrgsListOutsideCollaboratorsFilter.fromJson(String json) {
    return OrgsListOutsideCollaboratorsFilter.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown OrgsListOutsideCollaboratorsFilter value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsListOutsideCollaboratorsFilter? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsListOutsideCollaboratorsFilter.fromJson(json);
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
